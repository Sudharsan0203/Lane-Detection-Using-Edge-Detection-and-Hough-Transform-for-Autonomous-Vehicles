% Define the input and output directories
inputFolder = 'C:\Sudharsan\Projects\ADAS projects\Lane detection\Lane detection inputs1'; % Folder containing input images
outputFolder = 'C:\Sudharsan\Projects\ADAS projects\Lane detection\Lane detection outputs2'; % Folder to save output images

% Create the output folder if it doesn't exist
if ~exist(outputFolder, 'dir')
    mkdir(outputFolder);
end

% Get a list of all image files in the input folder
imageFiles = dir(fullfile(inputFolder, '*.png')); % Change extension if needed (e.g., '*.jpg')

% Loop through each image in the dataset
for i = 1:length(imageFiles)
    % Read the input image
    inputFile = fullfile(inputFolder, imageFiles(i).name);
    img = imread(inputFile);

    %% Step 3: Lane Detection (Enhanced Accuracy)
    % Step 3.1: Preprocess the Image
    grayImg = rgb2gray(img);             % Convert to grayscale
    blurredImg = imgaussfilt(grayImg, 2); % Apply Gaussian blur
    edges = edge(blurredImg, 'Canny', [0.1, 0.3]); % Adjust thresholds for edge detection

    % Step 3.2: Define Enhanced ROI with Accurate Masking
    [rows, cols] = size(edges);
    roiVertices = [0, rows; cols / 3, rows / 2; 2 * cols / 3, rows / 2; cols, rows]; % Custom polygon
    roiMask = poly2mask(roiVertices(:,1), roiVertices(:,2), rows, cols);
    maskedEdges = edges .* roiMask; % Apply the mask

    % Step 3.3: Lane Segmentation Using Color
    hsvImg = rgb2hsv(img); % Convert to HSV
    yellowMask = (hsvImg(:,:,1) > 0.1 & hsvImg(:,:,1) < 0.2) & ... % Hue for yellow
                 (hsvImg(:,:,2) > 0.4 & hsvImg(:,:,2) < 1.0) & ... % Saturation
                 (hsvImg(:,:,3) > 0.6);                           % Brightness
    whiteMask = (grayImg > 200); % Bright regions for white lanes
    laneMask = yellowMask | whiteMask; % Combine both

    % Overlay lane mask
    laneEdges = laneMask & roiMask; % Refine mask with ROI
    laneEdges = imdilate(laneEdges, strel('line', 5, 90)); % Optional dilation for continuity

    % Step 3.4: Hough Transform for Lane Lines
    [H, theta, rho] = hough(laneEdges); % Perform Hough Transform
    peaks = houghpeaks(H, 10, 'threshold', ceil(0.3 * max(H(:)))); % Find peaks
    lines = houghlines(laneEdges, theta, rho, peaks);

    % Step 3.5: Polynomial Fitting for Curved Lanes
    leftLineX = []; leftLineY = [];
    rightLineX = []; rightLineY = [];
    for k = 1:length(lines)
        xy = [lines(k).point1; lines(k).point2];
        slope = (xy(2,2) - xy(1,2)) / (xy(2,1) - xy(1,1));
        if slope < -0.5 % Left lane (adjust slope threshold as needed)
            leftLineX = [leftLineX; xy(:,1)];
            leftLineY = [leftLineY; xy(:,2)];
        elseif slope > 0.5 % Right lane
            rightLineX = [rightLineX; xy(:,1)];
            rightLineY = [rightLineY; xy(:,2)];
        end
    end

    % Fit polynomials for lanes
    plotY = linspace(rows / 2, rows, 100); % Y-coordinates for plotting
    if length(leftLineY) > 2 % Ensure at least 3 points for fitting
        leftFit = polyfit(leftLineY, leftLineX, 2);
        leftPlotX = polyval(leftFit, plotY);
    else
        leftPlotX = []; % No valid fit
    end

    if length(rightLineY) > 2 % Ensure at least 3 points for fitting
        rightFit = polyfit(rightLineY, rightLineX, 2);
        rightPlotX = polyval(rightFit, plotY);
    else
        rightPlotX = []; % No valid fit
    end

    % Overlay lanes on the original image
    figure;
    imshow(img);
    hold on;
    if ~isempty(leftPlotX)
        plot(leftPlotX, plotY, 'LineWidth', 3, 'Color', 'cyan');
    end
    if ~isempty(rightPlotX)
        plot(rightPlotX, plotY, 'LineWidth', 3, 'Color', 'cyan');
    end
    title('Tracked Lane');
    hold off;

    % Save the output image
    outputFile = fullfile(outputFolder, ['output_' imageFiles(i).name]);
    saveas(gcf, outputFile); % Save the figure as an image
    close(gcf); % Close the figure to save memory
end

disp('Lane detection completed for all images in the dataset.');

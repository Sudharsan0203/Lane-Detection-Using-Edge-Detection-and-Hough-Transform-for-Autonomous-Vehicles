# Lane Detection Using Edge Detection and Hough Transform for Autonomous Vehicles


This project implements a lane detection algorithm using MATLAB, focusing on computer vision techniques such as edge detection, color segmentation, and the Hough Transform. Polynomial fitting is employed for accurate curved lane tracking, ensuring continuity and robustness. The algorithm is tested on the KITTI dataset and optimized for real-world scenarios with varied lighting and road conditions.

---

## **Features**
- Edge Detection (Canny) for identifying lane boundaries.
- HSV-based Color Segmentation for isolating lane markings.
- Region of Interest (ROI) masking for focused detection.
- Hough Transform for line detection and fitting.
- Polynomial Curve Fitting for precise curved lane tracking.
- Scalability enhancements for diverse environmental conditions.

---

## **Prerequisites**
1. **MATLAB** (Tested on R2023a) with:
   - Image Processing Toolbox
   - Computer Vision Toolbox
2. **KITTI Dataset**: [Download here](http://www.cvlibs.net/datasets/kitti/)
3. Basic understanding of MATLAB scripting.

---

## **Setup and Usage**

### 1. Clone the Repository
```bash
git clone https://github.com/yourusername/lane-detection-matlab.git
cd lane-detection-matlab
```

### 2. Organize the Dataset
Place the input images from the KITTI dataset in the `inputs` folder within the repository directory.

### 3. Run the Script
1. Open `lane_detection.m` in MATLAB.
2. Update the `inputFolder` and `outputFolder` variables with the correct paths to your input images and desired output directory.
3. Execute the script to process all images in the input folder.

### 4. View Results
Processed images with overlaid lane markings are saved in the output directory specified.

---

## **Folder Structure**
```
|-- lane-detection-matlab
    |-- inputs/          # Input images (from KITTI dataset)
    |-- outputs/         # Output images (processed results)
    |-- lane_detection.m # Main MATLAB script
```

---

## **Key MATLAB Functions Used**
- `imread`, `imshow`, `imwrite` for image handling.
- `rgb2gray`, `imgaussfilt`, `edge` for preprocessing and edge detection.
- `poly2mask` for ROI masking.
- `hough`, `houghpeaks`, `houghlines` for Hough Transform.
- `polyfit`, `polyval` for polynomial curve fitting.

---

## **Sample Output**
The algorithm processes input images to detect lanes and overlays the detected lanes on the original image:

![Sample Output](path/to/sample_output.png)

---

## **Future Enhancements**
- Integration with video data for real-time lane detection.
- Enhancement of robustness under extreme weather conditions.
- Addition of deep learning techniques for improved accuracy.

---

## **License**
This project is licensed under the [MIT License](LICENSE).

---

## **Contributions**
Contributions are welcome! Please create a pull request for any updates or improvements.

---

## **Contact**
For questions or collaborations, feel free to reach out:
- **Name**: Sudharsan
- **Email**: [your.email@example.com](mailto:your.email@example.com)
- **LinkedIn**: [Your LinkedIn Profile](https://www.linkedin.com/in/your-profile)

# Lane Detection Using Edge Detection and Hough Transform for Autonomous Vehicles


This project implements a lane detection algorithm using MATLAB, focusing on computer vision techniques such as edge detection, color segmentation, and the Hough Transform. Polynomial fitting is employed for accurate curved lane tracking, ensuring continuity and robustness. The algorithm is tested on the KITTI dataset and optimized for real-world scenarios with varied lighting and road conditions.

---

## **Motivation for the Project**

Lane detection is a fundamental aspect of autonomous driving systems, enabling vehicles to perceive and navigate roads accurately. By identifying lane boundaries, autonomous vehicles can maintain lane discipline, ensure safer driving, and execute maneuvers like lane changes and turns effectively. Given the varying road conditions, lighting, and lane marking styles encountered in real-world scenarios, developing a robust lane detection algorithm is critical for enhancing the reliability and safety of autonomous vehicles. This project aims to address these challenges by implementing a scalable and efficient lane detection algorithm, making it adaptable to diverse environmental conditions.

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

### 1. MATLAB Software
- **Version:** This project has been tested on MATLAB R2024b. While the algorithm may work on earlier versions, some functions or features might require modifications for compatibility. For the best experience, it is recommended to use MATLAB R2024b or a newer version.
- **Download MATLAB:** You can download MATLAB from the [MathWorks Official Website](https://www.mathworks.com/products/matlab.html).

### 2. Required MATLAB Toolboxes
To run the lane detection algorithm, the following toolboxes must be installed in your MATLAB environment:
- **Image Processing Toolbox**: Essential for image handling, preprocessing, and edge detection.
- **Computer Vision Toolbox**: Used for advanced image processing tasks, such as Hough Transform.

#### Installing Toolboxes
1. Open MATLAB.
2. Navigate to **Home > Add-Ons > Get Add-Ons**.
3. In the search bar, type the name of the required toolbox (e.g., "Image Processing Toolbox").
4. Click **Add** to install the toolbox.

### 3. KITTI Dataset
- The algorithm is tested on images from the **KITTI dataset**, a standard dataset used for benchmarking computer vision algorithms in autonomous driving.
- **Download the KITTI Dataset:** Visit the [KITTI Official Website](http://www.cvlibs.net/datasets/kitti/).
- After downloading, extract the dataset and organize the images as instructed in the **Setup and Usage** section.

### 4. Basic MATLAB Knowledge
- A fundamental understanding of MATLAB scripting, folder navigation, and function handling is required to run the scripts, modify parameters, and interpret the results effectively.


---

## **Setup and Usage**

### 1. Clone the Repository
```bash
git clone https://github.com/Sudharsan0203/Lane-Detection-Using-Edge-Detection-and-Hough-Transform-for-Autonomous-Vehicles.git
cd Lane-Detection-Using-Edge-Detection-and-Hough-Transform-for-Autonomous-Vehicles
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
Lane-Detection-Using-Edge-Detection-and-Hough-Transform-for-Autonomous-Vehicles/
├── input_images/
│   ├── input_01.png
│   ├── input_02.png
│   ├── input_03.png
│   ├── input_04.png
│   ├── input_05.png
│   ├── input_06.png
│   ├── input_07.png
│   ├── input_08.png
│   ├── input_09.png
│   ├── input_10.png
├── output_images/
│   ├── output_01.png
│   ├── output_02.png
│   ├── output_03.png
│   ├── output_04.png
│   ├── output_05.png
│   ├── output_06.png
│   ├── output_07.png
│   ├── output_08.png
│   ├── output_09.png
│   ├── output_10.png
├── lane_detection.m
├── preprocess_image.m
├── README.md
├── LICENSE
├── requirements.txt
├── DATASET.md
├── .gitignore

```

---

## **Key MATLAB Functions Used**
- `imread`, `imshow`, `imwrite` for image handling.
- `rgb2gray`, `imgaussfilt`, `edge` for preprocessing and edge detection.
- `poly2mask` for ROI masking.
- `hough`, `houghpeaks`, `houghlines` for Hough Transform.
- `polyfit`, `polyval` for polynomial curve fitting.

---

## **Sample Input and Output**
The algorithm processes input images to detect lanes and overlays the detected lanes on the original image:

| Input Image               | Output Image              |
|---------------------------|---------------------------|
| ![Input](assets/input_01.png) | ![Output](assets/output_01.png) |

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
- **Name**: Sudharsan N
- **Email**: [your.email@example.com](mailto:your.email@example.com)
- **LinkedIn**: [Your LinkedIn Profile](https://www.linkedin.com/in/your-profile)

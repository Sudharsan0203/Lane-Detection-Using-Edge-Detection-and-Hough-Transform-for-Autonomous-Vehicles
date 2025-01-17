# **Dataset Information**

This project relies on input images for lane detection. The following sections provide details about the dataset used and instructions on how to organize it in your project repository.

---

## **1. Dataset Description**
The dataset includes road images containing lanes captured in various lighting and weather conditions. These images are used to test and validate the lane detection algorithm.

### Features:
- **Format:** PNG/JPEG
- **Resolution:** 1280x720 or higher recommended
- **Categories:**
  - Daytime roads
  - Nighttime roads
  - Roads with curved and straight lanes
  - Roads with multiple lanes

---

## **2. Download Instructions**
If using a public dataset, such as the KITTI dataset, follow these steps:

### Option 1: KITTI Dataset
1. Visit the [KITTI Vision Benchmark Suite](http://www.cvlibs.net/datasets/kitti/).
2. Download the **Road and Lane Detection Evaluation 2015** dataset.
3. Extract the dataset to your local machine.

---

## **3. Folder Organization**
Once the dataset is downloaded, organize it as follows within the project folder:

```bash
lane-detection/ 
├── input_images/ # Store raw input images 
│ ├── frame1.png 
│ ├── frame2.png 
│ ├── ... 
├── output_images/ # Generated output images
│ ├── result1.png
│ ├── result2.png
│ ├── ...
```


### Notes:
- Save all input images in the `input_images/` folder.
- Save the processed or output images in the `output_images/` folder for reference.

---

## **4. Sample Images**
For convenience, a few sample images are provided in the `input_images/` folder of this repository. You can add additional images by downloading them or using your own.

### Sample Input Files:
- `frame1.png`
- `frame2.png`

### Sample Output Files:
- `result1.png` (detected lanes overlayed on `frame1.png`)
- `result2.png` (detected lanes overlayed on `frame2.png`)

---

## **5. Custom Dataset**
If you prefer to use your own dataset:
1. Capture road images using a camera or smartphone.
2. Ensure images are clear and lanes are visible.
3. Add your images to the `input_images/` folder.

---

## **6. Licensing and Credits**
- If using a public dataset like KITTI, please adhere to their licensing terms. The KITTI dataset is available under the [Creative Commons Attribution-NonCommercial-ShareAlike 3.0 License](http://www.cvlibs.net/datasets/kitti/code.php).

---

By following this guide, you can prepare your dataset and start testing the lane detection algorithm effectively.



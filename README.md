# Atrial-fibrillation-analysis
Atrial fibrillation analysis program with test signals# Ischemic-changes-analysis

# Basic Overview
Program detects atrial fibrillation during ecg.
![image](https://user-images.githubusercontent.com/36335477/40489357-939db054-5f71-11e8-93a0-603b2a7c19f1.png)

## Getting Started
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites
```
Matlab r2017a or later -> https://www.mathworks.com
Matlab Signal Processing Toolbox -> https://www.mathworks.com/products/signal.html
```
### Installing
```
Load all files in same folder
Open KseniaMain.m
Push "Run" button
Push "Change Folder" if needed
```
## Running the tests
```
Push "Load signal" button and load one of the *.mat files
Choose interval you want to analyse using textboxes
You can load new signal choosing "Load new signal" button
You can see steps of atrial fibrillation analyse checking buttons:
 1. Detect R-R
 2. Analysis
 3. Results
You can save results pushing "Save results" button
```
# Methods

## Pan-Tompkins algorithm
Program detects R-peaks using Pan-Tompkins algorithm

![image](https://user-images.githubusercontent.com/36335477/40489735-6fb8b5de-5f72-11e8-94b0-4cf2ecd19b2f.png)

## RR-intervals
Program calculates RR-intervals duration and draws Histogram and Scatterogram

![image](https://user-images.githubusercontent.com/36335477/40489867-d3210d60-5f72-11e8-9e87-82602c6a80ed.png)

# Authors

* Eldar Shayahmetov, eldarsharpey@gmail.com


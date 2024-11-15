# 🎭 3D Face Modeling Using Spline Interpolation

[![MATLAB](https://img.shields.io/badge/MATLAB-R2023b-blue.svg)](https://www.mathworks.com/products/matlab.html)

## 📝 Description

This project implements a MATLAB-based solution for creating 3D face models using spline interpolation. The script allows users to manually select important facial landmarks using the `getpts` function and generates a 3D model based on these control points.

## ✨ Features

- 🎯 Manual selection of facial landmarks
- 🔄 Spline-based interpolation
- 📐 3D model generation
- 🖼️ Interactive point selection interface
- 📊 Visualization of the resulting 3D model

## 🛠️ Prerequisites

- MATLAB (R2020a or newer)
- Image Processing Toolbox
- Curve Fitting Toolbox

## 📦 Installation

1. Clone this repository:
```bash
git clone https://github.com/CS-Astronaut/InterPolation-3D-Modeling
```

2. Open MATLAB and navigate to the project directory
3. Run the main script:
```matlab
run face_modeling.m
```

## 🚀 Usage

1. Run the script
2. Load your input face image
3. Use the `getpts` function to select facial landmarks:
   - Click on important facial features
   - Press Enter when done selecting points
4. Wait for the 3D model generation
5. View and interact with the resulting 3D face model

## 📊 Workflow

```mermaid
graph LR
    A[Input Image] --> B[Manual Point Selection]
    B --> C[Spline Interpolation]
    C --> D[3D Model Generation]
    D --> E[Visualization]
```

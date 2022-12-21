Non-image to image transformation - Algorithm 1,2,3

Copyright (c) 2019, Anuraganand Sharma - All rights reserved.
 
This Matlab code is the implementation of the following algoirthms:
Algorithm 1: Equidistant Bar Graph (Run data2imgX1.m)
Algorithm 2: Normalized Distance Matrix (Run data2imgX2.m)
Algorithm 3: combination of Normalized Distance Matrix and Equidistant Bar Graph algorithm (Run data2imgX3.m) 

These algorithms have been proposed by Anuraganand Sharma in:
Sharma, A., Kumar, D. Classification with 2-D convolutional neural networks for breast cancer diagnosis. Sci Rep 12, Nature, 21857 (2022).
and in the preprints:
version 1: A. Sharma and D. Kumar, Non-image Data Classification with Convolutional Neural Networks. 
version 2: A. Sharma and D. Kumar, Classification with 2-D Convolutional Neural Networks for breast cancer diagnosis.

The algoirhtm reads data given in 2D form and converts them into 2D images. Currently, it works for non-time series data only.

How to run:
1 - Run data2imgX1.m or data2imgX2.m or data2imgX3.m for Algorithm 1, 2 or 3 resepectively. First, you will be asked to provide the location of the data file.
2 - It asks for data files. Data files shoould have .data extension. See the format of the sample files taken from the UCI library. Look for data files inside "data" folder.
3 - The results will be stored in the same "data" folder.
4 - The algorithm for 1D conversion also runs in the same manner.



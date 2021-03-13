Non-image to image transformation - Algorithm 1,2,3

Copyright (c) 2019, Anuraganand Sharma - All rights reserved.
 
This Matlab code is the implementation of the following algoirthms:
Algorithm 1: Equidistant Bar Graph (Run data2imgX1.m)
Algorithm 2: Normalized Distance Matrix (Run data2imgX2.m)
Algorithm 3: combination of Normalized Distance Matrix and Equidistant Bar Graph algorithm (Run data2imgX3.m) 

These algorithms have been proposed by Anuraganand Sharma in the preprints:
version 1: A. Sharma and D. Kumar, Non-image Data Classification with Convolutional Neural Networks. 
version 2: A. Sharma and D. Kumar, Classification with 2-D Convolutional Neural Networks for breast cancer diagnosis.

The algoirhtm reads data given in 2D form and converts them into 2D images. Currently, it works for non-time series data only.

How to run:
1 - Run data2imgX1.m or data2imgX2.m or data2imgX3.m for Algorithm 1, 2 or 3 resepectively. First, you will be asked to provide the location of the data file.
2 - It asks for data files. Data files shoould have .data extension. See the format of the sample files taken from the UCI library. Look for data files inside "data" folder.
3 - The results will be stored in the same "data" folder.
4 - The algorithm for 1D conversion also runs in the same manner.


Total: 699 points (as of the donated datbase on 15 July 1992)

Breast Cancer Wisconsin (Original) Data Set
Download: Data Folder, Data Set Description

Abstract: Original Wisconsin Breast Cancer Database


Data Set Characteristics:  

Multivariate

Number of Instances:

699

Area:

Life

Attribute Characteristics:

Integer

Number of Attributes:

10

Date Donated

1992-07-15

Associated Tasks:

Classification

Missing Values?

Yes

Number of Web Hits:

678787


Source:

Creator:

Dr. WIlliam H. Wolberg (physician)
University of Wisconsin Hospitals
Madison, Wisconsin, USA

Donor:

Olvi Mangasarian (mangasarian '@' cs.wisc.edu)
Received by David W. Aha (aha '@' cs.jhu.edu)


Data Set Information:

Samples arrive periodically as Dr. Wolberg reports his clinical cases. The database therefore reflects this chronological grouping of the data. This grouping information appears immediately below, having been removed from the data itself:

Group 1: 367 instances (January 1989)
Group 2: 70 instances (October 1989)
Group 3: 31 instances (February 1990)
Group 4: 17 instances (April 1990)
Group 5: 48 instances (August 1990)
Group 6: 49 instances (Updated January 1991)
Group 7: 31 instances (June 1991)
Group 8: 86 instances (November 1991)
-----------------------------------------
Total: 699 points (as of the donated datbase on 15 July 1992)

Note that the results summarized above in Past Usage refer to a dataset of size 369, while Group 1 has only 367 instances. This is because it originally contained 369 instances; 2 were removed. The following statements summarizes changes to the original Group 1's set of data:

##### Group 1 : 367 points: 200B 167M (January 1989)

##### Revised Jan 10, 1991: Replaced zero bare nuclei in 1080185 & 1187805

##### Revised Nov 22,1991: Removed 765878,4,5,9,7,10,10,10,3,8,1 no record
##### : Removed 484201,2,7,8,8,4,3,10,3,4,1 zero epithelial
##### : Changed 0 to 1 in field 6 of sample 1219406
##### : Changed 0 to 1 in field 8 of following sample:
##### : 1182404,2,3,1,1,1,2,0,1,1,1


Attribute Information:

1. Sample code number: id number
2. Clump Thickness: 1 - 10
3. Uniformity of Cell Size: 1 - 10
4. Uniformity of Cell Shape: 1 - 10
5. Marginal Adhesion: 1 - 10
6. Single Epithelial Cell Size: 1 - 10
7. Bare Nuclei: 1 - 10
8. Bland Chromatin: 1 - 10
9. Normal Nucleoli: 1 - 10
10. Mitoses: 1 - 10
11. Class: (2 for benign, 4 for malignant)

Summary tidy data set 
=====================

The original data used for this project was provided by the Coursra course "Getting and Cleaning Data" 
and is based on the study "Human Activity Recognition Using Smartphones Dataset"
by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. 

The study collected body motion data from 30 people with a smartphone attached to each subject. 
The original data description information is appended to this file.

The following is a list of the variables calculated for the class project and the steps taken to 
generate the data. The mean value was calculated for each of the original data vectors 
that was a mean value or a standard deviation value grouped by ACTIVITY and SUBJECT. 
48 vectors are calculated.

Steps to process data
=====================
	1 Import both the training and test data into dataframes. Append the SUBJECT and ACTIVITY vectors.
	2 Combine the training and test data into one data.frame named df.all
	3 Import the variable names and assign them to df.all
	4 Subset the df.all to only include those features that calculate the mean() or std()
	5 Assign descriptive activity names. The values come from the file activity_labels.txt
	6 Create factors from the subjects for grouping 
	7 split - apply - combine the dataframe to calculate the mean of the variables grouped by activity, subject and feature
	8 Rename the variables by placing each variable in the mean() function, ex. mean(fBodyAcc-mean()-X)
	9 Named this way to show how each variable was processed
	10 Expand back out to wide form with all the variables as column headings.
	11 Write tidy data to the summary.txt file


The calculated variable list
============================
mean(fBodyAcc-mean()-X)     
mean(fBodyAcc-mean()-Y)      
mean(fBodyAcc-mean()-Z)      
mean(fBodyAcc-std()-X)      
mean(fBodyAcc-std()-Y)       
mean(fBodyAcc-std()-Z)       
mean(fBodyAccJerk-mean()-X) 
mean(fBodyAccJerk-mean()-Y)  
mean(fBodyAccJerk-mean()-Z)  
mean(fBodyAccJerk-std()-X)  
mean(fBodyAccJerk-std()-Y)   
mean(fBodyAccJerk-std()-Z)   
mean(fBodyGyro-mean()-X)    
mean(fBodyGyro-mean()-Y)     
mean(fBodyGyro-mean()-Z)     
mean(fBodyGyro-std()-X)     
mean(fBodyGyro-std()-Y)      
mean(fBodyGyro-std()-Z)      
mean(tBodyAcc-mean()-X)     
mean(tBodyAcc-mean()-Y)      
mean(tBodyAcc-mean()-Z)      
mean(tBodyAcc-std()-X)      
mean(tBodyAcc-std()-Y)       
mean(tBodyAcc-std()-Z)       
mean(tBodyAccJerk-mean()-X) 
mean(tBodyAccJerk-mean()-Y)  
mean(tBodyAccJerk-mean()-Z)  
mean(tBodyAccJerk-std()-X)  
mean(tBodyAccJerk-std()-Y)   
mean(tBodyAccJerk-std()-Z)   
mean(tBodyGyro-mean()-X)    
mean(tBodyGyro-mean()-Y)     
mean(tBodyGyro-mean()-Z)     
mean(tBodyGyro-std()-X)     
mean(tBodyGyro-std()-Y)      
mean(tBodyGyro-std()-Z)      
mean(tBodyGyroJerk-mean()-X)
mean(tBodyGyroJerk-mean()-Y) 
mean(tBodyGyroJerk-mean()-Z) 
mean(tBodyGyroJerk-std()-X) 
mean(tBodyGyroJerk-std()-Y)  
mean(tBodyGyroJerk-std()-Z)  
mean(tGravityAcc-mean()-X)  
mean(tGravityAcc-mean()-Y)   
mean(tGravityAcc-mean()-Z)   
mean(tGravityAcc-std()-X)   
mean(tGravityAcc-std()-Y)    
mean(tGravityAcc-std()-Z)  

Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

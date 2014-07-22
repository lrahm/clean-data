Get and Clean Data Class Project
================================
Summer 2014
Lars Rahm

The original data used for this project was provided by the Coursra course "Getting and Cleaning Data" 
and is based on the study "Human Activity Recognition Using Smartphones Dataset"
by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. 

The study collected body motion data from 30 people with a smartphone attached to each subject. The script 
'run_analysis.R' summarizes a subset of the original data and calculates mean values grouped by ACTIVITY 
and SUBJECT.


The repo includes the following files:
=========================================

- 'README.md'

- 'run_analysis.R' - The R script that generates the summary tidy data set for the class project.

- 'CodeBook.md': Describes the summary variables for the class project.


Summary data
============
The 'run_analysis.R' script outputs a tidy data set called 'summary.txt' that summarize data for each ACTIVITY by each SUBJECT. 

The following is a list of steps taken to generate the data. 
The mean value was calculated for each of the original data vectors 
that was a mean value or a standard deviation value grouped by ACTIVITY and SUBJECT. 
48 vectors are calculated. See the CodeBook.md for a list of the variables created.

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



License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

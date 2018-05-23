# Getting-and-Cleaning-Data-Course-Project
This repository contains the submission for the Getting and Cleaning Data Course Project.
The script in run_analysis.R is a script written by me which performs the following functions :

1. Merges the training and the test sets to create one data set.

2.Extracts only the measurements on the mean and standard deviation for each measurement.

3.Uses descriptive activity names to name the activities in the data set

4.Appropriately labels the data set with descriptive variable names.

5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# To Run the Script
1. Download the data source and put into a folder on your local drive. You'll have a UCI HAR Dataset folder.

2. Put run_analysis.R in the parent folder of UCI HAR Dataset, then set it as your working directory using setwd().

3. Run source("run_analysis.R"), then it will generate a new file tidydata.txt in your working directory.

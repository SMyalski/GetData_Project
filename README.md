GetData_Project
===============

Getting and Cleaning Data Course Project
This repo should have following files:
 
 'README.md' - this file, include description and list of steps done
 
 'CodeBook.md' - include list of variables used and new variables introduced in tidy dataset
 
 'features.txt' - lists columns used in analysis
 
 'run_analysis.R' - analysis script, reads data, produce tidy dataset and saves it
 
 'tidydataset.txt'  -saved tidy dataset, without column headers
 
 'tidydataset_names.txt' -file with rows (first line) and columns(second line) in tidydataset. Separated by space.


Script run_analysis.R does the following steps (listed in order):
 - Loads train and test datasets and descriptions of variables
 - Labels the data set with descriptive variable names. 
 - Merges the training and the test sets to create one data set.
 - Link descriptive activity names to name the activities in the data set
 - Extracts only the measurements on the mean and standard deviation for each measurement. 
 - Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Each section of code in the file have a comment to indicate which step from ones listed above in does.
 
Script requires dataset available under following link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
unpacked into "data" subfolder of working directory
Resulting tidy dataset is also saved in data folder
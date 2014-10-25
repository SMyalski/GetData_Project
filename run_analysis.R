# Getting and Cleaning Data Course Project
# Script calculates averages for mean and std parameters of a dataset for specific activities
# Script requires You have dataset unpacked in folder ./data
# Dataset location: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


# This script does the following
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


#Load datasets
xtest <- read.csv("./data/UCI HAR Dataset/test/X_test.txt", sep="",header = FALSE)
xtrain <- read.csv("./data/UCI HAR Dataset/train/X_train.txt", sep="",header = FALSE)
ytest <- read.csv("./data/UCI HAR Dataset/test/Y_test.txt", sep="",header = FALSE)
ytrain <- read.csv("./data/UCI HAR Dataset/train/Y_train.txt", sep="",header = FALSE)
features <- read.csv("./data/UCI HAR Dataset/features.txt", sep="",header = FALSE)
activities <- read.csv("./data/UCI HAR Dataset/activity_labels.txt", sep="",header = FALSE)
subjecttest <- read.csv("./data/UCI HAR Dataset/test/subject_test.txt", sep="",header = FALSE)
subjecttrain <- read.csv("./data/UCI HAR Dataset/train/subject_train.txt", sep="",header = FALSE)

# Appropriately labels the data set with descriptive variable names. 
names(activities) <- c("Activity_num","Activity_Description")
names(xtest)<-features[[2]]
names(xtrain)<-features[[2]]
names(ytest) <- "Activity_num"
names(ytrain) <- "Activity_num"
names(subjecttest) <- "subject"
names(subjecttrain) <- "subject"

# Merging the training and the test sets to create one data set.
testy <- cbind(ytest,subjecttest)
trainy <- cbind(ytrain,subjecttrain)
data <- rbind(xtest,xtrain)
datay <- rbind(testy,trainy) 

# Merges activity names to name the activities in the data set
datay2 <- merge(datay,activities, by.x="Activity_num", by.y="Activity_num", all=TRUE)

# Extracts only the measurements on the mean and standard deviation for each measurement. 
data2 <- data[ , grepl("mean" , names(data)) | grepl("std" , names(data))]

# create a second, independent tidy data set with the average
# of each variable for each activity and each subject.
tidy <- by(data2,datay2[c("Activity_Description", "subject")],colMeans)

#write tidy dataset to file
write.table(tidy,file="./data/averages",row.name=FALSE)
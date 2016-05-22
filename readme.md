# Summary

This repository contains the R script for the Coursera assignment on "Getting and Cleaning Data", and the datasets, produced by the script.

# Script details

## Initialization

The raw data for this assignment is huge and therefore is not stored at the repository. Instead, when the script is run at the first time, it downloads the
data and unzips it to 'Data' folder. This folder is ignored in git.

## Task 1. Merge  the training and the test sets to create one data set.

Note that pathes for the required files are similar in both folders: /test/[filename]_test.txt and /train/[filename]_train.txt. The method readFromBothSource reads
data from two files with the specified filename, located in test/ and train/ folders, and concatenates the read tables.

## Task 2. Extract only the measurements on the mean and standard deviation for each measurement.

The required columns are selected with grepl function, and then subset the read data.

## Task 3. Use descriptive activity names to name the activities in the data set

The code is self-explanatory.

## Task 4. Appropriately label the data set with descriptive variable names.

The initial names of the data are transformed with regular expression, e.g. tBodyAcc-mean()-Z -> tBodyAcc.Z.mean, fBodyBodyGyroJerkMag-mean() -> fBodyBodyGyroJerkMag.mean

## Task 5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

The code is self-explanatory
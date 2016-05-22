# Summary

This file describes files tidyData1.csv and tidyData2.csv, that are the result of using run_analysis.R 
on the initial data for Human Activity Recognition Using Smartphones Dataset.

## Initial data

The data itself can be found at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip,
its description is here http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data contains various _measurements_ of _subjects_ that perform various _activities_.

The data is separated into two sets, train and test. The files in these folders are as follows:

 * /train/X_train.txt, /test/X_test.txt. Each number is a measurement. The column _i_ contains measurement of a variable, which name is located at _i_-th row of the file /features.txt
 * /train/y_train.txt, /test/Y_test.txt. Training labels. The row _i_ contains the code of the activity, which was performed while measuring _i_-th row of X_train.txt or X_test.txt. The description of this activity is in file /activity_labels.txt
 * /train/subject_train.txt,': _i_-th row identifies the subject who performed the activity for _i_-th row of X_train.txt, X_test.txt.
 
## The transformation process

run_analysis.R does as follows:

 * Merges the training and the test sets to create one data set.
 * Extracts only the measurements on the mean and standard deviation for each measurement.
 * Uses descriptive activity names to name the activities in the data set
 * Appropriately labels the data set with descriptive variable names. Stores the result into tidyData1.csv
 * From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. Stores data into tidyData2.csv
 
## tidyData1.csv

This file stores data frames with the following columns:
 * The ID of a record
 * The ID of a person
 * The activity performed
 * The measurements, copied from the initial datasets/Human
 
 ## tidyData2.csv
 
 This file stores data frames with the same structure, as tidyData1.csv, but all measurements are averaged for each person and each activity.
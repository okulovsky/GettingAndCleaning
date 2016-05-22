

# Downloading data in repository. 
# The 'Data' folder is ignored in GIT and will be restored at the first run
if (!dir.exists("Data")) 
{
        dataFile <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(dataFile, "Data.zip", method="curl")
        unzip("Data.zip")
        file.rename("UCI HAR Dataset","Data")
        unlink("Data.zip")
}


#Task 1. Merges the training and the test sets to create one data set.
#Each time we read data, it is read from both folders
readFromBothSource <- function(filename)
{
        data1<-read.table(paste("Data/test/",filename,"_test.txt",sep=""))
        data2<-read.table(paste("Data/train/",filename,"_train.txt",sep=""))
        rbind(data1,data2)
}

#Task2. Extracts only the measurements on the mean and standard deviation for each measurement.

values <- readFromBothSource("x")
featureNames <- read.table("Data/features.txt")
targetFeatures  <- grepl("(-std\\(\\)|-mean\\(\\))",featureNames$V2)
values <- values[, which(targetFeatures)]


#Task 3. Uses descriptive activity names to name the activities in the data set

activityCodes    <- readFromBothSource("y")
activityLabels  <- read.table("Data/activity_labels.txt")
activities <- as.factor(activityCodes$V1)
levels(activities) <- activityLabels$V2

subjects<-readFromBothSource("subject")

result<-cbind(subjects,activities,values)

#Task 4. Appropriately labels the data set with descriptive variable names.

targetFeatureNames <- featureNames[which(targetFeatures),2]
targetFeatureNames<-gsub("([^-]+)-([^-]+)\\(\\)-(.*)","\\1.\\3.\\2", targetFeatureNames)
targetFeatureNames<-gsub("([^-]+)-([^-]+)\\(\\)","\\1.\\2", targetFeatureNames)
columnNames<-c("Subject","Activity",targetFeatureNames)
colnames(result)<-columnNames

write.csv(result,"tidyData1.csv")

# Task 5. From the data set in step 4, creates a second, 
# independent tidy data set with the average of each variable 
# for each activity and each subject.

avgs<-aggregate(result,by=list(result$Subject,result$Activity),FUN=mean)
avgs$Activity<-NULL
avgs$Subject<-NULL
colnames(avgs)[1]<-"Subject"
colnames(avgs)[2]<-"Activity"
write.table(avgs,"tidyData2.txt", row.names="TRUE")

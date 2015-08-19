##################################################################################################
#
# This script will create a tidy dataset by performing the following steps:
#     Download and unzip the data
#     (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
#     Merge the training and the test sets to create one dataset
#     Extract only the measurements on the mean and standard deviation for each measurement
#     Use descriptive activity names to name the activities in the dataset
#     Create a tidy dataset with the average of each variable for each activity and each subject
#################################################################################################

library(dplyr)
library(reshape2)

# Creates Data directory if necessary
if (!file.exists("./Data")) { 
      dir.create("./Data") 
} 

# Download and unzip the dataset if necessary
if (!file.exists("./Data/UCI HAR Dataset.zip")){ 
      fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
      download.file(fileURL, "./Data/UCI HAR Dataset.zip") 
      unzip("./Data/UCI HAR Dataset.zip", exdir="./Data")
}   

# Load the data 
features     <- read.table('./Data/UCI HAR Dataset/features.txt'); 
activityType <- read.table('./Data/UCI HAR Dataset/activity_labels.txt'); 

subjectTrain <- read.table('./Data/UCI HAR Dataset/train/subject_train.txt'); 
xTrain       <- read.table('./Data/UCI HAR Dataset/train/X_train.txt'); 
yTrain       <- read.table('./Data/UCI HAR Dataset/train/y_train.txt'); 

subjectTest  <- read.table('./Data/UCI HAR Dataset/test/subject_test.txt');  
xTest        <- read.table('./Data/UCI HAR Dataset/test/X_test.txt'); 
yTest        <- read.table('./Data/UCI HAR Dataset/test/y_test.txt'); 

# Merge the test and train datasets
xTotal       <- rbind(xTrain,xTest) 
yTotal       <- rbind(yTrain,yTest) 
subjectTotal <- rbind(subjectTrain,subjectTest)

# adds feature names as columns names
colnames(xTotal) <- features[,2]

# select columns containing mean or std in their name
xTotal <- xTotal[,grep("mean|std",colnames(xTotal))]

# merge activities using inner_join from dplyr package instead of merge 
# to preserve order
activities <- inner_join(yTotal,activityType, by="V1") 

# sets columns names on activities data
colnames(activities) <- c("activity_no","activity_txt")

# adds activity column to the entire dataset
xTotal <- cbind(activities["activity_txt"],xTotal)

# includes the subject id's in the data
colnames(subjectTotal) <- c("subject_id")
xTotal                 <- cbind(subjectTotal,xTotal)

# sorts the data by subject_id and activity
xSorted <- xTotal[order(xTotal$subject_id,xTotal$activity_txt),] 

# create a long shaped dataset from a wide shaped dataset
long_data <- melt(xSorted,id.vars= c("subject_id","activity_txt"))

# transform the long shaped dataset back into a wide shaped dataset, aggregating on subject  
# and activity using the mean function 
tidy_data <- dcast(long_data, subject_id+activity_txt ~ variable, fun.aggregate=mean)

# write the tidy data to a txt file
write.table(tidy_data,file="Tidydata.txt",row.names=FALSE)
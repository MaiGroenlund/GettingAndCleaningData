# CodeBook

#### Raw data

The raw data is obtained from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The description of the raw data is found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

######Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its em-bedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

For more information about the raw data please see the README file in the UCI HAR Dataset folder.

#### Transformation of the raw data
The R-script run_analysis performs the following:

-	The script downloads and unzips the files if they are not present in a directory called Data in the current working directory. 
-	The raw data files are loaded in
-	The test and train datasets are merged together
-	The feature names are added as columns names to the the dataset containing the measurements to give descriptive variable names
-	Only the measurements containing the mean and standard deviation are kept in the data
-	The activities with descriptive names are added to the dataset
-	The subject-ids are added to the dataset
-	The dataset is transformed into a new tidy dataset with the average of each variable for each activity and each subject

#### Tidy data

The tidy data consists of the following variables:

###### Subject and Activity
subject_id 
The ID of the test subject performing the activity
Values: 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30

activity_txt       
Name of the type of activity the subject is performing
Values: LAYING, SITTING, STANDING WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS

###### Measurements

All measurements are the mean of the same measurement from the raw data where the mean is taking for each subject and each activity.

tBodyAcc-mean()-X
tBodyAcc-mean()-Y              
tBodyAcc-mean()-Z
tBodyAcc-std()-X               
tBodyAcc-std()-Y
tBodyAcc-std()-Z               
tGravityAcc-mean()-X
tGravityAcc-mean()-Y           
tGravityAcc-mean()-Z
tGravityAcc-std()-X            
tGravityAcc-std()-Y
tGravityAcc-std()-Z            
tBodyAccJerk-mean()-X
tBodyAccJerk-mean()-Y          
tBodyAccJerk-mean()-Z
tBodyAccJerk-std()-X           
tBodyAccJerk-std()-Y
tBodyAccJerk-std()-Z           
tBodyGyro-mean()-X
tBodyGyro-mean()-Y             
tBodyGyro-mean()-Z
tBodyGyro-std()-X              
tBodyGyro-std()-Y
tBodyGyro-std()-Z              
tBodyGyroJerk-mean()-X
tBodyGyroJerk-mean()-Y         
tBodyGyroJerk-mean()-Z
tBodyGyroJerk-std()-X          
tBodyGyroJerk-std()-Y
tBodyGyroJerk-std()-Z          
tBodyAccMag-mean()
tBodyAccMag-std()              
tGravityAccMag-mean()
tGravityAccMag-std()           
tBodyAccJerkMag-mean()
tBodyAccJerkMag-std()          
tBodyGyroMag-mean()
tBodyGyroMag-std()             
tBodyGyroJerkMag-mean()
tBodyGyroJerkMag-std()         
fBodyAcc-mean()-X
fBodyAcc-mean()-Y              
fBodyAcc-mean()-Z
fBodyAcc-std()-X               
fBodyAcc-std()-Y
fBodyAcc-std()-Z               
fBodyAcc-meanFreq()-X
fBodyAcc-meanFreq()-Y          
fBodyAcc-meanFreq()-Z
fBodyAccJerk-mean()-X          
fBodyAccJerk-mean()-Y
fBodyAccJerk-mean()-Z          
fBodyAccJerk-std()-X
fBodyAccJerk-std()-Y           
fBodyAccJerk-std()-Z
fBodyAccJerk-meanFreq()-X      
fBodyAccJerk-meanFreq()-Y
fBodyAccJerk-meanFreq()-Z      
fBodyGyro-mean()-X
fBodyGyro-mean()-Y             
fBodyGyro-mean()-Z
fBodyGyro-std()-X              
fBodyGyro-std()-Y
fBodyGyro-std()-Z              
fBodyGyro-meanFreq()-X
fBodyGyro-meanFreq()-Y         
fBodyGyro-meanFreq()-Z
fBodyAccMag-mean()             
fBodyAccMag-std()
fBodyAccMag-meanFreq()         
fBodyBodyAccJerkMag-mean()
fBodyBodyAccJerkMag-std()      
fBodyBodyAccJerkMag-meanFreq()
fBodyBodyGyroMag-mean()        
fBodyBodyGyroMag-std()
fBodyBodyGyroMag-meanFreq()    
fBodyBodyGyroJerkMag-mean()
fBodyBodyGyroJerkMag-std()     
fBodyBodyGyroJerkMag-meanFreq()

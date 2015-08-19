# Getting and Cleaning Data

This repository contains the R code and documentation files for the course project for the Coursera course “Getting and Cleaning Data”.

Precautions
Before running the script please make sure you have the following R packages installed: 
dplyr, reshape2

About the script
The R-script run_analysis performs the following:
-	The script downloads and unzips the files if they are not present in a directory called Data in the current working directory. 
-	The raw data files are loaded in
-	The test and train datasets are merged together
-	The feature names are added as columns names to the the dataset containing the measurements to give descriptive variable names
-	Only the measurements containing the mean and standard deviation are kept in the data
-	The activities with descriptive names are added to the dataset
-	The subject-ids are added to the dataset
-	The dataset is transformed into a new tidy dataset with the average of each variable for each activity and each subject

About the Code Book
The code book contains a description of the raw data, the list of transformations the R script performs and a list of variables in the resulting tidy dataset.

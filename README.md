getDataProject
==============

The is based upon data from a Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.  The original data can be found at:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# run_analysis.R
This script processes the data from the above website to create a new data set (tidydata.txt).  
* Reads in the test and training data.
* Combines the test and training data.
* Tranlates the activities to words
* Extracts the variables related to the mean and standard deviation for each measurement.
* Creates a new dataframe with the average of each variable for each activity and each subject. 
* Writes the dataframe of averages to a tab delimited file called tidydata.txt

# tidydata.txt
For each subject (1-30) and each activity (LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS), tidydata.txt has the average value of each the following measurements:
* tBodyAcc-mean-X 
* tBodyAcc-mean-Y 
* tBodyAcc-mean-Z 
* tGravityAcc-mean-X 
* tGravityAcc-mean-Y 
* tGravityAcc-mean-Z 
* tBodyAccJerk-mean-X 
* tBodyAccJerk-mean-Y 
* tBodyAccJerk-mean-Z 
* tBodyGyro-mean-X 
* tBodyGyro-mean-Y 
* tBodyGyro-mean-Z 
* tBodyGyroJerk-mean-X 
* tBodyGyroJerk-mean-Y 
* tBodyGyroJerk-mean-Z 
* tBodyAccMag-mean 
* tGravityAccMag-mean 
* tBodyAccJerkMag-mean 
* tBodyGyroMag-mean 
* tBodyGyroJerkMag-mean 
* fBodyAcc-mean-X 
* fBodyAcc-mean-Y 
* fBodyAcc-mean-Z 
* fBodyAccJerk-mean-X 
* fBodyAccJerk-mean-Y 
* fBodyAccJerk-mean-Z 
* fBodyGyro-mean-X 
* fBodyGyro-mean-Y 
* fBodyGyro-mean-Z 
* fBodyAccMag-mean 
* fBodyBodyAccJerkMag-mean 
* fBodyBodyGyroMag-mean 
* fBodyBodyGyroJerkMag-mean 
* tBodyAcc-std-X 
* tBodyAcc-std-Y 
* tBodyAcc-std-Z 
* tGravityAcc-std-X 
* tGravityAcc-std-Y 
* tGravityAcc-std-Z 
* tBodyAccJerk-std-X 
* tBodyAccJerk-std-Y 
* tBodyAccJerk-std-Z 
* tBodyGyro-std-X 
* tBodyGyro-std-Y 
* tBodyGyro-std-Z 
* tBodyGyroJerk-std-X 
* tBodyGyroJerk-std-Y 
* tBodyGyroJerk-std-Z 
* tBodyAccMag-std 
* tGravityAccMag-std 
* tBodyAccJerkMag-std 
* tBodyGyroMag-std 
* tBodyGyroJerkMag-std 
* fBodyAcc-std-X 
* fBodyAcc-std-Y 
* fBodyAcc-std-Z 
* fBodyAccJerk-std-X 
* fBodyAccJerk-std-Y 
* fBodyAccJerk-std-Z 
* fBodyGyro-std-X 
* fBodyGyro-std-Y 
* fBodyGyro-std-Z 
* fBodyAccMag-std 
* fBodyBodyAccJerkMag-std 
* fBodyBodyGyroMag-std 
* fBodyBodyGyroJerkMag-std 


gettingcleaningdata
===================

Repository created for a course project. In this file README you can find information about the following aspects:

   * The files of this repository
   * Description of the raw data and it's source
   * Instructions on how to use the script
   * Description of what the script will do

THE FILES OF THIS REPOSITORY

   This repository includes three documents:
   * README.md. It includes general information about the characteristics of this repository, where the original data come from, how the original data have been manipulated, and how works the script that modifies the original data.
   * run_analysis.R. It is the script that modifies the original data. The output is a tidy data set.
   * Code_Book.md. It explains the characteristics of the tidy data set obtained from running the script run_analysis.R


DESCRIPTION OF THE RAW DATA AND IT'S SOURCE

   The original data was obtained through an experiment carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, there were captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. For more information, you can visit the following web page: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
   
   The original data has been organized in a directory called "UCI HAR Dataset", that contains:
   * A directory "test" with the test data
   * A directory "train" with the training data
   * A data set "features.txt", which includes a list of the 561 variables measured in the original experiment
   * A data set "activity_labels.txt", which includes the numbers (from 1 to 6) used to encode the different activities considered in the experiment (Walking, Walking-upstairs, Walking-downstairs, Sitting, Standing and Laying)
   * A text file "features.info", which explains all the variables considered in the experiment
   * A text file "README", which includes information about the experiment carried out trying to recognize human activities (Walking, Sitting, Standing...) using Smartphones.
   
   The directories "test" and "train" includes the same kind of information, one for the test data and the other for the training data:
   * One subdirectory "Inertial Signals", with three different information:
       - Triaxial acceleration signal from the smartphone accelerometer in standard gravity units 'g'.
       - The body acceleration signal obtained by subtracting the gravity from the total triaxial acceleration signal
       - The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 
   * A data set "subject_test"/"subject_train" with the subject who performed the activity for each observation
   * A data set "X_test.txt"/"X_train.txt" with the core data. Features are normalized and bounded within [-1,1].
   * A data set "y_test"/"y_train" with the number of the activity corresponding to each observation
      
   
   


INSTRUCTIONS ON HOW TO USE THE SCRIPT

   The input to the script "run_analysis.R" is the original data organized in a directory called "UCI HAR Dataset" (see above). This directory "UCI HAR Dataset" must be included in the working directory.
   
   The script "run_analysis.R" doesn't include any parameter, so you only need to make R to read and parse the script (command >source('~/run_analysis.R') in the working directory) and, after that, introduce the command in R "run_analysis()" (command >run_analysis() in the working directory).
   
   The output will be a tidy data set called "TidyDataCourseProject.txt" written in the working directory.



DESCRIPTION OF WHAT THE SCRIPT WILL DO

The original data included in the directory called "UCI HAR Dataset" are manipulated in order to get a tidy data set from them. The script "run_analysis.R" performs the following steps:

* Step 1: Read the Training Set from "UCI HAR Dataset"
* Step 2: Change the name of the variable of data frame "subject_train" to "Subject" (called SubjectTrain in the script) and the name of the variable of data frame "y_train" to "Activity" (called TrainingACtivityNumber in the script)
* Step 3: Merge the training data, the subject who performed each training observation, and the activity of each training observation
* Step 4: Read the Test Set from "UCI HAR Dataset"
* Step 5: Change the name of the variable of data frame "subject_test" to "Subject" (called SubjectTest in the script) and the name of the variable of data frame "y_test" to "Activity" (called TestActivityNumber in the script)
* Step 6: Merge the test data, the subject who performed each test observation, and the activity of each test observation
* Step 7: Merge the training data set and the test data set to create one data frame called DataSet, with 10299 obs. of 563 variables
* Step 8: Extract only the measurements on the mean and standard deviation for each measurement. The result is a data frame called DataSetSub with 10299 obs. of 68 variables:
  - All variables with the word "mean" (46) are included, except "meanFreq" (13): 33 in total, so each variable with "mean" value has its corresponding variable with "standard deviation" value
  - All variables with "angle(....Mean)" are excluded: 7 in total
  - All variables with the word "std" are included: 33 in total
  - Subject and Activity are included: 2 in total
* Step 9: Change in DataSetSub all the numbers of activities by the corresponding names as appears in "UCI HAR Dataset" (file "activity_labels").
* Step 10: Change the labels of the variables in DataSetSub (V1, V2, V3 ....) to descriptive variable names ("Time.BodyLinearAcceleration.AxisX.Mean", "Time.BodyLinearAcceleration.AxisY.Mean", "Time.BodyLinearAcceleration.AxisZ.Mean".....)
* Step 11: Create a tidy data set with the average of each variable for each activity and each subject
* Step 12: Record the tidy data set to the working directory (file called "TidyDataCourseProject.txt")

















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
   * A data set "features.txt"
   * A data set "activity_labels.txt"
   * A text file "features.info", which explains all the variables considered in the experiment
   * A text file "README", which includes information about the experiment carried out trying to recognize human activities (Walking, Sitting, Standing...) using Smartphones.
   

INSTRUCTIONS ON HOW TO USE THE SCRIPT

DESCRIPTION OF WHAT THE SCRIPT WILL DO

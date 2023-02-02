This repo is my submission for the "Getting And Cleaning Data" Course project as apart of the John Hopkins University "Data Science Foundations: Using R Programming"
section on Coursera.

Dataset:

The dataset we are using for this  project is as listed
  
  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Files:

The files you will need to review are listed here:

**CodeBook.md**
 
 This is a code book that describes all the data, variables, and transformations that were made in order to clean up the data and turn it into a tidy data set
  
**run_analysis.R**
  
  This code runs the preparation of all the data then proceeds to follow a five step transformation that was listed in the coursera project outline   
      
  1 - Merges the training and the test sets to create one data set
  
  2 - Extracts only the measurments on the mean and standard deviation for each measurment
  
  3 - Uses descriptive activity names to name the activities in the data set
  
  4 - Appropriately labels the data set with descriptive variable names
  
  5 - From the data in step 4, creates a second, independant tidy data set with the average of each variable for each activity
  
**FinalData.txt**
  
  This is the exported, final data, after going through steps in the run_analysis program listed above
      

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
## Preparation Needed For The Assignment

## Make sure to load the required packages
    library(dyplr)
    
## Download the Dataset(s) needed
  
## Creating the File Name
    fileName <- "JHU_GCD_Proj.zip"

## Checking If The Archive Already Exists
    if(!file.exists(fileName)){
         fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
         download.file(fileURL, fileName, method="curl")
    }
  
## Checking If The Folder Already Exists
    if(!file.exists("UCI HAR dataSet")) {
      unzip(fileName)
    }
    
## Assigning All The Data Frames
    features <- "features.txt"
    activitiesLabels <- "activity_labels.txt"
    subjectTest <- "subject_test.txt"
    xTest <- "x_test.txt"
    yTest <- "y_test.txt"
    subjectTrain <- "subject_train.txt"
    xTrain <- "X_train.txt"
    yTrain <- "y_train.txt"

----------------------------------------------------------------------------------------------------------------------------------------------------------------------
## Tyding Up The Data Set

## Step 1 - Merging The Training & Trial Data Sets Into 1 Singular Data Set
    xTotal <- rbind(xTest, xTrain)
    yTotal <- rbind(yTest, yTrain)
    subjectTotal <- rbind(subjectTest, subjectTrain) 
    totalData <- cbind(xTotal, yTotal, subjectTotal)

## Step 2 - Extracting Only The Measurments On The Mean & Standard Deviation For Each Measurment
    tidyData <- totalData %>% select(subject, code, contains("mean"), contains("std"))
    
## Step 3 - Using Descriptive Activity Names To Name The Activities Data Set
    varTidyData <- activities[varTidyData, 2]
    
## Step 4 - Labeling The Data Set With Descriptive Variable Names
    names(tidyData)[2] = "activity"
    names(tidyData) <- gsub("Acc", "Accelerometer", names(tidyData))
    names(tidyData) <- gsub("Gyro", "Gyroscope", names(tidyData))
    names(tidyData) <- gsub("BodyBody", "Body", names(tidyData))
    names(tidyData) <- gsub("Mag", "Magnitude", names(tidyData))
    names(tidyData) <- gsub("^t", "Time", names(tidyData))
    names(tidyData) <- gsub("^f", "Frequency", names(tidyData))
    names(tidyData) <- gsub("tBody", "TimeBody", names(tidyData))
    names(tidyData) <- gsub("-mean()", "Mean", names(tidyData), ignore.case = TRUE)
    names(tidyData) <- gsub("-std()", "STD", names(tidyData), ignore.case = TRUE)
    names(tidyData) <- gsub("-freq()", "Frequency", names(tidyData), ignore.case = TRUE)
    names(tidyData) <- gsub("angle", "Angle", names(tidyData))
    names(tidyData) <- gsub("gravity", "Gravity", names(tidyData))
    
## Step 5 - From The Data Set In Step 4, Create A second, Independantly Tidy Data Set With Each Variable For Each Activity & Subject
    overallData <- tidyData %>% 
           grouped_by (subject, activity) %>% 
           sumarise_all (funs(mean))
    write.table (finalData, "FinalData.txt", row.name=FALSE)
    

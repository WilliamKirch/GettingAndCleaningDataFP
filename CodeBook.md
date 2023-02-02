The run_analyis.R script performs the preparation for the data set and then follows the 5 steps that were laid out in the coursera project definition as listed below


1 - Download the data set 

    --> Dataset is downloaded and extracted in a folder labeled UCI Human Activity Recognition Using Smartphones DS


2 - Assigning Each Data A Variable
   
    --> features <- features.txt
    --> activitiesLabels <- activity_labels.txt
    --> subjectTest <- test/subject_test.txt
    --> xTest <- test/x_test.txt
    --> yTest <- test/y_test.txt
    --> subjectTrain <- test/subject_train.txt
    --> xTrain <- test/X_train.txt
    --> yTrain <- test/y_train.txt
  
  
3 - Merging The Training And The Test Sets To Create 1 Data Set
    
    --> xTotal <- rbind(xTest, xTrain)
    --> yTotal <- rbind(yTest, yTrain)
    --> subjectTotal <- rbind(subjectTest, subjectTrain) 
    --> totalData <- cbind(xTotal, yTotal, subjectTotal)
   
   
4 - Extracts Only The Measurements On The Mean and Standard Deviation For Each Measurement
    
    --> tidyData <- totalData %>% select(subject, code, contains("mean"), contains("std"))


5 - Uses Descriptive Activity Names To Name The Activites In The Data Set 
     
     --> varTidyData <- activities[varTidyData, 2]
    

6 - Apropriately Labeling The Data Set To Have Descriptive Variable Names
    
    --> names(tidyData)[2] = "activity"
    --> names(tidyData)<-gsub("Acc", "Accelerometer", names(tidyData))
    --> names(tidyData)<-gsub("Gyro", "Gyroscope", names(tidyData))
    --> names(tidyData)<-gsub("BodyBody", "Body", names(tidyData))
    --> names(tidyData)<-gsub("Mag", "Magnitude", names(tidyData))
    --> names(tidyData)<-gsub("^t", "Time", names(tidyData))
    --> names(tidyData)<-gsub("^f", "Frequency", names(tidyData))
    --> names(tidyData)<-gsub("tBody", "TimeBody", names(tidyData))
    --> names(tidyData)<-gsub("-mean()", "Mean", names(tidyData), ignore.case = TRUE)
    --> names(tidyData)<-gsub("-std()", "STD", names(tidyData), ignore.case = TRUE)
    --> names(tidyData)<-gsub("-freq()", "Frequency", names(tidyData), ignore.case = TRUE)
    --> names(tidyData)<-gsub("angle", "Angle", names(tidyData))
    --> names(tidyData)<-gsub("gravity", "Gravity", names(tidyData))

7 - From The Data Setup in Step 4, Create a 2nd Independantly Tidy Data Set With The Averag Of Each Variable For Each Activity And Each Subject

    --> overallData <- tidyData %>% grouped_by (subject, activity) %>% sumarise_all (funs(mean))
    --> write.table (finalData, "FinalData.txt", row.name=FALSE)

## This script takes the data from the UCI HAR data Set 
## and combines test and train data extracting only the
## calculations relating to mean and standard deviation

##Step 1 
## Merge the training and the test sets to create 
## one data set.
  
  ##test data Activity Index factor variable
  testActivityLoc <- "./UCI HAR Dataset/test/y_test.txt"
  myTestTable <- read.table(testActivityLoc)
  myActivity <- factor(myTestTable$V1)
  
  #test data Subject factor variable
  testSubjectLoc <- "./UCI HAR Dataset/test/subject_test.txt"
  myTestTable <- read.table(testSubjectLoc)
  mySubjects <- factor(myTestTable$V1)
    
  ##test data
  testLoc <- "./UCI HAR Dataset/test/X_test.txt"
  myRawTest <- read.table(testLoc)
  myTest <- cbind(myRawTest,myActivity,mySubjects)

  ##train data Activity Index factor variable
  trainFactorLoc <- "./UCI HAR Dataset/train/y_train.txt"
  myTrainfactors <- read.table(trainFactorLoc)
  myActivity <- factor(myTrainfactors$V1)
  
  #train data Subject factor variable
  trainSubjectLoc <- "./UCI HAR Dataset/train/subject_train.txt"
  myTrainTable <- read.table(trainSubjectLoc)
  mySubjects <- factor(myTrainTable$V1)
  
  #train data
  trainLoc <- "./UCI HAR Dataset/train/X_train.txt"
  myRawTrain <- read.table(trainLoc)
  myTrain <- cbind(myRawTrain,myActivity,mySubjects)

  # Combine them together
  myFullData <- rbind(myTest,myTrain)
  
  ##clear memory of all but Full data
  rm(list=(ls()[ls()!="myFullData"])) 

## Step 2 
## Extract only the measuremenets on the mean and 
## standard deviation for each measurement
  
  ##Load column definitions
  featureLoc <- "./UCI HAR Dataset/features.txt"
  myRawCols <- read.table(featureLoc)
  
  #Extract lines with relevent terms
  myMeancols <- grep("mean()",myRawCols$V2)
  myStdcols <- grep("std()",myRawCols$V2)
  
  ##Create Index variable that will be the column index

  myIndex <- c(myMeancols,myStdcols,562,563) 
  myIndex <- sort(myIndex)
  
  ##Apply index selecing only relvent columns
  myData <- myFullData[,myIndex]


  ##clear memory of all but Full data
  rm(list=(ls()[ls()!="myData"])) 

## Step 3
## Use descriptive activty names to name the activities 
## in the dataset
  
  nameLoc <- "./UCI HAR Dataset/activity_labels.txt"
  myRawNames <- read.table(nameLoc)
  names(myRawNames) <- c("myActivity","Activity")
  
  myMerge <- merge(myRawNames,myData, 
                    by.x = "myActivity", 
                    by.y = "myActivity")
  
  ## Reordering dataset to put subject first and activity 
  ## second removing extra column with Activity Index
  mySet <- myMerge[,c(82,2:81)]

  
  ##clear memory of all but Full data
  rm(list=(ls()[ls()!="mySet"])) 
  
## Step 4 
## Appropriately label the data set with descriptive 
## variable names

  ##Load column definitions 
  featureLoc <- "./UCI HAR Dataset/features.txt"
  myRawCols <- read.table(featureLoc)
  
  #Extract lines with relevent terms
  myMeancols <- grep("mean()",myRawCols$V2)
  myStdcols <- grep("std()",myRawCols$V2)
  myIndex <- c(myMeancols,myStdcols) 
  myIndex <- sort(myIndex)
  myList <- myRawCols[myIndex,]
  
  #Perform Modificatins to Existing Names
  names(myList) <- c("Index","Original")
  mySub <- gsub("^t", "Time", myList$Original)
  mySub <- gsub("^f", "Frequency",mySub)
  mySub <- gsub("Acc", "Accelerometer",mySub)
  mySub <- gsub("Gyro", "Gyroscope",mySub)
  mySub <- gsub("Jerk", "JerkSignal",mySub)
  mySub <- gsub("Mag", "Magnitude",mySub)
  mySub <- gsub("BodyBody","Body",mySub)
  mySub <- gsub("\\-mean\\(\\)","Mean",mySub)
  mySub <- gsub("\\-std\\(\\)","StandardDeviation",mySub)
  mySub <- gsub("\\-meanFreq\\(\\)","MeanFrequency",mySub)
  mySub <- gsub("\\-X","AxisX",mySub)
  mySub <- gsub("\\-Y","AxisY",mySub)
  mySub <- gsub("\\-Z","AxisZ",mySub)
  
  ## apply this list as the column names for dataset
  names(mySet) <- c("SubjectNumber","Activity",mySub)

  ##clear memory of all but Full data
  rm(list=(ls()[ls()!="mySet"])) 
  
## Step 5
## Create a second, independent tidy data set with the
## average, of each variable for each activity and each
## subject
  
  ## Reshape the data so all the measurment columns are
  ## in one column called variable
  library(reshape2)
  myMelt <- melt(mySet,id=c("SubjectNumber","Activity")
                 ,measure.vars=3:81)
  
  ## Calculate the mean of the values by Measurement
  library(plyr)
  myMeans <- ddply(myMelt,.(SubjectNumber,Activity,variable)
                 ,summarize,value=mean(value))
  
  ## Reshape the data so all the measurement columns are
  ## spread across multiple columns again
  myFinal <- dcast(myMeans, SubjectNumber+Activity
                    ~ variable)
  
  ## Export Tidy data set to Working directory
  write.table(myFinal, "./tidy_data.csv", sep=",") 
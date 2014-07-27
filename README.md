#Getting and Cleaning Data Course Project

## Purpose
This repository contains the code to summarize the data from a study where data was collected 
from the accelerometers on the Samsung Galaxy S smartphone

The resulting tidy dataset consists of one record for each combination
of subject and activity with the average calculation from a variety of 
measurments collected as part of the original analysis

### Data Set used for this Analysis:

[id]: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
UCI HAR Dataset

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Steps to create tidy dataset from script:
1. Download Dataset from link above
2. Unzip contents of dataset into working directory
  * Make sure the folder inside the working directory is labled: "UCI HAR Dataset"
4. Execute run\_analysis.R to create the summarized data set named tidy_data.txt 

## Code Book for output of tidy data set
https://github.com/rebecca3462/Course3project/blob/master/CodeBook.md
* Note: GitHub is not displaying the data for all 68 variables for some reason I cannot figure out, if you click Raw you can see that the descriptions go all the way through 68. If you can figure out why this is happening and let me know in the grading comments that would be reall helpful. 

### Processing Performed

#### run_anllysis.R
**1. Merges the training and the test sets to create one data set.**

**Steps:**  
    a.) Loads the y_test.txt file into a dataframe  
    b.) Assigns the values to a factor vector labeled myActivity  
    c.) Loads the subject_test.txt file into a dataframe  
    d.) Assigns the values to a factor vector labled mySubjects  
    e.) Loads the X_test.txt file into a dataframe  
    f.) Column Binds the myActivity and mySubject variables to the end of a data frame named myTest  
    g.) Loads the y_train.txt file into a dataframe  
    h.) Assigns the values to a factor vector labeled myActivity  
    i.) Loads the subject_train.txt file into a dataframe  
    j.) Assigns the values to a factor vector labled mySubjects  
    k.) Loads the X_train.txt file into a dataframe  
    l.) Column Binds the myActivity and mySubject variables to the end of a data frame named myTrain  
    m.) Row Binds the two data frames together into one data frame named myFullData  
    n.) Clears memory of all but the myFullData data frame.   
        * My computer has very limited resources and this was neccisary to continue processing 

**2. Extracts only the measurements on the mean and standard deviation for each measurement.** 

**Steps:**  
    a.) Loads the data from features.txt into a dataframe  
    b.) Using grep, creates an integer vector with the row positions of variables containing the phrase mean() named myMeancols  
    c.) Using grep, creates an integer vector with the row positions of variables containing the phrase std() named myStdcols  
    d.) Combines the two vectors along with the last two index positions of mySubjects (561) and myActivity (562)  
    e.) Orders the vector so the columsn returned will be in the order of the original data frame  
    f.) Applys the vector to the myFullData data frame by subsetting the columns with this index so that a new data frame named myData is created  
        * This data frame only contains the columns with measurements containing mean and standard deviation as well as the index for Subject and Activity  
    g.) Clears memory of all but the new frame named myData
        
**3. Uses descriptive activity names to name the activities in the data set**

**Steps:**  
    a.) Loads the labels in activity_labels.txt into a dataframe  
    b.) Labels the columns of this data frame myActivity and Activity where myActivity is the integer value of the activity and Activity is the label of the activity performed  
    c.) Using merge, combines this dataframe with myData by matching the Activity Index columns labeled myActvity  
    d.) Creates a data set labeled mySet which is ordered with the Subject index first, the Activity Label second and all the measurements after that without the Activity Index  
    
**4. Appropriately labels the data set with descriptive variable names.** 

**Steps:**  
    a.) Loads the measurement descriptions from the file features.txt into a data frame named myRawCols  
    b.) Following similar steps as step 2, uses grep to extract only the values where the phrase mean() or std() is present into an index vector  
    c.) Orders the index vector so it matches with the order of the existing frame  
    d.) Applys this index to the myRawCols dataframe creating a vector of terms to by used as the column labels named myList  
    e.) Using grep, performs substitution of existing abbreviations to create full words making the data more descriptive  
      * I chose to use CamelCase in order to create a natural seperation between words that does not introduce any special characters.  
      * I chose to replace all substitutions with complete words in order to be consistant  
      * The term Jerk alone was confusing to me so replaced it with JerkSignal based on the information in features_info that used the term JerkSignal when refering to the Jerk measurements  
      * I added the word Axis to the measurements -X,-Y,-Z to make it clear what these letters reprsented  
      * I corrected the labeling error BodyBody by replacing it with the term Body  
    f.) Applies these labels to the dataset naming the subject column SubjectNumber and the activity label column named Activity  
    g.) Clears memory of all but data framed labeled mySet  
    
**5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.**   
    
**Steps:**      
    a.) Loads the library reshape2 in order to utilize the melt and cast comands  
    b.) Using the melt command, creates a new datafame that pivots all the measurement columns into one long column with the measurement column name in a column labeled variable and the value of the measurement in a column named value  
    c.) Loads the library plyr in order to utlize ddply  
    d.) Using ddply, groups the data by Subject, Activity and Measurement taking the mean of the value column  
    e.) Using the dcast command, expands the data back out so that all the measurements are in their own column again in a data frame named myFinal  
    f.) Writes this data frame into a file named tidy_data.txt which is created in the working directory  
    g.) Clears memory of all but the first dataset and the new tidy dataset  
       * This is in case the personing running the code would like to perform analysis on either of the sets following the running of this script





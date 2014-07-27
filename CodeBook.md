---
title: "Code Book for Final Tidy Data"
output: html_document
---

### Original Dataset Properties
This data was from a study performed on 30 indivduals wearing a Samsung Galaxy Smartphone with an accelerometer and gyroscope. Measurements were taken from the devices as the 30 Subjects performed 6 different activities. Various statistical calculations were performed on these measurements and recorded for each subject and activity.

For complete information on the original study follow link below:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

#### Components of Original Dataset
* The 30 Subjects were broken into two groups: 70% Test and 30% Train
* The data existed in two folders, one with data from test group and the other with data from the train group
* Each set contained 3 files
    * X\_ Values which were the measurements spread across 561 Columns
    * y\_ The row position of the 6 activites
    * subject\_ The rows positions of the 30 subjects
* The names of the measurements were in a file entitled features.txt in the root directory
* the names of the activities were in a file entitled activity\_labels.txt in the root directory

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
    f.) Writes this data frame into a file named tidy_data.csv which is created in the working directory  
    g.) Clears memory of all but the first dataset and the new tidy dataset  
       * This is in case the personing running the code would like to perform analysis on either of the sets following the running of this script  
       
#### Tidy Data Set Properties

**Each Record Represents:**

* A combination of Subject and Activity with the mean of the statistics on the measurements for each combination

**Properties**

* Each subject has 6 records, one for each activity

* The subjects actually performed the activities more than once in the orignal study so these measurements represent the mean of the orignal statistics 


### Data Dictionary

 1. SubjectNumber    
     Number from 1-30 indicating which subject performed the activity
    
 2. Activity  
      Label of the Activity performed by the subject  
          1 WALKING  
          2 WALKING_UPSTAIRS  
          3 WALKING_DOWNSTAIRS  
          4 SITTING  
          5 STANDING  
          6 LAYING  
     
 3. TimeBodyAccelerometerMeanAxisX  
    Mean calculation of the measurements taken in the time domain for the body acceleration signal occuring on the X Axis from the accelerometer  
    0.2216..0.3015  
    
 4. TimeBodyAccelerometerMeanAxisY  
     Mean calculation of the measurements taken in the time domain for the body acceleration signal occuring on the Y Axis from the accelerometer  
    -0.040514..-0.001308
     
 5. TimeBodyAccelerometerMeanAxisZ    
     Mean calculation of the measurements taken in the time domain for the body acceleration signal occuring on the Z Axis from the accelerometer  
     -0.15251..-0.07538
     
 6. TimeBodyAccelerometerStandardDeviationAxisX   
     Mean calculation of the Standard Deviation on the measurements taken in the time domain for the body acceleration signal occuring on the X Axis from the accelerometer  
     -0.9961..0.6269 
     
 7. TimeBodyAccelerometerStandardDeviationAxisY   
      Mean calculation of the Standard Deviation on the measurements taken in the time domain for the body acceleration signal occuring on the Y Axis from the accelerometer  
      -0.99024..0.61694 
      
 8. TimeBodyAccelerometerStandardDeviationAxisZ  
      Mean calculation of the Standard Deviation on the measurements taken in the time domain for the body acceleration signal occuring on the Z Axis from the accelerometer  
      -0.9877..0.6090 
      
 9. TimeGravityAccelerometerMeanAxisX  
     Mean calculation of the measurements taken in the time domain for the gravity acceleration signal occuring on the X Axis from the accelerometer  
     -0.6800..0.9745   
     
10. TimeGravityAccelerometerMeanAxisY   
     Mean calculation of the measurements taken in the time domain for the gravity acceleration signal occuring on the Y Axis from the accelerometer  
     -0.47989..0.95659  
     
11. TimeGravityAccelerometerMeanAxisZ    
     Mean calculation of the measurements taken in the time domain for the gravity acceleration signal occuring on the Z Axis from the accelerometer  
     -0.49509..0.95787   
     
12. TimeGravityAccelerometerStandardDeviationAxisX  
      Mean calculation of the Standard Deviation on the measurements taken in the time domain for the gravity acceleration signal occuring on the X Axis from the accelerometer  
      -0.9968..-0.8296   
      
13. TimeGravityAccelerometerStandardDeviationAxisY   
      Mean calculation of the Standard Deviation on the measurements taken in the time domain for the gravity acceleration signal occuring on the Y Axis from the accelerometer  
      -0.9942..-0.6436 
      
14. TimeGravityAccelerometerStandardDeviationAxisZ     
      Mean calculation of the Standard Deviation on the measurements taken in the time domain for the gravity acceleration signal occuring on the Z Axis from the accelerometer  
      -0.9910..-0.6102 
      
15. TimeBodyAccelerometerJerkSignalMeanAxisX  
      Mean calculation of the Jerk Signal derived in time from the body linear accelleration and the angular velocity on the X Axis from the accelerometer  
      0.04269..0.13019
      
16. TimeBodyAccelerometerJerkSignalMeanAxisY  
      Mean calculation of the Jerk Signal derived in time from the body linear accelleration and the angular velocity on the X Axis from the accelerometer  
      -0.0386872..0.0568186
      
17. TimeBodyAccelerometerJerkSignalMeanAxisZ   
      Mean calculation of the Jerk Signal derived in time from the body linear accelleration and the angular velocity on the X Axis from the accelerometer  
      -0.067458..0.038053
      
18. TimeBodyAccelerometerJerkSignalStandardDeviationAxisX  
      Mean calculation of the Standard deviation calculation from the Jerk Signal derived in time from the body linear accelleration and the angular velocity on the X Axis from the accelerometer  
      -0.9946..0.5443  
      
19. TimeBodyAccelerometerJerkSignalStandardDeviationAxisY   
      Mean calculation of the Standard deviation calculation from the Jerk Signal derived in time from the body linear accelleration and the angular velocity on the Y Axis from the accelerometer  
      -0.9895..0.3553
      
20. TimeBodyAccelerometerJerkSignalStandardDeviationAxisZ   
      Mean calculation of the Standard deviation calculation from the Jerk Signal derived in time from the body linear accelleration and the angular velocity on the Z Axis from the accelerometer  
      -0.99329..0.03102
      
21. TimeBodyGyroscopeMeanAxisX    
    Mean calculation of the measurements taken in the time domain for the body acceleration signal occuring on the X Axis from the gyroscope  
    -0.20578..0.19270
    
22. TimeBodyGyroscopeMeanAxisY    
    Mean calculation of the measurements taken in the time domain for the body acceleration signal occuring on the Y Axis from the gyroscope  
    -0.20421..0.02747
    
23. TimeBodyGyroscopeMeanAxisZ   
    Mean calculation of the measurements taken in the time domain for the body acceleration signal occuring on the Z Axis from the gyroscope  
    0.07245..0.17910
    
24. TimeBodyGyroscopeStandardDeviationAxisX    
     Mean calculation of the Standard Deviation on the measurements taken in the time domain for the body acceleration signal occuring on the X Axis from the gyroscope  
     -0.9943..0.2677 
     
25. TimeBodyGyroscopeStandardDeviationAxisY  
     Mean calculation of the Standard Deviation on the measurements taken in the time domain for the body acceleration signal occuring on the Y Axis from the gyroscope  
    -0.9942..0.4765
    
26. TimeBodyGyroscopeStandardDeviationAxisZ   
     Mean calculation of the Standard Deviation on the measurements taken in the time domain for the body acceleration signal occuring on the Z Axis from the gyroscope  
     -0.9855..0.5649
     
27. TimeBodyGyroscopeJerkSignalMeanAxisX  
      Mean calculation of the Jerk Signal derived in time from the body linear accelleration and the angular velocity on the X Axis from the gyroscope  
    -0.15721..-0.02209 
    
28. TimeBodyGyroscopeJerkSignalMeanAxisY  
      Mean calculation of the Jerk Signal derived in time from the body linear accelleration and the angular velocity on the Y Axis from the gyroscope  
     -0.07681..-0.01320
     
29. TimeBodyGyroscopeJerkSignalMeanAxisZ  
      Mean calculation of the Jerk Signal derived in time from the body linear accelleration and the angular velocity on the Z Axis from the gyroscope  
     -0.092500..-0.006941 
     
30. TimeBodyGyroscopeJerkSignalStandardDeviationAxisX  
      Mean calculation of the Standard deviation calculation from the Jerk Signal derived in time from the body linear accelleration and the angular velocity on the X Axis from the gyroscope  
      -0.9965..0.1791
      
31. TimeBodyGyroscopeJerkSignalStandardDeviationAxisY  
      Mean calculation of the Standard deviation calculation from the Jerk Signal derived in time from the body linear accelleration and the angular velocity on the Y Axis from the gyroscope  
      -0.9971..0.2959
      
32. TimeBodyGyroscopeJerkSignalStandardDeviationAxisZ  
      Mean calculation of the Standard deviation calculation from the Jerk Signal derived in time from the body linear accelleration and the angular velocity on the Z Axis from the gyroscope  
      -0.9954..0.1932
      
33. TimeBodyAccelerometerMagnitudeMean  
      Mean calculation of the magnitude of the three dimensional signals calculated using the Euclidean norm for the measurements taken in the time domain for the body acceleration signal by the accelerometer  
      -0.9865..0.6446
      
34. TimeBodyAccelerometerMagnitudeStandardDeviation  
      Mean calculation of the Standard Deviation of the magnitude of the three dimensional signals calculated using the Euclidean norm for the measurements taken in the time domain for the body acceleration signal by the accelerometer  
      -0.9865..0.4284
      
35. TimeGravityAccelerometerMagnitudeMean  
      Mean calculation of the magnitude of the three dimensional signals calculated using the Euclidean norm for the measurements taken in the time domain for the body acceleration signal by the accelerometer  
      -0.9865..0.6446 
      
36. TimeGravityAccelerometerMagnitudeStandardDeviation  
      Mean calculation of the Standard Deviation of the magnitude of the three dimensional signals calculated using the Euclidean norm for the measurements taken in the time domain for the gravity acceleration signal by the accelerometer  
      -0.9865..0.4284
      
37. TimeBodyAccelerometerJerkSignalMagnitudeMean  
      Mean calculation of the magnitude of the three dimensional signals calculated using the Euclidean norm of the Jerk Signal derived in time from the body linear accelleration and the angular velocity from the accelerometer  
      -0.9928..0.4345
      
38. TimeBodyAccelerometerJerkSignalMagnitudeStandardDeviation  
      Mean calculation of the Standard Deviation of the magnitude of the three dimensional signals calculated using the Euclidean norm of the Jerk Signal derived in time from the body linear accelleration and the angular velocity from the accelerometer  
      -0.9946..0.4506
      
39. TimeBodyGyroscopeMagnitudeMean   
      Mean calculation of the magnitude of the three dimensional signals calculated using the Euclidean norm for the measurements taken in the time domain for the body acceleration signal by the gyroscope  
      -0.9807..0.4180
      
40. TimeBodyGyroscopeMagnitudeStandardDeviation   
      Mean calculation of the Standard Deviation of the magnitude of the three dimensional signals calculated using the Euclidean norm for the measurements taken in the time domain for the gravity acceleration signal by the gyroscope  
      -0.9814..0.3000
            
41. TimeBodyGyroscopeJerkSignalMagnitudeMean  
      Mean calculation of the magnitude of the three dimensional signals calculated using the Euclidean norm of the Jerk Signal derived in time from the body linear accelleration and the angular velocity from the gyroscope  
      -0.99732..0.08758
      
42. TimeBodyGyroscopeJerkSignalMagnitudeStandardDeviation  
      Mean calculation of the Standard Deviation of the magnitude of the three dimensional signals calculated using the Euclidean norm of the Jerk Signal derived in time from the body linear accelleration and the angular velocity from the accelerometer  
      -0.9977..0.2502 
      
43. FrequencyBodyAccelerometerMeanAxisX                             
    Mean calculation of the frequency domain signals for body acceleration occuring on the X Axis from the accelerometer  
    -0.9952..0.5370 

44. FrequencyBodyAccelerometerMeanAxisY 
    Mean calculation of the frequency domain signals for body acceleration occuring on the Y Axis from the accelerometer  
    -0.98903..0.52419 

45. FrequencyBodyAccelerometerMeanAxisZ         
    Mean calculation of the frequency domain signals for body acceleration occuring on the Z Axis from the accelerometer  
    -0.9895..0.2807
    
46. FrequencyBodyAccelerometerStandardDeviationAxisX  
     Mean calculation of the Standard Deviation of the frequency domain signals for body acceleration occuring occuring on the X Axis from the accelerometer  
     -0.9966..0.6585
     
47. FrequencyBodyAccelerometerStandardDeviationAxisY 
     Mean calculation of the Standard Deviation of the frequency domain signals for body acceleration occuring occuring on the Y Axis from the accelerometer  
     -0.99068..0.56019
     
48. FrequencyBodyAccelerometerStandardDeviationAxisZ 
     Mean calculation of the Standard Deviation of the frequency domain signals for body acceleration occuring occuring on the Z Axis from the accelerometer  
     -0.9872..0.6871
     
49. FrequencyBodyAccelerometerJerkSignalMeanAxisX  
      Mean calculation of the Jerk Signal in the frequency domain from the body linear accelleration and the angular velocity on the X Axis from the accelerometer  
      -0.9946..0.4743
      
50. FrequencyBodyAccelerometerJerkSignalMeanAxisY 
      Mean calculation of the Jerk Signal in the frequency domain from the body linear accelleration and the angular velocity on the Y Axis from the accelerometer  
      -0.9894..0.2767
      
51. FrequencyBodyAccelerometerJerkSignalMeanAxisZ  
      Mean calculation of the Jerk Signal in the frequency domain from the body linear accelleration and the angular velocity on the Z Axis from the accelerometer  
      -0.9920..0.1578 
      
52. FrequencyBodyAccelerometerJerkSignalStandardDeviationAxisX  
    Mean calculation of the Standard deviation calculation from the Jerk Signal in the frequency domain from the body linear accelleration and the angular velocity on the X Axis from the accelerometer  
    -0.9951..0.4768

53. FrequencyBodyAccelerometerJerkSignalStandardDeviationAxisY
    Mean calculation of the Standard deviation calculation from the Jerk Signal in the frequency domain from the body linear accelleration and the angular velocity on the Y Axis from the accelerometer  
    -0.9905..0.3498
    
54. FrequencyBodyAccelerometerJerkSignalStandardDeviationAxisZ 
    Mean calculation of the Standard deviation calculation from the Jerk Signal in the frequency domain from the body linear accelleration and the angular velocity on the Z Axis from the accelerometer  
    -0.993108..-0.006236
    
55. FrequencyBodyGyroscopeMeanAxisX  
    Mean calculation of the measurements taken in the frequency domain for the body acceleration signal occuring on the X Axis from the gyroscope  
    -0.9931..0.4750
    
56. FrequencyBodyGyroscopeMeanAxisY 
    Mean calculation of the measurements taken in the frequency domain for the body acceleration signal occuring on the Y Axis from the gyroscope  
    -0.9940..0.3288
    
57. FrequencyBodyGyroscopeMeanAxisZ    
    Mean calculation of the measurements taken in the frequency domain for the body acceleration signal occuring on the Z Axis from the gyroscope  
    -0.9860..0.4924
    
58. FrequencyBodyGyroscopeStandardDeviationAxisX    
     Mean calculation of the Standard Deviation on the measurements taken in the frequency domain for the body acceleration signal occuring on the X Axis from the gyroscope  
     -0.9947..0.1966 
     
59. FrequencyBodyGyroscopeStandardDeviationAxisY 
     Mean calculation of the Standard Deviation on the measurements taken in the frequency domain for the body acceleration signal occuring on the Y Axis from the gyroscope  
     -0.9947..0.1966 
     
60. FrequencyBodyGyroscopeStandardDeviationAxisZ   
     Mean calculation of the Standard Deviation on the measurements taken in the frequency domain for the body acceleration signal occuring on the X Axis from the gyroscope  
     -0.9867..0.5225
     
61. FrequencyBodyAccelerometerMagnitudeMean   
 Mean calculation of the magnitude of the three dimensional signals calculated using the Euclidean norm for the measurements taken in the frequency domain for the body acceleration signal by the accelerometer  
    -0.9868..0.5866
    
62. FrequencyBodyAccelerometerMagnitudeStandardDeviation       
      Mean calculation of the Standard Deviation of the magnitude of the three dimensional signals calculated using the Euclidean norm for the measurements taken in the frequency domain for the body acceleration signal by the accelerometer  
      -0.9876..0.1787
      
63. FrequencyBodyAccelerometerJerkSignalMagnitudeMean       
Mean calculation of the magnitude of the three dimensional signals calculated using the Euclidean norm of the Jerk Signal derived in the frequency domain from the body linear accelleration and the angular velocity from the accelerometer  
      -0.9940..0.5384

64. FrequencyBodyAccelerometerJerkSignalMagnitudeStandardDeviation 
      Mean calculation of the Standard Deviation of the magnitude of the three dimensional signals calculated using the Euclidean norm of the Jerk Signal derived in the frequency domain from the body linear accelleration and the angular velocity from the accelerometer  
      -0.9944..0.3163 
      
65. FrequencyBodyGyroscopeMagnitudeMean   
      Mean calculation of the magnitude of the three dimensional signals calculated using the Euclidean norm for the measurements taken in the frequency domain for the body acceleration signal by the gyroscope  
      -0.9865 ..0.2040
      
66. FrequencyBodyGyroscopeMagnitudeStandardDeviation    
      Mean calculation of the Standard Deviation of the magnitude of the three dimensional signals calculated using the Euclidean norm for the measurements taken in the frequency domain for the gravity acceleration signal by the gyroscope  
      -0.9815..0.2367
      
67. FrequencyBodyGyroscopeJerkSignalMagnitudeMean    
      Mean calculation of the magnitude of the three dimensional signals calculated using the Euclidean norm of the Jerk Signal derived in the frequency domain from the body linear accelleration and the angular velocity from the gyroscope  
      -0.9976..0.1466
      
68. FrequencyBodyGyroscopeJerkSignalMagnitudeStandardDeviation   
      Mean calculation of the Standard Deviation of the magnitude of the three dimensional signals calculated using the Euclidean norm of the Jerk Signal derived in the frequency domain from the body linear accelleration and the angular velocity on the Y Axis from the accelerometer  
      -0.9976..0.2878 
      

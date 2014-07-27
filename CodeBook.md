#Code Book for Final Tidy Data"

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
      

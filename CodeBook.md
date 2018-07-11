SUBJECTS
========

There are 30 subjects.

ACTIVITY LABELS
===============

* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING


Feature Selection 
=================

note: most of the below comes from the orginal dataset, although values that were removed from the cleaned
dataset have been cut.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc[mean|std]XYZ
* tGravityAcc[mean|std]XYZ
* tBodyAccJerk[mean|std]XYZ
* tBodyGyro[mean|std]XYZ
* tBodyGyroJerk[mean|std]XYZ
* tBodyAccMag[mean|std]
* tGravityAccMag[mean|std]
* tBodyAccJerkMag[mean|std]
* tBodyGyroMag[mean|std]
* tBodyGyroJerkMag[mean|std]
* fBodyAcc[mean|std]XYZ
* fBodyAccJerk[mean|std]XYZ
* fBodyGyro[mean|std]XYZ
* fBodyAccMag[mean|std]
* fBodyAccJerkMag[mean|std]
* fBodyGyroMag[mean|std]
* fBodyGyroJerkMag[mean|std]

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation


Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

SUMMARIES
=========

The values in the tidydata.txt file are the means of features for each group of Subject-Activity pairs.

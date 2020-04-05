Codebook

This CodeBook updates the information found in the original "raw" dataset CodeBook from Samgung's UCI HAR team. It is the /UCI HAR Dataset/README.txt.
 So, in order to fully understand this dataset, it is highly recommended to understand first what all the original measurements are all about.

As a summary: the original dataset is obtained from measuring the activity on specific sensors on Samsung devices for 30 test subjects. For each one, a series of data is obtained; basically: acceleration and angular velocity (in each one of the XYZ axis). 

Please note that, as explained in the corresponding (/UCI HAR Dataset/README.txt) file, after the whole processing, all values are normalized to [-1,1]. This fact has an important consequence, and it is that, despite original measurements where in "G" and "rad/s" units, normalized values no longer have units. 

Source dataset(s), and transformations

"RAW" origin data

The origin dataset is composed by two series of data devised originally to train/test a Machine Learning system. Thus, the original "raw" data is decomposed in two subsets of three data sources each:
    • Training dataset
        ◦ Features ("X""), inputs.
        ◦ Results ("Y"), outputs (activity code).
        ◦ Subjects
    • Test dataset
        ◦ Features ("X""), inputs.
        ◦ Results ("Y"), outputs (activity code.
        ◦ Subjects
Each "X" subset corresponds to 561 features derived from original raw measurements, and "subjects" give us an unique subject ID for each row (measurement)
In order to make data more tidy, we must also use the activty labels instead of the activity codes. Activity labels can be found also in the original repository, in (/UCI HAR Dataset/activity_labels.txt).
Transformations

Transformation of the source "raw" dataset(s) into the desired dataset is accomplished by a series of steps:
    1. Read activity labels (from /UCI HAR Dataset/activity_labels.txt) and add two labels: activity_id and subject
    2. Read feature names (from /UCI HAR Dataset/features.txt)
    3. Read  561 features lines from both train/test data (X_{train,test}.txt)
        i. cbind each one of them with data from subjects (subject_{train,test}.txt)
        ii. cbind each one of them with data from activities (y_{train,test}.txt)
    4. Bind (rbind) both data sub-sets into one
    5. Add column subject (from step 1)
    6. Add a column derived from the activity column to have a activity label
    7. Filter columns. The assignment description tells us to keep only those measurements corresponding to mean and std..After carefully looking throung the original codebook, we can find out that those column share a common pattern, and this pattern is that the have either the atom "mean()" or the atom "std()" in their names. So, in order to keep only those columns, we need to select (grep) in the dataset column names these regular expressions, columns for us: Activity and Subject:

   8. Once we have our filtered columns, we can advance and rename variables (column names) to make our dataset more tidy. 
   9. At this point, we have a dataset corresponding to steps 1-4 of the assignment, we can go further and make necessary transformations to also accomplish step 5.
   10. In order to do that, we need to average all values grouping by subject/activity. 

The variables

Only all the variables estimated from mean and standard deviation in the tidy set were kept.

mean(): Mean value
std(): Standard deviation

The data were averaged based on subject and activity group.
subjectId column is numbered sequentially from 1 to 30. activityType column has 6 types as listed below.

WALKING
WALKING_UPSTAIRS
WALKING_DOWNSTAIRS
SITTING
STANDING
LAYING


The tidy data contains 6*30=180 rows each subject with different activity types and 69 coloumns (66 variables)
"subjectId"
"activityType"
"activityId"
"tBodyAcc-mean()-X"
"tBodyAcc-mean()-Y"
"tBodyAcc-mean()-Z"
"tBodyAcc-std()-X"
"tBodyAcc-std()-Y"
"tBodyAcc-std()-Z"
"tGravityAcc-mean()-X"
"tGravityAcc-mean()-Y"
"tGravityAcc-mean()-Z"
"tGravityAcc-std()-X"
"tGravityAcc-std()-Y"
"tGravityAcc-std()-Z"
"tBodyAccJerk-mean()-X"
"tBodyAccJerk-mean()-Y"
"tBodyAccJerk-mean()-Z"
"tBodyAccJerk-std()-X"
"tBodyAccJerk-std()-Y"
"tBodyAccJerk-std()-Z"
"tBodyGyro-mean()-X"
"tBodyGyro-mean()-Y"
"tBodyGyro-mean()-Z"
"tBodyGyro-std()-X"
"tBodyGyro-std()-Y"
"tBodyGyro-std()-Z"
"tBodyGyroJerk-mean()-X"
"tBodyGyroJerk-mean()-Y"
"tBodyGyroJerk-mean()-Z"
"tBodyGyroJerk-std()-X"
"tBodyGyroJerk-std()-Y"
"tBodyGyroJerk-std()-Z"
"tBodyAccMag-mean()"
"tBodyAccMag-std()"
"tGravityAccMag-mean()"
"tGravityAccMag-std()"
"tBodyAccJerkMag-mean()"
"tBodyAccJerkMag-std()"
"tBodyGyroMag-mean()"
"tBodyGyroMag-std()"
"tBodyGyroJerkMag-mean()"
"tBodyGyroJerkMag-std()"
"fBodyAcc-mean()-X"
"fBodyAcc-mean()-Y"
"fBodyAcc-mean()-Z"
"fBodyAcc-std()-X"
"fBodyAcc-std()-Y"
"fBodyAcc-std()-Z"
"fBodyAccJerk-mean()-X"
"fBodyAccJerk-mean()-Y"
"fBodyAccJerk-mean()-Z"
"fBodyAccJerk-std()-X"
"fBodyAccJerk-std()-Y"
"fBodyAccJerk-std()-Z"
"fBodyGyro-mean()-X"
"fBodyGyro-mean()-Y"
"fBodyGyro-mean()-Z"
"fBodyGyro-std()-X"
"fBodyGyro-std()-Y"
"fBodyGyro-std()-Z"
"fBodyAccMag-mean()"
"fBodyAccMag-std()"
"fBodyBodyAccJerkMag-mean()"
"fBodyBodyAccJerkMag-std()"
"fBodyBodyGyroMag-mean()"
"fBodyBodyGyroMag-std()"
"fBodyBodyGyroJerkMag-mean()"
"fBodyBodyGyroJerkMag-std()"

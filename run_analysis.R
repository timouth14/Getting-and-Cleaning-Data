library(dplyr); library(data.table)
## read the files and create variables of UCI HAR Dataset
##read activity_lables
setwd("E:/Documents/datasciencecoursera/Data/Getting-and-Cleaning-Data/UCI HAR Dataset")

activityNames <- read.table("activity_labels.txt", sep = "", header = FALSE)
activityNames[,2] = as.character(activityNames[,2])

##read features
Features <- read.table("features.txt", sep = "", header = FALSE)

##extract the mean and std value of the dataset
FeaturesMeanStd = grep(".*mean.*|.*std.*", Features[,2])
FeaturesMeanStd.names = Features[FeaturesMeanStd,2]
FeatureMeanStd.names = gsub('-mean', 'Mean', FeaturesMeanStd.names)
FeaturesMeanStd.names = gsub('-std', 'Std', FeaturesMeanStd.names)
FeaturesMeanStd.names = gsub('[-()]', '', FeaturesMeanStd.names)


## extract test data

setwd("E:/Documents/datasciencecoursera/Data/Getting-and-Cleaning-Data/UCI HAR Dataset/test")

X_test <- read.table("X_test.txt", sep = "", stringsAsFactors = FALSE,  header = FALSE )[FeaturesMeanStd]
Y_test <- read.table("y_test.txt", sep = "", header = FALSE)
subject_test <- read.table("subject_test.txt", sep = "", header = FALSE)
                           
## bind the 3 file to create DF with 3 column
Data_test <- cbind(subject_test, Y_test,X_test)

##Do the same with train
setwd("E:/Documents/datasciencecoursera/Data/Getting-and-Cleaning-Data/UCI HAR Dataset/train")
X_train <- read.table("X_train.txt", sep = "", stringsAsFactors = FALSE ,header = FALSE)[FeaturesMeanStd]
Y_train <- read.table("y_train.txt", sep = "", header = F)
subject_train <- read.table("subject_train.txt", sep = "", header = F)
Data_train <- cbind(subject_train,Y_train, X_train)

##Then we merge the 2 df in 1

DataMerge <- rbind(Data_test, Data_train)
colnames(DataMerge) = c("Subject", "Activity", FeatureMeanStd.names)

## Name activity with activity_labels

DataMerge$Activity = factor(DataMerge$Activity, levels = activityNames[,1], labels = activityNames[,2])
DataMerge$Subject = as.factor(DataMerge$Subject)

## create the tidy date
DataMergeMel = melt(DataMerge, id = c("Subject", "Activity"))
DataMergeMean = dcast(DataMergeMel, Subject + Activity ~ variable, mean)

## write the DF in the main repo
setwd("E:/Documents/datasciencecoursera/Data/Getting-and-Cleaning-Data/UCI HAR Dataset")

write.table(DataMergeMean, "tidy.txt", row.names = FALSE, quote = FALSE)    
  
    

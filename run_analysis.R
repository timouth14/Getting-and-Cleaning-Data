
## read the files and create variables with test files.txt

##X_test.txt = test set
##y_test.txt = test labels
##subject_test.txt = subject
library(dplyr); library(reshape2)
setwd("E:/Documents/datasciencecoursera/Data/Getting-and-Cleaning-Data/UCI HAR Dataset/test")

X_test <- read.table("X_test.txt", sep = "", stringsAsFactors = FALSE,  header = FALSE )
Y_test <- read.table("y_test.txt", sep = "", header = FALSE, col.names = "Activity")
subject_test <- read.table("subject_test.txt", sep = "", header = FALSE, col.names = "subject_id")
                           
## bind the 3 file to create DF with 3 column
Data_test <- cbind(subject_test, Y_test,X_test)

##Do the same with train
setwd("E:/Documents/datasciencecoursera/Data/Getting-and-Cleaning-Data/UCI HAR Dataset/train")
X_train <- read.table("X_train.txt", sep = "", stringsAsFactors = FALSE ,header = FALSE)
Y_train <- read.table("y_train.txt", sep = "", header = F, col.names = "Activity")
subject_train <- read.table("subject_train.txt", sep = "", header = F, col.names = "subject_id")
Data_train <- cbind(subject_train,Y_train, X_train)

##Then we merge the 2 df in 1
##Dataset from step 1 of the assignment
DataMerge <- rbind(Data_test, Data_train)

## Read features.txt to find mean and std
setwd("E:/Documents/datasciencecoursera/Data/Getting-and-Cleaning-Data/UCI HAR Dataset")
Features <- read.table("features.txt", sep = "", header = FALSE)
##extract the mean and std value of the dataset
FeatMeanStd <- table(grep("mean|std", Features$V2))
##Remove the meanFreq data
##Dataset of the step 2
MeanStd <- table(grep("meanFreq", FeatMeanStd, invert = TRUE))

##Step 3 avtivity labels
Activity <- rbind(Y_test,Y_train)
    
    
    

## To run this script make sure that your working directory is set under the "UCI HAR Dataset" folder.

## Download and name file, which includes variable names, in R.

variables<- read.table("features.txt", sep="")

## Download and name each Test file in R

subject_test <- read.table("test/subject_test.txt", sep="")
X_test <- read.table("test/X_test.txt", sep="")
y_test <- read.table("test/y_test.txt", sep="")

## Download and name each Train file in R

subject_train <- read.table("train/subject_train.txt", sep="")
X_train <- read.table("train/X_train.txt", sep="")
y_train <- read.table("train/y_train.txt", sep="")
        
## Bind the Test and Train files together: 1. rbind() X_train and X_test, 2. rbind() Y_train and Y_test, then cbind() the X's to the Y's.
X <- rbind(X_train, X_test)
Y <- rbind(y_train, y_test)
colnames(Y) <- c("activity")
data <- cbind(X,Y)

## Extract mean and standard deviation for each measurement.
features <- read.table("features.txt", sep="")
mean.std.vector <-grepl('mean\\(\\)|std\\(\\)',features[,"V2"])
mean.std <- features[mean.std.vector,]

## Uses descriptive activity names to name the activities in the data set.
        ## We will rename the activities using the following code: 1. tBody with TimeBody, 2. fBody with FrequencyBody, 3. tGravity with TimeGravity, 4. fGravity with FrequencyGravity, 5. Acc with Accelerometer, 6. Gyro with Gyroscopic, 7. Mag with Magniture, 8. std() with StdDev, 9. mean() with Mean
        ## We will use the gsub function to achieve our goals.
        One <- gsub("tBody", "TimeBody", mean.std[,2])
        Two <- gsub("fBody", "FrequencyBody", One)
        Three <- gsub("tGravity", "TimeGravity", Two) 
        Four <- gsub("fGravity", "FrequencyGravity", Three) 
        Five <- gsub("Acc", "Accelerometer", Four) 
        Six <- gsub("Gyro", "Gyroscopic", Five) 
        Seven <- gsub("Mag", "Magnitude", Six)
        Eight <- gsub("std", "StdDev", Seven)
        FinalColNames <- gsub("mean()", "Mean", Eight)

## Add activity description column to dataset
activities <- read.table("activity_labels.txt", sep="")
colnames(activities) <- c("activitynum", "activityname")
mergedData <- merge(data, activities, by.x="activity", by.y="activitynum")

## Filter and rename dataset with mean and standard deviation measurements ONLY.
Colneeded <- as.vector(mean.std[,1])
newdata <- data[,Colneeded]
newdata$activity <- mergedData$activityname

## Appropriately labels the data set with descriptive variable names
newColNames <- union(FinalColNames, "activitytype")
colnames(newdata) <- as.vector(newColNames)

## Creates a tidy data set with the average of each variable for each activity and each subject.
library(data.table)
DT <- data.table(newdata)
newavgdata <- DT[,lapply(.SD, mean), by = activitytype]
write.table(newavgdata, file="TidyData.txt", sep="")




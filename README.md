<<<<<<< HEAD
GettingCleaningDataProject
==========================
=======
**Samsung Galaxy S Accelerometers Data** 
========================================================

========================================================

Data Set Information:

Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 70% of the volunteers was selected for generating the training data and 30% the test data. 

This R Markdown explain: 1. what the R script does, 2. what the final tidy data text file shows. , and 3. what the code Book provides:

========================================================

## 1. The R scipt

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

***1. Merges the training and the test sets to create one data set.***

In order to achieve the following, we use the function cbind() to combine the test and train set, respectively for X and Y. Then, we use the function rbind() to combine X and Y data sets, which we obtained previously.


***2. Extracts only the measurements on the mean and standard deviation for each measurement.***

In order to achieve that, we use the grepl() function to extract names containing mean or std


***3. Uses descriptive activity names to name the activities in the data set.***

We start by using the gsub() function to replace feature names with more descriptive ones. Then we merge the activity name file with dataset by activity number 1 through 6 (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).


***4. Appropriately labels the data set with descriptive variable names.***

We use the colMeans() function to rename the names of the dataset, by replacing with new vector names, which we obtained from the descriptive features and activity names.


***5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.***

A tidy data is described as follow:
1. Each variable form a column (dataset: 67 columns)
2. Each observation forms a row (dataset: 6 rows per colum)
3. Each table stores data about one kind of observation (dataset: averages)

We use the data.table package and the lappy() function to find the mean of each column (features) by activity (1-6/1st column).


## 2. The final tidy data 

The final tidy data text file: "TidyData.txt" shows the dataset with averages by mean for each features. Use read.table("TidyData.txt", sep="") to read the file.

## 3. The Code Book

The Code Book "CodeBook.txt" describes the variable names and summary of the function or packages used.

>>>>>>> 9ddc8cfd2150bd25ce50be697c014dca9a2e1cb7

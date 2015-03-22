#Codebook

##Getting and Cleaning Data Project

###	Introduction

The objextive of this script is to:
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The dataset is based on a experiment of "Human Activity Recognition Using Smartphones Dataset" (www.smartlab.ws).
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.

The following files are part of the dataset:

* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.

The following variables are used:

* x_train, y_train, x_test, y_test, subject_train and subject_test contain the data from the downloaded files
* x_data, y_data and subject_data merge the previous datasets to further analysis
* features contains the correct names for the x_data dataset, which are applied to the column names stored in mean_and_std_features, a numeric vector used to extract the desired data
* a similar approach is taken with activity names through the activities variable
all_data merges x_data, y_data and subject_data in a big dataset
* averages_data contains the relevant averages which will be later stored in the averages.txt file



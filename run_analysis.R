# You should create one R script called run_analysis.R that does the following. 
# .Merges the training and the test sets to create one data set.
# .Extracts only the measurements on the mean and standard deviation for each measurement. 
# .Uses descriptive activity names to name the activities in the data set
# .Appropriately labels the data set with descriptive variable names. 
# .From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


# setting up basic environment
setwd("C:\\Classes\\Coursera\\getdata-012\\UCI HAR Dataset")
library("dplyr")

#reading masterdata
xcolnames=read.table("features.txt")
xcolnames=xcolnames[,2]
activities=read.table("activity_labels.txt")

#combining the test set
y_test.db=read.table("test\\y_test.txt",col.names="activity",colClasses=("factor"))
x_test.db=read.table("test\\X_test.txt",col.names=xcolnames)
subject_test.db=read.table("test\\subject_test.txt",col.names="subject")
test.db=cbind(y_test.db, subject_test.db,x_test.db)
head(test.db)

#combining the train set
y_train.db=read.table("train\\y_train.txt",col.names="activity")
x_train.db=read.table("train\\X_train.txt",col.names=xcolnames)
subject_train.db=read.table("train\\subject_train.txt",col.names="subject")
train.db=cbind(y_train.db, subject_train.db,x_train.db)
head(train.db)

#consolidating train and test sets
consolidated.db=rbind(train.db,test.db)

#changing activity descriptions
consolidated.db$activity[consolidated.db$activity=="1"]=activities[1,2]
consolidated.db$activity[consolidated.db$activity=="2"]=activities[2,2]
consolidated.db$activity[consolidated.db$activity=="3"]=activities[3,2]
consolidated.db$activity[consolidated.db$activity=="4"]=activities[4,2]
consolidated.db$activity[consolidated.db$activity=="5"]=activities[5,2]
consolidated.db$activity[consolidated.db$activity=="6"]=activities[6,2]

#getting variables with mean and std properties
meanstd <- grep("-(mean|std)\\(\\)", xcolnames)

# subseting to desired columns 
consolidated.db <- consolidated.db[, meanstd]
head(consolidated.db)

#agregating data by subject and activity
consolidated.tiny<-aggregate(. ~subject + activity, consolidated.db, mean)
consolidated.tiny<-consolidated.tiny[order(consolidated.tiny$subject,consolidated.tiny$activity),]

#writing a average in a tiny set/file
write.table(consolidated.tiny, file = "averages.txt",row.name=FALSE)





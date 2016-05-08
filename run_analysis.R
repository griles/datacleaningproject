setwd("~/Desktop/data science masters/getting and cleaning data/UCI HAR Dataset")
library(dplyr)

Xtest <- read.table("X_test.txt", stringsAsFactors = FALSE)

Xtrain <- read.table("X_train.txt", stringsAsFactors = FALSE)

Xdata <- rbind(Xtest, Xtrain)

features <- read.table("features.txt") 
features <- as.character(features[,2])
colnames(Xdata) <- features

meanstd <- grep("mean()|std()", features)
Xdata <- Xdata[,meanstd]

activities1 <- read.table("y_test.txt")
activities2 <- read.table("y_train.txt")
activities <- rbind(activities1, activities2)
names(activities) <- "activity"

activity_labels <- read.table("activity_labels.txt")
names(activity_labels) <- c("activity", "activity_name")

activities2 <- merge(activities, activity_labels, sort=FALSE)
names(activities) <- c("activity", "activity_name")

subject1 <- read.table("subject_test.txt")
subject2 <- read.table("subject_train.txt")
subjects <- rbind(subject1, subject2)
names(subjects) <- "subjects"

data <- cbind(activities, subjects, Xdata)
data$subjects <- as.factor(data$subjects)
data$activity <- as.factor(data$activity)


tidy_data <- data%>%
      group_by(activity, subjects) %>%
      summarise_each(funs(mean(., na.rm=TRUE)))

tidy_data_labeled <- merge(tidy_data, activity_labels)
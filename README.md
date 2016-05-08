## Synopsis

This code takes a dataset on smartphone movements by various subjects doing various activities.  The script creates a tidy data set that summarizes mean values for a range of variables by subject by activity.

## read data

Data is read in as text files and combined test and train datasets.  Column names are added from the features.text file

## limiting columns to those that include mean or stdev

grep is used to create a list of the column numbers that include mean or std.  This list is then used to subset the data table.

## adding activities and subjects

activity codes and subject codes are combined and then added to the combined data set

## grouping and tidy data

dplyr package is used.  group_by creates groups for unique combinations of activity and subject.  then mean is applied for every other columns to those groups.  

Finally, the dataset is merged with the activity names dataset to add the descriptive activity names (last column.)

---
title: "README"
author: "vaibhav"
date: "June 24, 2019"
output: html_document
---

The run_analysis.R scripts works as per below description.

STEP 1

1. This Script merges the data from test and train data sets

2.Read data from train data set 

3. setting working directory to train data set

4. Reading the X_train, Y_train, subject_train tables

c <- read.table("X_train.txt")

b1 <- read.table("y_train.txt")

d1<- read.table ("subject_train.txt")

a1 <- cbind(c,b,d)

5.Read data from test data set 

6. setting working directory to test data set

7. Reading the X_test, Y_test, subject_test tables

c <- read.table("X_test.txt")

b2 <- read.table("y_test.txt")

d2<- read.table ("subject_test.txt")

8. Merging the 2 X_train ans X_test data set into 1 data set

STEP 2

9. reading the features labels

10.setting working directory to read Features

setwd("C:/Users/va18755/Documents/Version/Git/UCI HAR Dataset/")

b <- read.table("features.txt")

11. Adding entries for activity type and subject id

12. adding col names to original data set a

13. extracting cols with names as mean and std

b <- a[,grepl("\\bmean()\\b|\\bstd()\\b", names(a))]

STEP 3

14. extracting the activity names for test and train combined data

b1 <- read.table("y_train.txt")

b2 <- read.table("y_test.txt")

15. binding the Train and test activity data

b3 <- rbind(b1,b2)

d3 <- rbind(d1,d2)

16. reading the activity labels

17. merging the activity Id with activity labels

d <-merge(b3,c)

18. binding the activity names with original data set


STEP 4

19.changing the name of activity column to b

names(b)[67] <- "activity_type"

names(b)[68] <- "Subject_id"

for all other column done in step 2, col names from features.txt

step 5

20. grouping the table on the basis of activity type and subject_id

library(dplyr)
f <- b %>%
      group_by(activity_type,Subject_id) %>%
       summarise_all('mean')

21. writing the final table into the text file

write.table(f,"final_table.txt",row.names = FALSE)


/////////////////////////////////////////////////////////////////////////////

Reason for tidy data.

1. The Final table has one row per  observation.
2. Colnames are descriptive.
3. each col contains variables of the same type.
4. Data set does not have duplicate rows.

## This Script merges the data from test and train data sets

## Read data from train data set 

## setting working directory to train data set

setwd("C:/Users/va18755/Documents/Version/Git/UCI HAR Dataset/train/")

## Reading the X_train, Y_train, subject_train tables

c <- read.table("X_train.txt")

b1 <- read.table("y_train.txt")

d1<- read.table ("subject_train.txt")

a1 <- cbind(c,b,d)

## merging the X_train, Y_train, subject_train tables into 1 master table



## Read data from test data set 

## setting working directory to test data set

setwd("C:/Users/va18755/Documents/Version/Git/UCI HAR Dataset/test/")

## Reading the X_test, Y_test, subject_test tables

c <- read.table("X_test.txt")

b2 <- read.table("y_test.txt")

d2<- read.table ("subject_test.txt")

## merging the X_train, Y_train, subject_train tables into 1 master table

a2 <- cbind(c,b,d)

## merging the 2 master data set into 1 data set

a <- rbind(a1,a2)

## reading the features labels

## setting working directory to read Features

setwd("C:/Users/va18755/Documents/Version/Git/UCI HAR Dataset/")

b <- read.table("features.txt")

## Adding entries for activity type and subject id

c <- matrix(c(562,563,"Activity_type","subject_id"), nrow =2, ncol =2)

b <- rbind(b,c)

##adding col names to original data set a

colnames(a) <- b[,2]

## extracting cols with names as mean and std

b <- a[,grepl("\\bmean()\\b|\\bstd()\\b", names(a))]

## extracting the activity names for test and train data

b1 <- read.table("y_train.txt")

b2 <- read.table("y_test.txt")

## binding the Train and test activity data

b3 <- rbind(b1,b2)

d3 <- rbind(d1,d2)

## reading the activity labels

c <- read.table("activity_labels.txt")

## merging the activity Id with activity labels

d <-merge(b3,c)

## binding the activity names with original data set

b <- cbind(b,d[,2],d3)

View(d3)

## changing the name of activity column to b

names(b)[67] <- "activity_type"

names(b)[68] <- "Subject_id"

b<- cbind(b,d3)

## grouping the table on the basis of activity type

library(dplyr)
f <- b %>%
      group_by(activity_type,Subject_id) %>%
       summarise_all('mean')

## writing the final table into the text file

write.table(f,"final_table.txt",row.names = FALSE)



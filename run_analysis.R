## Coursera Getting and Cleaning Data
## Peer-graded Assignment for Week 4


library(readr)
library(dplyr)

get_data <- function() {
        # Gets data from the internet and unzips to a dataset folder
        fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        filepath <- "getdataDataset.zip"
        download.file(fileurl, destfile = filepath)
        outpath <- "dataset"
        unzip(filepath, exdir=outpath)
}



get_activities <- function() {
        # reads and joins y data, and adding labels
        # and returning a dataframe
        activitylabels <- read.table("dataset/UCI HAR Dataset/activity_labels.txt",
                                     sep= " ")
        names(activitylabels) <- c('activityid', "activity")
        y_trainfile <- "dataset/UCI HAR Dataset/train/y_train.txt"
        y_testfile <- "dataset/UCI HAR Dataset/test/y_test.txt"
        ytrain <- read.table(y_trainfile, sep=" ")
        ytest <- read.table(y_testfile, sep= " ")
        names(ytrain) <- c("activityid")
        names(ytest) <- c("activityid")
        ytest <- merge(ytest, activitylabels)
        ytest <- ytest["activity"]
        ytrain <- merge(ytrain, activitylabels)
        ytrain <- ytrain["activity"]
        activities <- rbind(ytrain, ytest)
        print("Getting Activity data")
        return(activities)
}



get_x <- function() {
        # read the x data, rename the labels from the feature file
        # removes the unneeded columns and return dataframe
        featuresfile <- "dataset/UCI HAR Dataset/features.txt"
        features <- read.table(featuresfile, sep = " ")
        head(features)
        names(features) <- c('id', "feature")
        features <- features$feature
        x_trainfile <- "dataset/UCI HAR Dataset/train/X_train.txt"
        x_testfile <- "dataset/UCI HAR Dataset/test/X_test.txt"
        xtrain <- read.table(x_trainfile)
        xtest <- read.table(x_testfile)
        names(xtrain) <- features
        names(xtest) <- features
        xtest <- xtest[, grep(c("[Mm]ean[^F]|std"), names(xtest))]
        xtrain <- xtrain[, grep(c("[Mm]ean[^F]|std"), names(xtrain))]
        x <- rbind(xtrain, xtest)
        print("Getting sensor data")
        return(x)
}



get_subjects <- function() {
        # opens the subject data files and returns a dataframe
        subject_trainfile <- "dataset/UCI HAR Dataset/train/subject_train.txt"
        subject_testfile <- "dataset/UCI HAR Dataset/test/subject_test.txt"
        subject_train <- read.table(subject_trainfile)
        subject_test <- read.table(subject_testfile)
        names(subject_test) <- c("subject")
        names(subject_train) <- c("subject")
        subjects <- rbind(subject_train, subject_test)
        subjects$subject <- as.factor(subjects$subject)
        print("Getting subjects")
        return(subjects)
}


join_data <- function(x=x, activities=activities, subjects=subjects) {
        # takes as input the x, y, and subjects dataframe
        # and returns a concatenated dataframe
        print("Joining data")
        maindata <- cbind(subjects, activities, x)
        return(maindata)
}


get_tidydata <- function(maindata) {
        # creates a tidy data set by grouping on activity and subject
        tidydata <- maindata %>%
                group_by(activity, subject) %>% 
                summarise_all(mean) %>%
                arrange(activity, subject)
        names(tidydata) <- gsub("[-(),]", "", names(tidydata))
        print("Generating tidy data")
        return(tidydata)
}

run_script <- function() {
        get_data()
        activities <- get_activities()
        x <- get_x()
        subjects <- get_subjects()
        maindata <- join_data(x, activities, subjects)
        tidydata <- get_tidydata(maindata)
        write.table(tidydata, file = "tidydata.txt", row.names = FALSE)
        print("Writing to tidydata.txt")
}

run_script()

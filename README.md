# gettingandcleaningdata

This is a project for the Getting and Cleaning Data course on Coursera.

The provided "run_analysis.R" script downloads the relevent sensor data and
cleans up the data to produce a space separated text file of the data in a tidy format.

The functions inside "run_analysis.R":
* get_data() downloads and extracts the data from the web into a local folder.
* get_subjects() reads the test and train data for the subjects and
returns a joined dataframe of the subject by observation
* get_activities() reads in the test and train y data, as well as the activity
labels, and returns a joined dataframe of the activity by obserrvation
* get_x() reads in the test and train x data, keeps the columns where mean or std
are mentioned, and returns a joined dataframe of sensor data observations.
* join_data() concatenates the subjects, activities, and x dataframes
* get_tidydata() takes the joined dataframe from join_data() and returns a tidy
dataframe where each each row is grouped by activity and subject and calculates
the mean accross all the other (sensor) columns. The columns names for the sensor
data was cleaned to remove non-alphanumeric characters.
* run_script() will run all the other functions. 
The tidy data frame is then exported to "tidydata.txt"

The cleaned data is in the "tidydata.txt" file, which is space separated. 

In the final data, each line has one observation for the mean and standard deviations among the
sensor data.

* Activity is one of 6 possible movements.
* Subject is and id value coresponding to a particular user.

The data is from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The dataset url is https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

More explaination in the CodeBook.md
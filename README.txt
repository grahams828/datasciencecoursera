README.TXT Coursera Getting andCleaning Data Project
About the Data:
The data is available at archive.ics.uci.edu/ml/machine-learning-databases/00240
It contains data collected from the accelerometers in smart phones of 30 subjects while they performed each of six activities

To use the script:
Download the file from the website listed above and unzip it.  Move the files features.txt, X_train.txt, X_test.txt, y_train.txt, y_test.txt, subject_txt,subject_train.txt into your working directory.
Move the run_analysis.R file into your working directory.
execute the command: source("run_analysis.R")
The script takes a few seconds to execute, when it is finished you will have a file called tidy.txt in your working directory.
What the script does:
The script combines the contents of the seven text files into one data set, selects out the columns that are the means and standard deviations of the various data collected (79 columns out of 561). Then a new data set is created which contains for each subject the mean of the trials on each activity.  There are six rows of data for each subject; one for each activity.  These are listed in order of subject identity which is a number from one to thirty.
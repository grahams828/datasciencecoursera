#Deal with Training Data First
#I am Assuming that the data needed is in the same directory as this script.

#Reading in the training data

SubjectIdTr <- read.table("subject_train.txt")
ActivityIdTr <- read.table("y_train.txt")
MeasurementsTr <- read.table("X_train.txt")

#reading in the measurement names
features <- read.table("features.txt")

#extract out the variable names in character format
varNames <- as.character(features$V2)

#Change the names in the Measurements dataframe
colnames(MeasurementsTr) <- varNames

#select out the columns we want involving the mean(), std()
cols <- grep("mean()|std()",names(MeasurementsTr))
MeasurementsTr <- MeasurementsTr[,cols]

#put this al together into a single dataframe
trainData <- data.frame(SubjectIdTr,ActivityIdTr,MeasurementsTr)

#Change the first two column names to something descriptive
colnames(trainData)[1:2] <- c("Subject","Activity")

#Now repeat all this with the test data
SubjectIdTst <- read.table("subject_test.txt")
ActivityIdTst <- read.table("y_test.txt")
MeasurementsTst <- read.table("X_test.txt")

#Change the names in the Measurements dataframe
colnames(MeasurementsTst) <- varNames

#select out the columns we want involving the mean(), std()
cols <- grep("mean()|std()",names(MeasurementsTst))
MeasurementsTst <- MeasurementsTst[,cols]

#put this al together into a single dataframe
testData <- data.frame(SubjectIdTst,ActivityIdTst,MeasurementsTst)

#change the first two names of this data frame to match the other one
colnames(testData)[1:2] <- c("Subject", "Activity")

#Ok, let's merge these together, actually we will use rbind, then we'll sort it
allData <- rbind(trainData,testData)

#now let's put things in some semblence of order
allData <- allData[order(allData$Subject,allData$Activity),]

#Now we will make hte tidy dataset required
#Setting up an empty data frame with the right column names

df <- data.frame(t(rep(NA,81)))
names(df)<-names(allData)
df <- df[-1,]

#loop through allData, selecting out the data we need processing and binding to df

for (i in 1:30) #loop over subjects
  for (j in 1:6) # loop over activities
  {
    newRow <- apply(subset(allData,Subject ==i & Activity == j),2,mean)
    df <- rbind(df,newRow)
  }
dataActivityTest <- read.table(file.path(path_rf,"test","Y_test.txt"),header=FALSE)
dataActivityTrain <- read.table(file.path(path_rf,"train","Y_train.txt"),header=FALSE)
dataSubjectTrain <- read.table(file.path(path_rf,"train","subject_train.txt"),header=FALSE)
dataSubjectTest <- read.table(file.path(path_rf,"test","subject_test.txt"),header=FALSE)
dataFeaturesTest <- read.table(file.path(path_rf,"test","X_test.txt"),header=FALSE)
dataFeaturesTrain <- read.table(file.path(path_rf,"train","X_train.txt"),header=FALSE)
#MERGING
dataSubject <- rbind(dataSubjectTrain, dataSubjectTest)
dataActivity <- rbind(dataActivityTrain, dataActivityTest)
dataFeatures <- rbind(dataFeaturesTrain, dataFeaturesTest)
names(dataSubject)<-c("subject")
names(dataActivity)<-c("activity")
dataFeaturesNames <- read.table(file.path(path_rf,"features.txt"),header=FALSE)
names(dataFeatures) <- dataFeaturesNames$V2
dataCombine <- cbind(dataSubject,dataActivity)
Data <- cbind(dataFeatures, dataCombine)
#Extraction of Mean and Standard Deviation, naming appropriately
subdataFeaturesNames <- dataFeaturesNames$V2[grep("mean\\(\\)|std\\(\\)",dataFeaturesNames$V2)]
selectedNames<-c(as.character(subdataFeaturesNames),"subject","activity")
Data <- subset(Data,select=selectedNames)
activityLabels <- read.table(file.path(path_rf,"activity_labels.txt"),header=FALSE)
names(Data)<-gsub("^t", "time", names(Data))
names(Data)<-gsub("^f", "frequency", names(Data))
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))
#Creating a second tidy data set
library(plyr);
Data2<-aggregate(. ~subject + activity, Data, mean)
Data2<-Data2[order(Data2$subject,Data2$activity),]
write.table(Data2, file = "tidydata.txt",row.name=FALSE)
library(knitr)
knit2html("codebook.Rmd")




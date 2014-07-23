run_analysis <- function(){
  
  ## Read the Training Set
  
  TrainingDataRaw1 <- read.table("./UCI HAR Dataset/train/X_train.txt", header=F)
  SubjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt", header=F)
  TrainingActivityNumber <- read.table("./UCI HAR Dataset/train/y_train.txt", header=F)
  
  
  ## Change the name of the variables of data frames SubjectTrain and TrainingACtivityNumber
  
  colnames(SubjectTrain)[1] <- "Subject"
  colnames(TrainingActivityNumber)[1] <- "Activity"
  
  ## Merge the TrainingDataRaw1,the subject of each training observation,
  ## and the activity of each training observation
  
  TrainingDataRaw2 <- cbind(SubjectTrain,TrainingActivityNumber)
  TrainingData <- cbind(TrainingDataRaw2,TrainingDataRaw1) 
  
  ## Read the Test Set
  
  TestDataRaw1 <- read.table("./UCI HAR Dataset/test/X_test.txt", header=F)
  SubjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt", header=F)
  TestActivityNumber <- read.table("./UCI HAR Dataset/test/y_test.txt", header=F)
  
  ## Change the name of the variables of data frames SubjectTest and TestActivityNumber
  
  colnames(SubjectTest)[1] <- "Subject"
  colnames(TestActivityNumber)[1] <- "Activity"
  
  ## Merge the TestDataRaw1, the subject of each test observation,
  ## and the activity of each test observation
  
  TestDataRaw2 <- cbind(SubjectTest,TestActivityNumber)
  TestData <- cbind(TestDataRaw2,TestDataRaw1)
  
  ## Merge the Training and the Test Sets to create one data frame called DataSet
  ## with 10299 obs. of 563 variables
  
  DataSet <- rbind(TrainingData, TestData)
  
  ## Extract only the measurements on the mean and standard deviation for each measurement
  ## DataSetSub is a data frame with 10299 obs. of 68 variables:
  ## All variables with the word "mean" (46) are included, except "meanFreq" (13): 33 in total
  ## All variables with "angle(....Mean)" are excluded: 7 in total
  ## All variables with the word "std" are included: 33 in total
  ## Subject and Activity are included: 2 in total
  
  DataSetSub <- subset(DataSet,select=c(Subject,Activity,V1,V2,V3,V4,V5,V6,V41,V42,V43,V44,V45,V46,V81,V82,V83,V84,V85,V86,V121,V122,V123,V124,V125,V126,V161,V162,V163,V164,V165,V166,V201,V202,V214,V215,V227,V228,V240,V241,V253,V254,V266,V267,V268,V269,V270,V271,V345,V346,V347,V348,V349,V350,V424,V425,V426,V427,V428,V429,V503,V504,V516,V517,V529,V530,V542,V543))
  
  ## Use descriptive activity names to name the activities in the data set
  
  DataSetSub$Activity <- gsub(1,"Walking",DataSetSub$Activity)
  DataSetSub$Activity <- gsub(2,"Walking-Upstairs",DataSetSub$Activity)
  DataSetSub$Activity <- gsub(3,"Walking-Downstairs",DataSetSub$Activity)
  DataSetSub$Activity <- gsub(4,"Sitting",DataSetSub$Activity)
  DataSetSub$Activity <- gsub(5,"Standing",DataSetSub$Activity)
  DataSetSub$Activity <- gsub(6,"Laying",DataSetSub$Activity)
  
  ## Label the data set with descriptive variable names
  
  colnames(DataSetSub)[3] <- "Time.BodyLinearAcceleration.AxisX.Mean"
  colnames(DataSetSub)[4] <- "Time.BodyLinearAcceleration.AxisY.Mean"
  colnames(DataSetSub)[5] <- "Time.BodyLinearAcceleration.AxisZ.Mean"
  colnames(DataSetSub)[6] <- "Time.BodyLinearAcceleration.AxisX.StandardDeviation"
  colnames(DataSetSub)[7] <- "Time.BodyLinearAcceleration.AxisY.StandardDeviation"
  colnames(DataSetSub)[8] <- "Time.BodyLinearAcceleration.AxisZ.StandardDeviation"
  colnames(DataSetSub)[9] <- "Time.GravityAcceleration.AxisX.Mean"
  colnames(DataSetSub)[10] <- "Time.GravityAcceleration.AxisY.Mean"
  colnames(DataSetSub)[11] <- "Time.GravityAcceleration.AxisZ.Mean"
  colnames(DataSetSub)[12] <- "Time.GravityAcceleration.AxisX.StandardDeviation"
  colnames(DataSetSub)[13] <- "Time.GravityAcceleration.AxisY.StandardDeviation"
  colnames(DataSetSub)[14] <- "Time.GravityAcceleration.AxisZ.StandardDeviation"
  colnames(DataSetSub)[15] <- "Time.BodyLinearAcceleration.JerkSignal.AxisX.Mean"
  colnames(DataSetSub)[16] <- "Time.BodyLinearAcceleration.JerkSignal.AxisY.Mean"
  colnames(DataSetSub)[17] <- "Time.BodyLinearAcceleration.JerkSignal.AxisZ.Mean"
  colnames(DataSetSub)[18] <- "Time.BodyLinearAcceleration.JerkSignal.AxisX.StandardDeviation"
  colnames(DataSetSub)[19] <- "Time.BodyLinearAcceleration.JerkSignal.AxisY.StandardDeviation"
  colnames(DataSetSub)[20] <- "Time.BodyLinearAcceleration.JerkSignal.AxisZ.StandardDeviation"
  colnames(DataSetSub)[21] <- "Time.BodyAngularVelocity.Gyroscope.AxisX.Mean"
  colnames(DataSetSub)[22] <- "Time.BodyAngularVelocity.Gyroscope.AxisY.Mean"
  colnames(DataSetSub)[23] <- "Time.BodyAngularVelocity.Gyroscope.AxisZ.Mean"
  colnames(DataSetSub)[24] <- "Time.BodyAngularVelocity.Gyroscope.AxisX.StandardDeviation"
  colnames(DataSetSub)[25] <- "Time.BodyAngularVelocity.Gyroscope.AxisY.StandardDeviation"
  colnames(DataSetSub)[26] <- "Time.BodyAngularVelocity.Gyroscope.AxisZ.StandardDeviation"
  colnames(DataSetSub)[27] <- "Time.BodyAngularVelocity.Gyroscope.JerkSignal.AxisX.Mean"
  colnames(DataSetSub)[28] <- "Time.BodyAngularVelocity.Gyroscope.JerkSignal.AxisY.Mean"
  colnames(DataSetSub)[29] <- "Time.BodyAngularVelocity.Gyroscope.JerkSignal.AxisZ.Mean"
  colnames(DataSetSub)[30] <- "Time.BodyAngularVelocity.Gyroscope.JerkSignal.AxisX.StandardDeviation"
  colnames(DataSetSub)[31] <- "Time.BodyAngularVelocity.Gyroscope.JerkSignal.AxisY.StandardDeviation"
  colnames(DataSetSub)[32] <- "Time.BodyAngularVelocity.Gyroscope.JerkSignal.AxisZ.StandardDeviation"
  colnames(DataSetSub)[33] <- "Time.BodyLinearAcceleration.EuclideanNorm.Mean"
  colnames(DataSetSub)[34] <- "Time.BodyLinearAcceleration.EuclideanNorm.StandardDeviation"
  colnames(DataSetSub)[35] <- "Time.GravityAcceleration.EuclideanNorm.Mean"
  colnames(DataSetSub)[36] <- "Time.GravityAcceleration.EuclideanNorm.StandardDeviation"
  colnames(DataSetSub)[37] <- "Time.BodyLinearAcceleration.JerkSignal.EuclideanNorm.Mean"
  colnames(DataSetSub)[38] <- "Time.BodyLinearAcceleration.JerkSignal.EuclideanNorm.StandardDeviation"
  colnames(DataSetSub)[39] <- "Time.BodyAngularVelocity.Gyroscope.EuclideanNorm.Mean"
  colnames(DataSetSub)[40] <- "Time.BodyAngularVelocity.Gyroscope.EuclideanNorm.StandardDeviation"
  colnames(DataSetSub)[41] <- "Time.BodyAngularVelocity.Gyroscope.JerkSignal.EuclideanNorm.Mean"
  colnames(DataSetSub)[42] <- "Time.BodyAngularVelocity.Gyroscope.JerkSignal.EuclideanNorm.StandardDeviation"
  colnames(DataSetSub)[43] <- "FastFourierTransform.BodyLinearAcceleration.AxisX.Mean"
  colnames(DataSetSub)[44] <- "FastFourierTransform.BodyLinearAcceleration.AxisY.Mean"
  colnames(DataSetSub)[45] <- "FastFourierTransform.BodyLinearAcceleration.AxisZ.Mean"
  colnames(DataSetSub)[46] <- "FastFourierTransform.BodyLinearAcceleration.AxisX.StandardDeviation"
  colnames(DataSetSub)[47] <- "FastFourierTransform.BodyLinearAcceleration.AxisY.StandardDeviation"
  colnames(DataSetSub)[48] <- "FastFourierTransform.BodyLinearAcceleration.AxisZ.StandardDeviation"
  colnames(DataSetSub)[49] <- "FastFourierTransform.BodyLinearAcceleration.JerkSignal.AxisX.Mean"
  colnames(DataSetSub)[50] <- "FastFourierTransform.BodyLinearAcceleration.JerkSignal.AxisY.Mean"
  colnames(DataSetSub)[51] <- "FastFourierTransform.BodyLinearAcceleration.JerkSignal.AxisZ.Mean"
  colnames(DataSetSub)[52] <- "FastFourierTransform.BodyLinearAcceleration.JerkSignal.AxisX.StandardDeviation"
  colnames(DataSetSub)[53] <- "FastFourierTransform.BodyLinearAcceleration.JerkSignal.AxisY.StandardDeviation"
  colnames(DataSetSub)[54] <- "FastFourierTransform.BodyLinearAcceleration.JerkSignal.AxisZ.StandardDeviation"
  colnames(DataSetSub)[55] <- "FastFourierTransform.BodyAngularVelocity.Gyroscope.AxisX.Mean"
  colnames(DataSetSub)[56] <- "FastFourierTransform.BodyAngularVelocity.Gyroscope.AxisY.Mean"
  colnames(DataSetSub)[57] <- "FastFourierTransform.BodyAngularVelocity.Gyroscope.AxisZ.Mean"
  colnames(DataSetSub)[58] <- "FastFourierTransform.BodyAngularVelocity.Gyroscope.AxisX.StandardDeviation"
  colnames(DataSetSub)[59] <- "FastFourierTransform.BodyAngularVelocity.Gyroscope.AxisY.StandardDeviation"
  colnames(DataSetSub)[60] <- "FastFourierTransform.BodyAngularVelocity.Gyroscope.AxisZ.StandardDeviation"
  colnames(DataSetSub)[61] <- "FastFourierTransform.BodyLinearAcceleration.EuclideanNorm.Mean"
  colnames(DataSetSub)[62] <- "FastFourierTransform.BodyLinearAcceleration.EuclideanNorm.StandardDeviation"
  colnames(DataSetSub)[63] <- "FastFourierTransform.BodyLinearAcceleration.JerkSignal.EuclideanNorm.Mean"
  colnames(DataSetSub)[64] <- "FastFourierTransform.BodyLinearAcceleration.JerkSignal.EuclideanNorm.StandardDeviation"
  colnames(DataSetSub)[65] <- "FastFourierTransform.BodyAngularVelocity.Gyroscope.EuclideanNorm.Mean"
  colnames(DataSetSub)[66] <- "FastFourierTransform.BodyAngularVelocity.Gyroscope.EuclideanNorm.StandardDeviation"
  colnames(DataSetSub)[67] <- "FastFourierTransform.BodyAngularVelocity.Gyroscope.JerkSignal.EuclideanNorm.Mean"
  colnames(DataSetSub)[68] <- "FastFourierTransform.BodyAngularVelocity.Gyroscope.JerkSignal.EuclideanNorm.StandardDeviation"
  
  ## Create a tidy data set with the average of each variable for each activity and each subject
  
  library("plyr", lib.loc="C:/Users/juan/Documents/R/win-library/3.1")
  tidydata <- ddply(DataSetSub,.(Subject,Activity),numcolwise(mean))
    
  ## Record the tidy data set to my working directory
  
  write.table(tidydata,file="TidyDataCourseProject.txt")
  
}

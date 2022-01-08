
## CMSC 197 
## Second Mini-Project

## Mark Andrew Geloryao
## BS in Statistics III


## Problem 1


#1
  install.packages(c("data.table", "reshape2"))

  library(data.table)
  library(reshape2)

  setwd("C:/Users/Acer/Desktop/UPV/21-22 FS/cmsc 197 -1/MP2/specdata1")


#2 
  aL <- read.table("activity_labels.txt")[,2]
  f <- read.table("features.txt")[,2]
  e_f <- grepl("mean|std", f)
  
  xTest <- read.table("test/X_test.txt")
  yTest <- read.table("test/y_test.txt")
  sTest <- read.table("test/subject_test.txt")
  
  xTrain <- read.table("train/X_train.txt")
  yTrain <- read.table("train/y_train.txt")
  sTrain <- read.table("train/subject_train.txt")

#3 
  names(xTest) = f
  names(xTrain) = f
  
  xTest <-xTest[,e_f]
  xTrain <- xTrain[,e_f]
  
  yTest[,2] = aL[yTest[,1]]
  names(yTest) = c("Activity_ID", "Activity_Label")
  
  yTrain[,2] = aL[yTrain[,1]]
  names(yTrain) = c("Activity_ID", "Activity_Label")
  
  names(sTest) = "Subject"
  names(sTrain) = "Subject"

#4
  testData <- cbind(as.data.table(sTest), yTest, xTest) 
  trainData <- cbind(as.data.table(sTrain), yTrain, xTrain) 
  
  mergedData <- rbind(testData, trainData)

#5
  idLabels <- c("Subject", "Activity_ID", "Activity_Label")
  dLabels =  setdiff(colnames(mergedData), idLabels)
  mData = melt(mergedData, id = idLabels, measure.vars = dLabels) 


#6 
  tData = dcast(mData, Subject + Activity_Label ~ variable, mean) 


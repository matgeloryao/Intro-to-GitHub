
#1
First, we are going to download the needed packages for this problem.
As well as loading these packages.

Also, we are going to set the working directory to our created folder, "specdata1".


#2
In this point, we are going to store various data to their respective variables.
	aL for Activity Labels
	f for Features
	e_f for the logical expression if the variables have either mean or std in its name

The test set is also stored to its corresponding variables, using read.table
	xTest for the X_test
	yTest for the y_test
	sTest for the subject_test

This is also the same with the train set
	xTrain for the X_train
	yTrainfor the y_train
	sTrain for the subject_train

#3
We are now going to name the columns of xTest and xTrain to those found in f.
Likewise, values containing only the words: "mean" or "std" are only included to both xTest and xTrain.

In terms of both yTest and yTrain, the columns are named as "Activity_ID" and "Activity_Label".

Both the columns of sTest and sTrain are named "Subject".

#4
We are now starting to bind our data, first we are going to column bind the three data sets of both the test set and train set.
This will result to testData and trainData.

After that, both these data sets are going to be merged using rbind, and named mergedData.

#5
Now, we are going to create labels, both in the ID and data. 
Then, the data will be melted and named mData, where the data set would be in a long format.

#6
Using dcast, the data would be transformed into a wide format with respect to its mean.
It will result to a data set that is much more presentable.


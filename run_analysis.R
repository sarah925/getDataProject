## Merges the training and the test sets to create one data set.
## Extracts only the measurements on the mean and standard deviation for each measurement. 
## Uses descriptive activity names to name the activities in the data set
## Appropriately labels the data set with descriptive activity names. 
## Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


dir <- "C:/Users/Sarah/COURSERA/GetCleanData/Project/UCIHARDataset/"
setwd(dir)

# read in all the data
xtest <- read.table("test/X_test.txt")
ytest <- read.table("test/y_test.txt")
stest <- read.table("test/subject_test.txt")
xtrain <- read.table("train/X_train.txt")
ytrain <- read.table("train/y_train.txt")
strain <- read.table("train/subject_train.txt")

# combine the test and train data and create labels from features.txt
xcomb <- rbind(xtest,xtrain)
ycomb <- rbind(ytest,ytrain)
scomb <- rbind(stest,strain)
xsy <- cbind(xcomb, scomb, ycomb)
feat <- read.table("features.txt")
names(xsy) <- feat[,2]
names(xsy)[562] <-"subject"
names(xsy)[563] <-"activity"

#translate activity numbers into text
for (ii in 1:length(xsy$activity)){
  # 1 WALKING, 
  if(xsy$activity[ii] == 1){
    xsy$activity[ii]<-"WALKING"
  }
  # 2 WALKING_UPSTAIRS
  else if(xsy$activity[ii] == 2){
    xsy$activity[ii]<-"WALKING_UPSTAIRS"
  }
  # 3 WALKING_DOWNSTAIRS
  else if(xsy$activity[ii] == 3){
    xsy$activity[ii]<-"WALKING_DOWNSTAIRS"
  }
  # 4 SITTING
  else if(xsy$activity[ii] == 4){
    xsy$activity[ii]<-"SITTING"
  }
  # 5 STANDING
  else if(xsy$activity[ii] == 5){
    xsy$activity[ii]<-"STANDING"
  }
  # 6 LAYING
  else if(xsy$activity[ii] == 6){
    xsy$activity[ii]<-"LAYING"
  } 
}

# Extracts cols with mean and std
mvar <- grep("mean\\(", names(xsy))
svar <- grep("std\\(", names(xsy))
var <- c(mvar, svar, 562, 563)
ext <- xsy[,var]

# create new dataframe with avg of each var for each subject
df <- data.frame(matrix(NA, nrow = 180, ncol = 68))
index <-1
for (sub in unique(ext$subject)){
  # get all rows for the subject
  tmp <- ext[ext$subject==sub,] 
  for (act in unique(ext$activity)){
    atmp <- tmp[tmp$activity==act,]
    # find the mean of each col, the 2 arg => column
    means <- apply(atmp[,1:66], 2, mean)
    result <- c(sub, act, means)
    df[index,] <- result
    index <- index+1
  }
}

df <- df[order(as.numeric(df$X1), df$X2),]

newnames <- gsub(pattern="\\(|\\)", names(xsy[,var]), replacement="") #removes the ()
newnames <- c("subject", "activity", newnames[1:66])
names(df) <- newnames

write.table(df, file = "tidydata.txt", sep = "\t", row.names = FALSE)

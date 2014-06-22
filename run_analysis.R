# Download and unzip

library(reshape2)

if(!file.exists("Data")) {
      dir.create("Data")
}

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
              destfile="Data/cp_data.zip", method="curl")
unzip("Data/cp_data.zip", exdir="Data")

# Q1

df_train <- cbind(rep("train", nrow(df_train)),  # set
                  read.table(file="Data/UCI HAR Dataset/train/y_train.txt", sep=""),  # activity
                  read.table(file="Data/UCI HAR Dataset/train/subject_train.txt", sep=""),  # subject
                  read.table(file="Data/UCI HAR Dataset/train/X_train.txt", sep=""))  # data

df_test <- cbind(rep("test", nrow(df_test)),
                 read.table(file="Data/UCI HAR Dataset/test/y_test.txt", sep=""),
                 read.table(file="Data/UCI HAR Dataset/test/subject_test.txt", sep=""),
                 read.table(file="Data/UCI HAR Dataset/test/X_test.txt", sep=""))

colnames(df_train) <- colnames(df_test) <- c("set", "activity", "subject_id", as.character(read.table(file="Data/UCI HAR Dataset/features.txt", sep="")$V2))
df_wearable <- rbind(df_train, df_test)

# Q2

colMeans(df_wearable[, -c(1,2,3)])  # mean
apply(df_wearable[, -c(1,2,3)], 2, sd)  # sd

# Q3

df_wearable$activity[df_wearable$activity==1] <- "Walking"
df_wearable$activity[df_wearable$activity==2] <- "Walking_upstairs"
df_wearable$activity[df_wearable$activity==3] <- "Walking_downstairs"
df_wearable$activity[df_wearable$activity==4] <- "Sitting"
df_wearable$activity[df_wearable$activity==5] <- "Standing"
df_wearable$activity[df_wearable$activity==6] <- "Laying"

# Q4 (obsolete, already performed in Q1)

colnames(df_wearable) <- c("set", "activity", "subject_id", as.character(read.table(file="Data/UCI HAR Dataset/features.txt", sep="")$V2))

# Q5

wearMelt <- melt(df_wearable,id=c("set", "activity", "subject_id"))  # http://www.r-bloggers.com/melt/
wearData <- dcast(wearMelt, set + activity + subject_id ~ variable, mean)

# Write data

write.csv(wearData, file="tidy_data_savi.csv")
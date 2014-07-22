# Get and Clean Data
# Class Project
# Lars Rahm
# July 2014

library(plyr)
library(reshape2)
library(stringr)

# Import both the training and test data into dataframes.
subject.train = read.table("./train/subject_train.txt")
activity.train = read.table("./train/y_train.txt")
data.train = read.table("./train/x_train.txt")
df.train <- data.frame(subject.train, activity.train, data.train)

subject.test = read.table("./test/subject_test.txt")
activity.test = read.table("./test/y_test.txt")
data.test = read.table("./test/x_test.txt")
df.test <- data.frame(subject.test, activity.test, data.test)

# Combine the training and test data into one data.frame
df.all <- rbind(df.train, df.test)

# Import the variable names and assign them to df.all
features = read.table("features.txt")
features.vector <- as.character(features$V2)
n1 <- c("subject", "activity")
n2 <- features.vector
names.list <- c(n1,n2)
names(df.all) <- names.list

# Subset the df.all to only include those features that calculate the mean() or std()
feature.subset <- features[grep("-mean\\(\\)-|-std\\(\\)-", features.vector),]["V2"]
fs <- c(n1, as.character(feature.subset$V2))
df.subset <- df.all[fs]

# Assign descriptive activity names. The values come from the file activity_labels.txt
activities <- c("1"="WALKING", "2"="WALKING_UPSTAIRS", "3"="WALKING_DOWNSTAIRS", "4"="SITTING", "5"="STANDING", "6"="LAYING")
activities[df.subset$activity]
df.subset$activity <- factor(activities[df.subset$activity], levels=activities)

# Create factors from the subjects for grouping 
df.subset$subject <- as.factor(df.subset$subject)

# split - apply - combine the dataframe to calculate the mean of the variables 
# grouped by activity, subject and feature
df.melt = melt(df.subset, id.vars = .(activity, subject), variable.name = 'variable', value.name = 'value')
df.melt.summary <- ddply(df.melt, .(activity, subject, variable), summarize, mean1 = mean(value))

# Rename the variables by placing each variable in the mean() function, ex. mean(fBodyAcc-mean()-X)
# Named this way to show how each variable was processed
df.melt.summary$variable <- paste0('mean(', df.melt.summary$variable, ')')

# Expand back out to wide form with all the variables as column headings.
df.tidy <- dcast(df.melt.summary, activity + subject ~ variable, value.var='mean1')

# Write tidy data to the summary.txt file
write.table(df.tidy, file="summary.txt", quote=FALSE, row.names=FALSE)

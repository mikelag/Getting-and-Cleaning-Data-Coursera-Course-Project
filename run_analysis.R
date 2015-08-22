library(plyr)


### 1st. Merge the training and the test sets to create one data set.

x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

# Merge test and train data to 'x', 'y' and 'subject' datasets
x.data <- rbind(x_train, x_test)
y.data <- rbind(y_train, y_test)
subject.data <- rbind(subject_train, subject_test)


### 2nd. Extract only the measurements on the mean and standard deviation for each measurement.

features <- read.table("features.txt")

# Extract colums of the mean and standart deviation
mean.std.features <- grep("mean\\(\\)|std\\(\\)", features[,2])

# Subset the ones colums
x.data <- x.data[, mean.std.features]

# Naming colums  
names(x.data) <- features[mean.std.features, 2]


### 3rd. Uses descriptive activity names to name the activities in the data set

activity <- read.table("activity_labels.txt")

# Naming colum 
names(y.data) <- "Activity"

# Assign name the activities in the data set
y.data[, 1] <- activity[y.data[, 1], 2]


### 4th. Appropriately labels the data set with descriptive variable names

# Naming column
names(subject.data) <- "Subject"

# Correcting column names by removing parentheses
names(x.data) <- gsub("\\(\\)", "", names(x.data))

# Make clear names
names(x.data) <- gsub("^t", "TimeDomain", names(x.data))
names(x.data) <- gsub("^f", "FrequencyDomain", names(x.data))

# Binding all data to one data set
all.data <- cbind(x.data, y.data, subject.data)


### 5th. Create a second, independent tidy data set 
### with the average of each variable for each activity and each subject.

avg.data <- ddply(all.data, c("Subject", "Activity"), numcolwise(mean))
write.table(avg.data, "averages_data.txt", row.names = F)


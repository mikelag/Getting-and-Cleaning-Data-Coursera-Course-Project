## Transformations

1. Download all files and merge similar data.

2. Substract only those colums, which contain the mean and standart deviation measures. Then they are given names, taken from 'features.txt'

3. Using 'activity_labels.txt' which contain labels from with their activity name, assign name the activities to the data set

4. Make more clear names in the data set by removing parentheses and clarifying some values. Then merge all data into one big data set

5. Create a second, independent tidy data set with the average of each variable for each activity and each subject using 'ddply'. Then writing it to the 'averages_data.txt'

## Variables

* 'x_test', 'y_test', 'subject_test', 'x_train', 'y_train' and 'subject_train' are downloaded from original data files.
* 'x.data', 'y.data', 'subject.data' contain merged previous data sets
* 'features' contain names for the 'x.data' data set
* 'mean.std.features' contain numbers of proper colums, including only the measurements on the mean and standard deviation for each measurement.
* 'activity' contains six species of activities, which are applied to the column to name the activities in the 'y.data' data set
* 'all.data' bind 'x.data', 'y.data' and 'subject.data' to one big data set
* 'avg.data' contain average of each variable from 'all.data' for each activity and each subject


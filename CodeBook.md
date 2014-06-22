# CodeBook

## Origin of data
The dataset originates from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. For the purpose of this course project, the data was downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

## Description of data
Included with the original data is a codebook describing the data and variables. This codebook focuses on the transformations that were performed on the original dataset. The data describes measures of 30 individuals that have performed 6 activities while wearing a smartphone.

### Transformations
Subject and activity identifiers were added to both the train and test dataset. Both datasets were merged (seperate rows for each set) and an identifier for the set (train/test) was added. The data was subsequently molten (transformed into long format) and then casted to show the means of each variable, for the two datasets, all levels of activity, and all subjects.

### Data and variables
The first column identifies the dataset (train or test), the second column identifies the activity (Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, Laying), the third column identifies the subject.

All subsequent columns show the means for each of the variables in the original dataset, with respect to the set, activity, and subject.
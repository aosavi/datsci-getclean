# Readme
This is a project for the Coursera course Data Science - Getting and Cleaning Data. A raw dataset is download and transformed into a smaller tidy dataset that is ready for subsequent analyses.

Two files are included in this repo:

- run_analysis.R
- CodeBook.md

### File: run_analysis.R
The file run_analysis.R can be opened in R. By running the code a dataset (see CodeBook.md) is downloaded, unzipped, and tidied. The output is a tidy dataset in .csv format.

The train and test datasets are merged. Appropriate columnnames are assigned, and labels are added to the activity variable. The mean and sd for each of the variables is calculated. Finally the mean of each variable is calculated, for each dataset, activity, and subject, and written to a small tidy dataset. The numbers of the different parts of the assigment are added as comments to the script.

### File: CodeBook.md
The file CodeBook.md gives a short description of the variables, data, and any transformations performed in the process of tidying the data.
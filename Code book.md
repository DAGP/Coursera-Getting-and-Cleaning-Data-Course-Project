
#The script Analysis.R performs the 5 steps described in the project's description.

The similar data was merged using the rbind() function. 

Then, only those columns with the mean and standard deviation measures were taken from the whole dataset. 

After extracting these columns, they are given the correct names, taken from features.txt.

On the whole dataset, those columns with vague column names are corrected.

Finally, generate a new dataset with all the average measures for each subject. 

The output file is called Tydy.txt.

x_train, y_train, x_test, y_test, subject_train and subject_test contain the data from the downloaded files.

x_data, y_data and subject_data merge the previous datasets to further analysis.

Features contains the correct names for the x_data dataset, which are applied to the column names stored in mean_and_std_features, a numeric vector used to extract the desired data.

A similar approach is taken with activity names through the activities variable.

all_data merges x_data, y_data and subject_data in a big dataset.

Tydy contains the relevant averages stored in a .txt file.

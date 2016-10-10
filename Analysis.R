

Step 1
# Download the file and put the file in the "data" folder

if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip",method="curl")

# Unzipped files are in the folder "UCI HAR Dataset".
unzip(zipfile="./data/Dataset.zip",exdir="./data")
path_rf <- file.path("./data" , "UCI HAR Dataset")
files<-list.files(path_rf, recursive=TRUE)
files

# Merge the training and test sets to create one data set
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

# Create "x" and "y" data set
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)

# Create "subject" data set
subject_data <- rbind(subject_train, subject_test)


Step 2


features <- read.table("features.txt")

# Get columns with mean() or std() in their names and subset the desired columns
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])
x_data <- x_data[, mean_and_std_features]

# Correct the names column
names(x_data) <- features[mean_and_std_features, 2]


Step 3


# Update values with correct activity names
activities <- read.table("activity_labels.txt")
y_data[, 1] <- activities[y_data[, 1], 2]

# correct column name
names(y_data) <- "activity"


Step 4

# Label the data set with descriptive variable names
names(subject_data) <- "subject"

# Bind all the data in a single data set
all_data <- cbind(x_data, y_data, subject_data)


Step 5
# Create a second, independent tidy data set with the average of each variable
averages_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(averages_data, "averages_data.txt", row.name=FALSE)












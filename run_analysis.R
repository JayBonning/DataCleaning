
run_analysis <- function (output = 'Tidy\\results.txt')
{

  # Combine the data together to 
  subject <- combine_data('UCI HAR Dataset\\train\\subject_train.txt', 'UCI HAR Dataset\\test\\subject_test.txt')
  X <- combine_data('UCI HAR Dataset\\train\\X_train.txt', 'UCI HAR Dataset\\test\\X_test.txt')
  Y <- combine_data('UCI HAR Dataset\\train\\Y_train.txt', 'UCI HAR Dataset\\test\\Y_test.txt')
  
  #Get Label Information
  Activity_Labels <- read.table('UCI HAR Dataset\\activity_labels.txt')
  
  #Get Labels for Y
  Y <- merge(Y, Activity_Labels, 'V1')
  
  #Set correct column names
  colnames(subject)[1] <- "subject"
  
  #load the table to save
  subject$activity <- Y[,2]
  subject$mean <- rowMeans(subset(X, select = 1:561), na.rm = TRUE)
  subject$stddev <- rowSds(as.matrix(X))
  
  #Calculate the mean for both the mean and the standard deviation
  aggregateMean <- aggregate(subject$mean, list(sub = subject$subject, activity = subject$activity), FUN=mean)
  aggregateSD <- aggregate(subject$stddev, list(sub = subject$subject, activity = subject$activity), FUN=mean)
  
  #combine into one output.
  analysis <- merge(aggregateMean, aggregateSD, c('sub', 'activity'))
  
  #Set correct column names
  colnames(analysis)[3] <- "mean"
  colnames(analysis)[4] <- "stddev"
  
  #Order the results
  analysis <- analysis[with(analysis, order(sub, activity)), ]
  
  write.table(analysis,  file = output,row.names = FALSE, col.names = TRUE)
  return(analysis)
}

combine_data <- function(file1, file2)
{
    fileone <- read.table(file1)
    filetwo <- read.table(file2)
    
    output <- rbind(fileone,filetwo)
}


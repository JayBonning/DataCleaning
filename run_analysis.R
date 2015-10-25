
run_analysis <- function (output = 'Tidy\\results.txt')
{
  #Create a new directory for the results if one does not already exist
  #if(!dir.exists('Tidy'))
  #  dir.create('Tidy')
  
  #combine_files('UCI HAR Dataset\\train\\subject_train.txt', 'UCI HAR Dataset\\test\\subject_test.txt', 'Tidy\\subject.txt')
  #combine_files('UCI HAR Dataset\\train\\X_train.txt', 'UCI HAR Dataset\\test\\X_test.txt', 'Tidy\\X.txt')
  #combine_files('UCI HAR Dataset\\train\\Y_train.txt', 'UCI HAR Dataset\\test\\Y_test.txt', 'Tidy\\Y.txt')
  
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
  
  write.table(subject,  file = output,row.names = FALSE, col.names = TRUE)
}

combine_files <- function(file1, file2, outputfile)
{
  if(!file.exists(outputfile))
  {
  
    fileone <- read.table(file1)
    filetwo <- read.table(file2)
    
    output <- rbind(fileone,filetwo)
    write.csv(output, outputfile)
  } 
}

combine_data <- function(file1, file2)
{
    fileone <- read.table(file1)
    filetwo <- read.table(file2)
    
    rbind(fileone,filetwo)
}


complete <- function(directory, id = 1:332) {
      files_list <- list.files(directory, full.names=TRUE) # creates a list of all files in the directory
      iddf <- data.frame() #creates an empty data frame to store all data
      datafinal <- data.frame()
      for (i in id) { # use ID to loop in the specified files
            tempdf <- read.csv(files_list[i]) # read the files and store the data in a data frame
            com <- complete.cases(tempdf) # all the complete cases
            nobsum <- sum(com) #count complete cases (same: nobsum <- nrow(com))
            iddf <- unique(tempdf$ID) # with com, don't show the ID of the files with 0 complete cases
            datafinal <- rbind(datafinal, c(iddf,nobsum)) #rbind the id with the nobs related
      }
      colnames(datafinal) <- c("id", "nobs") # name the columns of the df
      return(datafinal) #return the result
}
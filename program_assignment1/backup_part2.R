complete <- function(directory, id = 1:332) {
      files_list <- list.files(directory, full.names=TRUE) # creates a list of all files in the directory
      iddf <- data.frame() #creates an empty data frame to store all data
      datafinal <- data.frame()
      for (i in 1:length(files_list)) {
            tempdf <- read.csv(files_list[i])
            com <- tempdf[complete.cases(tempdf),] # all the complete cases
            nobsum <- sum(complete.cases(com)) #count complete cases (same: nobsum <- nrow(com))
            iddf <- unique(tempdf$ID) # with com, don't show the ID of the files with 0 complete cases
            datafinal <- cbind(iddf,nobsum)
            
      }
      colnames(datafinal) <- c("id", "nobs")
      datafinal
}



datasubset <- datamon[which(datamon$ID %in% id),]





complete <- function(directory, id = 1:332) {
      files_list <- list.files(directory, full.names=TRUE) # creates a list of all files in the directory
      iddf <- data.frame() #creates an empty data frame to store all data
      datafinal <- data.frame()
      for (i in 1:length(id)) {
            tempdf <- read.csv(files_list[i])
            com <- tempdf[complete.cases(tempdf),] # all the complete cases
            nobsum <- as.data.frame(sum(complete.cases(com))) #count complete cases (same: nobsum <- nrow(com))
            iddf <- as.data.frame(unique(tempdf$ID)) # with com, don't show the ID of the files with 0 complete cases
            datafinal <- cbind(iddf,nobsum)
            datafinal <- as.data.frame(datafinal)
            
      }
      colnames(datafinal) <- c("id", "nobs")
      datafinal
      
}
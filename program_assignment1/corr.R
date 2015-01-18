#Get the files with complete cases above the threshold and calc the correlation between nitrate and sulfate
corr <- function(directory, threshold = 0) {  #choose the directory and threshold
      files_list <- list.files(directory, full.names=TRUE) # creates a list of all files in the directory
      tempdf <- data.frame()
      thresna <- data.frame()
      thresfinal <- data.frame()
      cor.results = vector("numeric") # The final results need to be a vector
      source("complete.R") # Load complete.R, function to count the complete cases in the files
      df_complete <- complete(directory,id = 1:length(files_list)) # get all the ids and count the nobs
      thres <- df_complete[which(df_complete$nobs > threshold),] #Get to thres only the files with complete
      ## cases above the threshold. Need to be before the loop, to use for [i] and don't loop for all files.
      for (i in thres$id) { # use the thres$id to don't loop in all files and create NAs.
            tempdf <- read.csv(files_list[i]) # Read only the .csv with complete cases above the threshold
            thresfinal <- na.omit(tempdf) # Clean the NAs from the files above the threshold
            cor.results <- c(cor.results,cor(thresfinal$sulfate,thresfinal$nitrate)) # Calc the correlation
            ## between the sulfate and nitrate in the files above the threshold and put the result in vector
            }
      return(cor.results) # return the results of the correlation
}


# The first attempt, correct but no optimized
#corr <- function(directory, threshold = 0) {
#      files_list <- list.files(directory, full.names=TRUE) # creates a list of all files in the directory
#      datacorr <- data.frame()
#      tempdf <- data.frame()
#      thresfinal <- data.frame()
#      cor.results = vector("numeric")
#      source("complete.R")
#      df_complete <- complete(directory,id = 1:length(files_list)) # all the ids and your nobs
#      thres <- df_complete[which(df_complete$nobs > threshold),] #all the ids with nobs above threshold
#      for (i in thres$id) {  #nrow(df_complete))
#            tempdf <- read.csv(files_list[i])
#            tempdf <- na.omit(tempdf)
#            idthres <- thres$id # only the ids of the files with complete cases above the threshold
#            thresna <- tempdf[which(tempdf$ID %in% idthres),]
#            thresfinal <- na.omit(thresna)
#            cor.results <- c(cor.results,cor(thresfinal$sulfate,thresfinal$nitrate))
#            cor.results <- na.omit(cor.results)
#            cor.results[is.na(cor.results)] <- 0
#      }
#      cor.results <- na.omit(cor.results)
#      return(cor.results)
#}

# Assignment 1: The mean of the pollutants across all monitors

# there are 3 argumments necessary
pollutantmean <- function(directory, pollutant, id = 1:332) {
      files_list <- list.files(directory, full.names=TRUE) # creates a list of all files in the directory
      datamon <- data.frame() #creates an empty data frame to store all data
      for (i in 1:length(files_list)) { #optimize changing file_list length to id length
            # loops through the files, rbind all
            datamon <- rbind(datamon, read.csv(files_list[i]))
      }
      datasubset <- datamon[which(datamon$ID %in% id),]  #subsets the rows that match the 'id' argumment
      mean(datasubset[, pollutant], na.rm=TRUE)      #identifies the median weight 
      #while stripping out the NAs
      
}
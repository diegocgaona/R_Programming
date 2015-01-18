andy <- read.csv("Andy.csv")
head(andy)
length(andy$Day)
dim(andy)
str(andy)
summary(andy)
andy[1,"Weight"]
andy[30,"Weight"]
andy[which(andy$Day == 30), "Weight"]
subset(andy$Weight, andy$Day==30)
andy_start <- andy[1,"Weight"]
andy_end <- andy[30,"Weight"]
andy_loss <- andy_start - andy_end
files <- list.files()
# If the files are in a subdirectory, use the
# argument full.names=TRUE
files_full <- list.files("data", full.names = TRUE)

# Bellow is how to subset files
files[1]
files[2]
files[3:5]

head(read.csv(files[3])

#coerse the andy and david data
andy_david <- rbind(andy, read.csv(files[2]))

# How to rbind all files to 1 data frame
# First, create a empty data frame
alldata <- data.frame()
# Then make a loop to rbind all the files
for (i in 1:5) {
      alldata <- rbind(alldata, read.csv(files[i]))
                  }
str(alldata)

# Median without the NAs. Or you can do a subset
# using complete.cases() or is.na()
median(dat$Weight, na.rm=TRUE)

# Subset only the data from day 30
alldata_day30 <- alldata[which(alldata[,"Day"] == 30),]

# The function to show de weight median by day, with subdirectory
weightmedian <- function(directory, day)  {
      files_list <- list.files(directory, full.names=TRUE)   #creates a list of files
      dat <- data.frame()                             #creates an empty data frame
      for (i in 1:5) {                                
            #loops through the files, rbinding them together 
            dat <- rbind(dat, read.csv(files_list[i]))
      }
      dat_subset <- dat[which(dat[, "Day"] == day),]  #subsets the rows that match the 'day' argument
      median(dat_subset[, "Weight"], na.rm=TRUE)      #identifies the median weight 
      #while stripping out the NAs
}

# The same function without subdirectory (the directoy only
# can have the data files, or it cause a error)
weightmedian <- function(day)  {
      files_list <- list.files()   #creates a list of files
      dat <- data.frame()                             #creates an empty data frame
      for (i in 1:5) {                                
            #loops through the files, rbinding them together 
            dat <- rbind(dat, read.csv(files_list[i]))
      }
      dat_subset <- dat[which(dat[, "Day"] == day),]  #subsets the rows that match the 'day' argument
      median(dat_subset[, "Weight"], na.rm=TRUE)      #identifies the median weight 
      #while stripping out the NAs
}

# another aproach (more fast and efficient)
# Create a vector list of the size of the data (use summary(data) to know the size)
tmp <- vector(mode = "list", length = length(files))

# create 5 elemments (lists) in tmp
for (i in seq_along(files)) {
      tmp[[i]] <- read.csv(files[[i]])
}
str(tmp)

# now you can read each of the files:
str(tmp[[1]])

# Create a unique data frame with all data
output <- do.call(rbind, tmp)
str(output)





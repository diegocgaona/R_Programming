add2 <- function(x, y) {
      x + y
}

above10 <- function(x) {
      use <- x >10
      x[use]
}

# Show a subset of the numbers above n
# with default number 10
above <- function(x,n = 10) {
      use <- x > n
      x[use]
}

# return the means of each column in a DF or
# matrix - formals() show the arguments of a function
columnmean <- function(y, removeNA = TRUE) {
      nc <- ncol(y)
      means <- numeric(nc)
      for(i in 1:nc) {
            means[i] <- mean(y[, i], na.rm = removeNA)
      }
      means 
}
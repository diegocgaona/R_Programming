## Return the mean of a vector using a cached value if
## possible, otherwise calculate the mean.

cachemean <- function(x, ...) {
      ## cachemean requires one parameter that must be a makeVector
      ## object.  Option parameters after that are passed to the
      ## mean() function.  Two local variables m and data are used
      ## in cachemean.
      
      m <- x$getmean()   ## Use the getmean() function in the makeVector
      ## object passed in as a parameter.  Store the
      ## cached mean value in the *local* variable m.
      
      if(!is.null(m)) {  ## If m is not NULL then there is a cached mean
            
            message("getting cached data")
            return(m)      ## return cached mean - we're done!
      }
      
      ## If we get to here then there is no cached mean.
      ## Using the get() function in the makeVector object, assign
      ## the vector of data to local variable data.
      
      data <- x$get()
      m <- mean(data, ...)  ## calculate the mean of data passing in any 
      ## additional parameters received.
      
      x$setmean(m)          ## cache the newly caclulated mean in makeVector
      
      m                     ## return newly calculated mean
}
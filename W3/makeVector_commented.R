## Create a makeVector object. Initialize values and define functions
## for this object.

makeVector <- function(x = numeric()) {
      m <- NULL
      
      ## Two variables are created within the function:
      ##  x is initialized by an optional parameter. Otherwise it is set
      ##    (by default) to an empty numeric vector.  In this case it
      ##    would need setting by the set() function before the mean  
      ##    could be calculated.
      ##  m is initialized to NULL.  It will eventually hold the cached
      ##    mean, but initially the NULL is used as indicator that there is
      ##    no stored mean.
      
      ## Four nested functions are defined.  These are getter/setter
      ## functions in OO termonology.  They are the only way you should
      ## access x and m inside a makeVector object.
      
      set <- function(y) {  ## Set the vector x to the value passed in.
            
            x <<- y           ## Use <<- to assign x in higher environment!!
            
            m <<- NULL        ## since we now have a new x vector we need
            ## to reset m to NULL since the value (mean)
            ## needs to be recalulated.
      }
      
      get <- function() x   ## return the value of x stored in the
      ## makeVector object
      
      setmean <- function(mean) m <<- mean
      ## set the value of m.  (Note this does not
      ## calculate mean, only store a parameter called
      ## 'mean'.)
      
      getmean <- function() m
      ## return the value of m stored in the
      ## makeVector object
      
      list(set = set,       ## list creates a generic list of nested functions
           get = get,       ## defined above which is returned by makeVector
           setmean = setmean,
           getmean = getmean)
      ## list() takes a series of 'tag=value' pairs.
      ## In this case a list of functions are tagged
      ## with the same name as the function itself.
      ## Easy to read and use (elegant?) when the syntax
      ## is understood.
      
}
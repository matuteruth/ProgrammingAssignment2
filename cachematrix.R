makeCacheVector <- function(x = numeric()) {      # input x will be a vector

m <- NULL    #  m will be our 'mean' and it's reset to NULL every 
#    time makeVector is called

#  note these next three functions are defined but not run when makeVector is called.
#   instead, they will be used by cachemean() to get values for x or for
#   m (mean) and for setting the mean.  These are usually called object 'methods'

get <- function() {
  x 
}   # this function returns the value of the original vector

setmean <- function(mean)  {
  m <<- mean
}
# this is called by cachemean() during the first cachemean()
#  access and it will store the value using superassignment

getmean <- function() {
  m 
  } # this will return the cached value to cachemean() on
#  subsequent accesses



## Write a short comment describing this function

cacheSolve <- function(x, ...) {   # the input x is an object created by makeVector
  m <- x$getsolve()               # accesses the object 'x' and gets the value of the mean
  if(!is.null(m)) {              # if mean was already cached (not NULL) ...
    
    message("getting cached data")  
    return(m)                       # ... and return the mean ... "retu
  }
  data <- x$get()       
  m <- solve(data, ...)   # if m was NULL then we have to calculate the mean
  x$setsolve(m)           # store the calculated solve value in x 
  m
}

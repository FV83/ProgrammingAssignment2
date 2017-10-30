## Below is a pair of functions that cache the inverse of a matrix

## The first function return a list of 4 functions in order to: 
## set a matrix
## get this matrix
## set the inverted matrix
## get the inverted matrix

makeCacheMatrix <- function(x = matrix()) {
   i <- NULL
   set <- function(y) {
      x <<- y
      i <<- NULL
   }
   get <- function() x
   setinv <- function(inv) i <<- inv
   getinv <- function() i
   list(set = set, get = get,
        setinv = setinv,
        getinv = getinv)
}


## The second function generates the inverted matrix. The function uses the cached matrix if it already exists. Otherwise, the inverted matrix is calculated.

cacheSolve <- function(x, ...) {
   i <- x$getinv()
   if(!is.null(i)) {
      message("getting cached data")
      return(i)
   }
   myMatrix <- x$get()
   i <- solve(myMatrix)
   x$setinv(i)
   i
}

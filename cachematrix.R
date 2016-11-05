## This R file demonstrate lexical scopingin R and 
## caching of values that can be computationally expensive.

## This function returns a list containg four functions - 
## set - sets values of a matrix, get - outputs the values of a matrix
## setinv - sets the values of an inverse of a matrix, 
## getinv - outputs the an inverse of a matrix

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL 
  set <-function(y) {
    x <<- y
    inv <<-NULL
  }
  get <- function() x
  setinv <- function(inverse) inv <<- inverse   
  getinv <- function() inv
  list(set = set, get = get, setinv = setinv, getinv = getinv)
}

## This functions recieves a  makeCacheMatrix object
## calculates inverse of a matrix and caches it in a makeCacheMatrix object
## If inverse matrix allready exists in the makeCacheMatrix object, 
## the inverse matrix is returned ,followed by a message.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv <- x$getinv()
  if (!is.null(inv)){
    message("getting cached data")
    returm(inv)
  }
  data <- x$get()
  x$setinv(solve(data)) 
}

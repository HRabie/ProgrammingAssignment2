## caching the inverse of a matrix  

## Matrix inversion is a costly computation and there may be some benefit to 
## caching the inverse of a matrix rather than compute it repeatedly 
## in bellow lines, we Write two functions:
## (1)	makeCacheMatrix: This function creates a special "matrix" object 
## that can cache its inverse.
## (2)	cacheSolve: This function computes the inverse of the 
## special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed),
## then the cachesolve should retrieve the inverse from the cache.

##############################################################
## (1)	makeCacheMatrix: the function creates a special "matrix" object 
## that can cache its inverse. it will return a list of functions:
##              1. set the matrix
##              2. get the matrix
##              3. set the inverse
##              4. get the inverse
##         this list will be used as the input to (2) cacheSolve()

makeCacheMatrix <- function(x = matrix()) {

  InvMat <- NULL
  
  Set <- function(y) {
    ##define a function to set  vector(x), to a new one(y) , and resets the inverse, InvMat, to NULL
    x <<- y
    # useing `<<-` operator operator which can be used to assign a value to an 
    ##object in an environment that is different from the current environment. 
        InvMat <<- NULL 
  }
  
  Get <- function() x  ## Return the vector x
  
  SetInv <- function(solve) InvMat <<- solve ## set the inverse "solve" Return the inverse InvMat
  
  GetInv <- function() InvMat ## Return the inverse InvMat
  
  ##returns a 'special vector' which includes all of the functions just defined above
  list(Set = Set, Get = Get, SetInv = SetInv,  GetInv = GetInv) 
  }


 ## (2)	cacheSolve: the function computes the inverse of the special "matrix" 
## created by makeCacheMatrix.  If inverse calculated and matrix has not changed,
## then it will retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  
  ## Return the matrix which is the inverse of 'x'
  
  InvMat <- x$GetInv()
  if(!is.null(InvMat)) {
    ## if the inverse has already been calculated get it 
    ## from the cache and DO NOT recalcute it. 
          message("Getting The Cached Data")
    return(InvMat)
  }
  # if NOT, calculates the inverse 
    data <- x$Get()
  InvMat <- solve(data, ...)
  x$SetInv(InvMat)
<<<<<<< HEAD
  InvMat }
=======
  InvMat }
>>>>>>> origin/master

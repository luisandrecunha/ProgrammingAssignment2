## R Programming - Project Assignment 2
##
## Luís Cunha
## 
## Write a short comment describing this functionhy

makeCacheMatrix <- function(matrixEnvironment0 = matrix()) {
        inverseEnvironment0 <- NULL
        
        setMatrix <- function(matrixToSet) { ## It will load the matrix to other environment
                matrixEnvironment1 <<- matrixToSet
                inverseEnvironment1 <<- NULL
                
        }
        
        getMatrix <- function() matrixEnvironment1 ## It will get the matrix if it exists from the other environment
        
        setInverse <- function(solve) inverseEnvironment1 << solve
        
        getInverse <- function() inverserEnvironment1
        
        list (
                setMatrix = setMatrix,
                getMatrix = getMatrix,
                setInverse = setInverse,
                getInverse = getInverse
                )
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}

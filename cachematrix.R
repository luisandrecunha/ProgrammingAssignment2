## R Programming - Project Assignment 2
##
## Luís Cunha
## 


# This function is used to create a cached inverse matrix. The function have 4 
# functions that allows to:
# - add (setMatrix) the matrix to be inverted
# - get (getMatrix) the value of the matrix to be inverted (matrixEnvironment0) 
#       if exists
# - recalculate (setInverse) the inverse if it is a new matrix
# - get (getInverse) the value of its inverse (inverseEnvironment0)

makeCacheMatrix <- function(matrixEnvironment0 = matrix()) {
        
        inverseEnvironment0 <- NULL
        
        # add (setMatrix) the matrix to be inverted
        setMatrix <- function(matrixToSet) { 
                matrixEnvironment1 <<- matrixToSet
                inverseEnvironment1 <<- NULL
        }
        
        # - get (getMatrix) the value of the matrix to be inverted 
        #       (matrixEnvironment0) if exists
        getMatrix <- function() matrixEnvironment1 ## It will get the matrix if it exists from the other environment
        
        # - recalculate (setInverse) the inverse if it is a new matrix
        setInverse <- function(solve) inverseEnvironment1 <<- solve
        
        # - get (getInverse) the value of its inverse (inverseEnvironment0)
        getInverse <- function() inverseEnvironment1
        
        list (
                setMatrix = setMatrix,
                getMatrix = getMatrix,
                setInverse = setInverse,
                getInverse = getInverse
                )
}


# This function returns the inverse of a matrix that was created with
# the previous function (makeCacheMatrix). 
# 
# If the inverse of the matrix has not been calculated or the original matrix 
# has changed, then it will recalculate it's inverse. Otherwise it will
# directly return the cached value of the inverse.

cacheSolve <- function(x, ...) {
        
        inverseEnvironment0 <- x$getInverse()
        
        if (!is.null(inverseEnvironment0)) {
                message("getting cached inverse")
                return(inverseEnvironment0)
        }
        else {
                message("new Matrix")
                data <- x$getMatrix()
                inverseEnvironment0 <- solve(data)
                x$setInverse(inverseEnvironment0)
                return(inverseEnvironment0)
        }
        
}

##
## Test scripts
##

# Create and load the Matrix
matrix <- makeCacheMatrix()
matrix$setMatrix(matrix( c(1,1,1,3,4,3,3,3,4), nrow=3, ncol=3))

# First time, cacheSolve() computes the inverse
cacheSolve(matrix)

# Second time, cacheSolve() returns the cached inverse
cacheSolve(A)

# New matrix, cacheSolve() recomputes the inverse
matrix$setMatrix(matrix( c(7,-1,-1,-3,1,0,-3,0,1), nrow=3, ncol=3))
cacheSolve(matrix)

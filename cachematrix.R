## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

                inv_x <- NULL
                set <- function(y,...) {
                        
                        x <<- as.matrix(y,nrow=2,ncol=2)
                        inv_x <<- NULL
                }
                get <- function() {x}
                setinverse <- function(inv_value){ inv_x <<- inv_value}
                getinverse <- function() {inv_x}
                list(set = set, get = get,
                     setinverse = setinverse,
                     getinverse = getinverse)
        
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        ##cacheSolve is a function that computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
        ##If the inverse has already been calculated (and the matrix has not changed), 
        ##then the cachesolve should retrieve the inverse from the cache.
        ##Computing the inverse of a square matrix can be done with the solve function in R. 
        ##For example, if X is a square invertible matrix, then solve(X) returns its inverse.
        ##We are assuming that the matrix supplied is always invertible. Neo, are you listening?
                
                z <- x$getinverse()
                
                if(!is.null(z)) {
                        message("getting cached data")
                        return(z)
                }else{
                        data <- x$get()
                        #print(data)
                        z <- solve(data)
                        x$setinverse(z)
                        z
                }

}

#test class for week 3 assignment
testMakeCacheMatrix <- function(){
        #matrix test
        x<-matrix(rnorm(4),2,2) 
        y<-matrix(rnorm(16),4,4)
        print("X:")
        print(x)
        print("Y:")
        print(y)
        ax<-makeMatrix(y)
        print("get() should show y")
        print(ax$get())
        print("getinverse() should show NULL")
        print(ax$getinverse())
        ax$setinverse(x)
        print("test setinverse function with X matrix and call getinverse ")
        print(ax$getinverse())
        print(ax)   
        
        #cache test
        ax2<-makeMatrix(x)
        print("test cachesolve with x matrix")
        print("get()")
        print(ax2$get())
        print("getinverse")
        print(ax2$getinverse())
        print("cachsolve")
        print(cacheSolve(ax2))
        
        ax3<-makeMatrix(cacheSolve(ax2))
        print("get() another matrix based on inverse")
        print(ax3$get())
        print("getinverse()")
        print(ax3$getinverse())
        print("cachsolve, first not cached next cached")
        print(cacheSolve(ax3))
        print(cacheSolve(ax3))
        
}

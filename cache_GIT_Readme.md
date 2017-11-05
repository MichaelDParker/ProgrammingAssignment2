cacheSolve test
================

GitHub Documents
----------------

The following code can be used to test my makeCacheMatrix() and cacheSolve() functions:

Code lines for Matrix testing
=============================

Matrix results
--------------

Michael Parker Matrix example:

    x<-matrix(rnorm(4),2,2)         #creates simple square matrix
    y<-matrix(rnorm(16),4,4)
    ax<-makeMatrix(y)               #assigns the 4 by 4 matrix to ax
    ax$get()                        #confirm setter works.
    ax$getinverse()                 #returns NULL
    ax                              #returns list describing the methods

Code lines for Cache testing
============================

Cache results
-------------

Michael Parker Cache example:

    ax<-makeMatrix(x)               #assigns the 2 by 2 matrix to ax
    ax$get()                        #confirm setter works.
    ax$getinverse()                 #returns NULL
    cacheSolve(ax)                  #returns the inverse of the matrix
    #ax$setinverse(y)
    #ax$getinverse()
    ax2<-makeMatrix(cacheSolve(ax)) 
    ax2$getinverse()
    cacheSolve(ax2)  

Thank you for your review.

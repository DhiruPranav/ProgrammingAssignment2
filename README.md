### Assignment: Caching the Inverse of a Matrix

CacheMatrix.R file contains 2 methods makeCacheMatrix and cacheSolve methods

makeCacheMatrix takes a numeric vector and we can access this method by passing a square matrix or a empty parameter.
This method return a list object with 4 internal methods setMat,getMat, cacheMatrixInverse,calculateInverse
when you pass a parameter with a matrix object, this will be assigned to the Cache matrix variable m
getMat will return a matrix using the stored value from cache. 
calculateInverse method takes the cached matrix and calculate the inverse of the matrix using solve method. 
It also calls the method cacheMatrixInverse to save the inverse in the cache. 
Every time we call the createInverse method, it also saves the inverse value in cache so that it can be used when we want to read from cache.
cacheMatrixInverse saves the inverse in Minverse cache variable.

setmat method also resets the inverse cache variable because the existing value is not related to the new matrix. so we have to reset and let the next
create inverse method recalculate the inverse and add to cache.



cacheSolve method first check mInverse is empty (NULL) or not.
if it is not null then it simply return the value of cache variable mInverse.
if it is null then it gets the matrix using getMat method and calculate the inverse using calculateInverse method.
Here are references with some example calls



```

source("cacheMatrix.R")
> myMat=makeCacheMatrix()
> myMat$setMat(matrix(c(1,2,3,4),2,2))
> summary(myMat)
                   Length Class  Mode    
setMat             1      -none- function
getMat             1      -none- function
cacheMatrixInverse 1      -none- function
calculateInverse   1      -none- function
> myMat$calculateInverse()
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5
> 

cacheSolve(myMat)
     [,1] [,2]
[1,]   -2  1.5
[2,]    1 -0.5

or we can call the makeCacheMatrix like below

 secondMat <- makeCacheMatrix(matrix(c(1,2,3,4,5,6,7,8,9,10,11,12),4,4))
> secondMat$getMat()
     [,1] [,2] [,3] [,4]
[1,]    1    5    9    1
[2,]    2    6   10    2
[3,]    3    7   11    3
[4,]    4    8   12    4
> 

```



###

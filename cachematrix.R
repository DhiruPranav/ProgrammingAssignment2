makeCacheMatrix <- function(x = numeric()) {
        
        ## Resetting the cache variables to make sure cache do not refer 
        ## old cache data even after we call this method again with new matrix
        m <- NULL
        mInverse <- NULL
        setMat <- function(y) {
                m <<-x
                mInverse <<- NULL
                x <<- x
                #setting the matrix in to cache.
       
        }
        getMat <- function() 
        {
                #returning the matrix from cache.
               x
        }
        
       cacheMatrixInverse <- function(y) {
               
                mInverse <<- y
                # saving the inverse matrix in cache. here we are passing the 
                #variable after the inverse got calculated from calculate inverse method
                #Actual inverse calculation happens in another method.
        }
        
        calculateInverse <- function() {
                
                #Calculate inverse first check whether the matrix got initialized or not.
                #if the matrix exists then it will calculate the inverse using solve method and cache the outout for next call.
                x<<-getMat()
                if (!is.null(x))
                {
                        inv <<- solve(x)
                        cacheMatrixInverse(inv)
                        inv
                }
                else
                {
                        
                        message("Matrix is empty. Please set the matrix using setmat method before you call inverse")
                }
                
        }
        
        
        
        list(setMat = setMat, getMat = getMat , cacheMatrixInverse = cacheMatrixInverse, calculateInverse = calculateInverse)
        
      
        
}


cacheSolve <- function(y, ...) {
        # Check cache first
        inverse <- y$mInverse
        # if a cached value exists return it
        if(!is.null(inverse)) {
                return(inverse)
        }
        # if the cache is not available then calculate it
        data <- y$getMat()
        if (!is.null(data))
        {
                inverse <- y$calculateInverse()
                #save the calculated value in to Cache for next reference
                if (!is.null(inverse))
                {
               
                # return the inverse
                inverse
                }
        }
}
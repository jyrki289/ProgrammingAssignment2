  
## makeCachematrix function:

    ## -put original user given matrix (example: y) to special matrix (Matrix)
    ## -define set* and get* functions 
    ##  -Given Matrix has to be square matrix, identical number of rows and columns
    ##  -matrix can be inverted if it has identity matrix - in R this can be created: solve(matrix)%*%(matrix)

    ## detailed steps are written to code rows
    
    ## Example: y <- matrix(nrow = 2, ncol = 2, c(1,1,2,4)) creates matrix to be inverted
    ## Example: cy <- makeCacheMatrix(m) , create cachematrix
    ## Example: cacheSolve(cy) returns inverted matrix from cache or from calculation
    

makeCacheMatrix <- function(Matrix = matrix()) 
{ 
    invMatr <- NULL             ##intialize Inverse matrix to null
        
    set <- function(y)          # this functon set "special" matrix (Matrix) 
    {     					
        Matrix <<- y            ##given matrix to "special matrix"
        invMatr <<- NULL        ##this will "remove" current inverse matrix from cache
    } 

#other functions    
    get <- function() Matrix    #Get function takes "special matrix"						
    setInverse <- function(new_invMatr) invMatr <<- new_invMatr  #Set calculated inversematrix
    getInverse <- function() invMatr  #this function takes inverce matrix, whish is calculeted in cacheSolve function				
    
##function list object
list(set=set,
     get=get,
     getInverse=getInverse,
     setInverse=setInverse) 
}	 


## Cachesolve prints out the inverse, either from cache or ...
## after solving return a matrix that is the inverse of 'Special Matrix'

## Example: cacheSolve(cy) returns inverted matrix from cache or from calculation

cacheSolve <- function(Matrix, ...) 
{ 
    
    invMatr <- Matrix$getInverse() 				##inverted matrix from cache, if available 
    
    if (!is.null(invMatr))						## if found from cache, then returned -- no need to to calculate 
    { 
        message("getting inverse from cache") 
        return(invMatr)
    } 
    
    data <- Matrix$get()                        ## "send" Matrix to 'data'
    invMatr <- solve(data, ...) 				##calculate inverse to matrix (Matrix = data) 
    Matrix$setInverse(invMatr) 					##set inverse to cache with function (that is defined in  makeCacheMatrix)
    invMatr 						            ##return new inverse 
    
} 

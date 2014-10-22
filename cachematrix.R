
##First I test that i can push this to github 

##Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function


# matrix inverse can be calculated in R - solve(matrix)
# matrix can be inverted if it has identity matrix - in R: solve(matrix)%*%(matrix)


#############---Function: MAKE CACHE MATRIX ---#############

makeCacheMatrix <- function(mX = matrix()) 
    {
    mX <<- NULL              #Set To NULL, m stand for matrix
    inverseX <<- NULL        #Set To NULL,
    
        set <- function(y)   #set Matrix
        {
            mX <<- y
        }
    }
#New function below - GET MATRIX
    get <- function() {mX}    
         
#New function below - GET INVERSE
    getInverse <- function() {inverseX}
       

### to be continued.....



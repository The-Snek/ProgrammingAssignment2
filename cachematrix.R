#Snek
#6/19/2020
#R Programming Assignment 2

## Two functions below are used to calculate and then store
## the inverse of a matrix in a cache to avoid needing to
## recalculate it every time. 
## 
## Below are 4 lines to test the program.

# source("cachematrix.R")
# L <- matrix(1:4,2,2)
# M <- makeCacheMatrix(L)
# cacheSolve(M)



## This function creates the subsequent functions needed for 
## accessing or modifying the cached values. 

	makeCacheMatrix <- function(x = matrix())	 		{ #1	#.1
		In <- NULL								#.2	 
		setMatrix <- function(Matrix)		 		{ #2 	#.3	
				x <<- Matrix					#.4	 
				In <<- NULL						#.5					
} #2
		getMatrix <- function() x 					#.6	
		setInverse<- function(Inverse) In <<- Inverse 		#.7	
		getInverse<- function() In 					#.8	

		list(	setMatrix=setMatrix,					#.9	
			getMatrix=getMatrix,
			setInverse=setInverse,
			getInverse=getInverse)

} #1

##########

## This function takes the list produced before and uses it
## to figure out if it needs to do a calculation or just recall
## an already calculated number. 

	cacheSolve <- function(x,...) 				{ #1	#.10
		   In <- x$getInverse() 					#.11
	if(!is.null(In)) 							{ #2	#.12
		message("Inverse already calculated.")			#.13
		return(In)								#.14
} #2
	message("Calculating inverse.")					#.15
	mat <- x$getMatrix() 							#.16
	In <- solve(mat)								#.17
	x$setInverse(In)								#.18
	In										#.19
} #1






#Notes:

#.2 :		The variable "In" is defined as a local variable to this function. 
#		This is stored in the environment of the function itself. "x" is how it has
#		stored the matrix input into it and it has stored it as a local variable "x."

#.3 :		When called, the "setMatrix" function allows the matrix to be replaced, and in
#		doing so, it resets the inverse as well for recalculation. The super-assignment
#		operator (<<-) tells the program to search outside of the workspace environment
#		until it finds an existing variable named "x" and "In" to change their values. 
#		Otherwise, it would not find "x" or "In" in the environment of the workspace and
#		return an error. 

#.7 :		"setInverse" when called allows the variable "In" to be modified by the same method
#		used for "setMatrix."

#.9 : 	The list is the output of the "makeCacheMatrix" function which outputs the functions
#		under their own function name. (getInverse=getInverse is naming the function "getInverse"
#		as the same thing in the list.)

#.10:		To the function "cacheSolve" the "x" input is the output from "makeCacheMatrix" 
#		which is a list of the functions made. 

#.11:		The function "cacheSolve" sees "x" as a local variable, and never sees the other
#		use of the variable "x" from the environment of the "makeCacheMatrix" function. 
#		"In" is a new variable relative to the environment of "cacheSolve" which retrieves
#		the current inverse matrix from the previous environment of "makeCacheMatrix." 

#.12:		The state of the inverse matrix is tested. If it is still "NULL" then it knows
#		that it needs to be calculated. If it is anything other than "NULL" then it
#		assumes it has already calculated it and passes on whatever it has stored previously.

#.14: 	"return(In)" stops the function from proceeding to calculate and returns the value it 
#		currently has for "In." 

#.16:		If the value for "In" is still "NULL" it will then do the calculation by first calling
#		for the matrix which exists in the environment of "makeCacheMatrix" using "x$getMatrix()"

#.18:		After calculating the inverse matrix, it uses the function of "x$setInverse(In)" to set the 
#		variable in the environment of the "makeCacheMatrix" function to store it. 









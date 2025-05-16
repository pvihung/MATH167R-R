#HOMEWORK 2

# Question 1 
#a. Use an appropriate r-function to list the arguements of the function runif()
n=10
runif(n,min=0,max=1)
# n as the number of random values to generate 
# min as the min possible number 
# max as the max possible number 

#b. Write r-code that generate 10 random numbers of U[-1,1], the uniform 
# distribution on [-1,1], using position matching 
runif(10,-1,1)

#c. Write a line that generates 10 random numbers from 𝑈[−1,1], the uniform
# distribution on [−1, 1] using exact matching.
runif(n=10, min=-1 ,max = 1)


# Question 2 
#a. Review  algebraic and logical operators in r (“Introduction to Functions”).
# Write r-code that evaluates the following expression.
2^(-9 %% 4 ) == sqrt(64) #8=8 -> Equal
2^(-9 %% 4 ) != log(32,2) #8!=5 -> Not equal 

# Question 3
# Evaluate (inR) G(0), G(2), G(3) and display the results 
G<-function(u){
  if(u <= 2){
    return(u)
  }
  else {
    return(u+1)
  }
}
print(G(0)) #Answer is 0
print(G(2)) #Answer is 2
print(G(3)) #Answer is 4


# Question 4
#a. In the global environment, create a new environment called my_env. Within 
# my_env create variable x with value 2 and function f(y)= x^y. Once again, x 
# and f are objects of my_env (not the global one). Next, evaluate f(5)
my_env <- new.env()
my_env$x <- 2
my_env$f <- function(y){
  x^y 
}
environment(my_env$f) <- my_env
result <- my_env$f(5)
print(result)

#b. Write r-code that lists the objects of my-env
ls(envir = my_env)

#c. Write r-code that displays the enclosing environment for.
environment(my_env$f)

#e. What is the binding environment for f? You are welcome to provide its 
# memory address
environment(my_env$f)
# I think the binding environment for f is my_env
# memory address: <environment: 0x000001fb341aa768>

#d. Find a way to remove all objects of my_env rm() with options envir, list, 
# and function ls(). Check your work by listing the objects of my_env

rm(list = ls(envir = my_env), envir = my_env)
# Now it deletes all object in my_env 

ls(envir = my_env)
# this will return character(0)

  

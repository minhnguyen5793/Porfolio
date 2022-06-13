#1# Write a function that calculates the average of a list of number

average <- function(x){
  mean = sum(x)/length(x)
  return(mean)
}

#2# Write a function called firstTwoChars that extracts the first two characters of any bit of text.

firstTwoChars = function(x){
  substr(x,1,2)
}

#3# Write a function that checks if there are any missing values in a vector

IsMissing = function(x){
  any(is.na(x))
}

#4# Improve the function so that it tells you which of the values are missing, if any

WhichMissing = function(x){
    if (IsMissing(x)) {
      message("The following array position are missing: ")
      print(which(is.na(x)))
  }
}
  
#5# Write a function called getAge that asks the user to type his/her birthday and then return
    #their age.

getAge <- function(){
  
    dob = ymd(readline("Please enter your birthday(yyyymmdd): "))
    Age = as.numeric(interval(dob,ymd(today())), "years")
    message("Your age (in years) is: ")
    print(Age)
}

#6# Write a R program to create a vector which contains 10 random integer values between -50 and +50

ten_randint <- function(){
  x = sample(-50:50, 10, replace = T)
  x
}

#7# Write a R program to find the factors of a given number

FindFactor = function(x){
  p = c()
  for (i in 1:x){
    if (x%%i == 0){
    p = append(p,i)
    }
  }
  print(p)
}

#8# Make a simple calculator to add/subtract/multiply and divide 

calculator <- function()
{
    Add <- function(x,y){x+y}
    Subtract <-function(x,y){x-y}  
    Multiply <- function(x,y){x*y}  
    Divide <- function(x,y){x/y}  
    
    print("Select operation: ")
    print("1) Add")
    print("2) Subtract")
    print("3) Multiply")
    print("4) Divide")
    
    choice = as.integer(readline(prompt = "Enter your choice: "))
    
    a = as.integer(readline(prompt = "Enter the first number: "))
    b = as.integer(readline(prompt = "Enter the second number: "))
    
    operator = switch(choice, "+", "-", "*", "/")
    result = switch(choice, Add(a,b),Subtract(a,b), Multiply(a,b), Divide(a,b) )
    
    print(paste(a, operator, b, "=", result))
}  

#9# Write a simple moving average function(length = 3), then test it on the "Lynx" dataset
   #Then plot the SMA line against the original dataset in base plot

mySMA = function(data){
  n = length(data)
  avg = (data[1:(n-2)] + data[2:(n-1)] + data[3:n])/3
  ts = ts(avg, start = 1823)
  
  plot(data)
  lines(ts, col = "blue")
  
}

#10# Make a random matrix with x row and y column, then get the mean of each row, the mean
    #of each column, perform a mod division by 10, then sort the matrix in ascending order by column

apply_matrix = function(x,y){
  mat = matrix(sample(-50:50, x*y, replace = T), nrow = x, ncol = y)
  rmean = apply(mat, MARGIN = 1, FUN = mean)
  cmean = apply(mat, MARGIN = 2, FUN = mean)
  mat_sorted = apply(mat, MARGIN = 2, FUN = sort)
  mod_mad = apply(mat, MARGIN = c(1,2), FUN = function(x) x%%10)
  
  print("The original matrix is:")
  print(mat)
  print("Mean of each row: ")
  print(rmean)
  print("Mean of each column: ")
  print(cmean)
  print("The sorted matrix: ")
  print(mat_sorted)
  print("The mod 10 matrix: ")
  mod_mad

}

#11# 

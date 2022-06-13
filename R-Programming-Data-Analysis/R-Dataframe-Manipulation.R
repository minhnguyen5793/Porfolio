#DATASET : MTCARS

#1a. Get a histogram of the 'mpg' values of 'mtcars'. Which bin contains the most observations?
hist(mtcars$mpg)
    #bin 15-20 contains the most observations

#1b. Are there more automatic am(0) or manual am(1) transmission-type cars in the dataset?
sum(mtcars$am == 0)
sum(mtcars$am == 1)
    # There is more automatic cars in the dataset

#1c. Get a scatter plot of 'hp' vs 'weight'.
ggplot(mtcars, aes(x = hp, y = wt, col = cyl)) + geom_point()

#1d. Check the class of each variable in 'mtcars'.
sapply(mtcars, class)
#1e. Change 'am', 'cyl' and 'vs' to integer and store the new dataset as 'newmtc'.
attach(mtcars)
newmtc = data.frame(mpg, as.integer(cyl), disp, hp, drat, wt, qsec, as.integer(vs), as.integer(am), gear, carb)
#1f.  Round the 'newmtc' data frame to one digit.
round(newmtc,1)

#----------------------------------------------------------------------------------------#

#DATASET: IRIS

#2a. In the "Iris" dataset, get all rows of Species 'versicolor' in a new data frame. 
      #Call this data frame: 'iris.vers'
iris.vers = subset(iris, Species == "versicolor")
iris.vers

#2b. Get a vector called 'sepal.dif' with the difference between 'Sepal.Length' 
      #and 'Sepal.Width' of 'versicolor' plants.
sepal.dif = iris.vers$Sepal.Length - iris.vers$Sepal.Width

#2c. Update (add) 'iris.vers' with the new column 'sepal.dif'
iris.vers = data.frame(iris.vers, sepal.dif)

#2d. Use 'dplyr' to filter for all data of Species 'virginica' with a 'Sepal.Width' of greater than 3.5.

filter(iris, Species == 'virginica', Sepal.Width >3.5)

#2e. How would you use R Base to get a data frame of  all data of Species 'virginica' with a 
      #'Sepal.Width' of greater than 3.5, but without the last column Species in the data frame?
iris_filtered = iris[iris$Species == 'virginica' & iris$Sepal.Width >3.5, 1:4 ]

#2f. Get the row IDs of the rows matching the two filtering criteria provided above.

row.names(iris_filtered)

#2g. Repeat each value of 'Sepal.Length' two times and repeat the whole sequence two times as well.

rep(rep(iris$Sepal.Length, 2),2)

#2h. Get a new object which contains only the odd values of 'Sepal.Length'.

odd_sp = filter(iris, iris$Sepal.Length %% 2 ==1)

#2i. Get a new object which repeats each value from the new vector of exercise 2h.

rep(odd_sp$Sepal.Length, 2)

#------------------------------------------------------------------------------------------#

#DATASET "DIAMOND" 

#3a.Get a subset from the diamonds dataset with all the rows that have a clarity of 'SI2' and a depth of at least 70. 
  #Call the subset 'diam.sd' and display it in the same line of code.

(diam.sd = subset(diamonds, diamonds$clarity == 'SI2' & diamonds$depth >= 70))

#3b. Which index positions have a clarity of 'SI2' and a depth of at least 70? (hint: 'row.names')
row.names(diam.sd)
#3c. Store the index positions as an integer object.
index_pos = as.integer(row.names(diam.sd))
#3d. How many observations of diamonds have a cut of 'ideal' and have less than 0.21 carat?
sum(diamonds$cut == 'Ideal' & diamonds$carat < 0.21)
#3e. How many observations of diamonds have a combined 'x' + 'y' + 'z' dimension greater than 40?
sum((diamonds$x + diamonds$y + diamonds$z) > 40)
#3f. How many observations of diamonds have either a price above 10.000 USD or a depth of at least 70?
sum(diamonds$price > 10000 | diamonds$depth >= 70)
#3g. Get a data frame with observations '67' and '982' of variables color and y.
diamonds[c(67,182), c('color', 'y')]
#3h. Get a data frame with the full info on observations '453', '792' and '10489'.
diamonds[c(453,792,10489),]
#3i. Get the first 10 rows of the dataset 'diamonds' with the variables 'x', 'y', 'z'.
diamonds[1:10, c('x','y','z')]
#3j. Get the first six values of 'diamonds' of the variable 'y' as a simple vector.
diamonds[1:6, 'y']
#3k. Create the object 'newdiam' which is a subset of the first 1000 rows of 'diamonds'.
newdiam =diamonds[1:1000,]
#3l. Order 'newdiam' according to price, starting with the lowest. Hint: 'dplyr', 'arrange' is a useful function for that.
arrange(newdiam, price)
#3m. Order 'newdiam' according to price, starting with the highest.
arrange(newdiam, desc(price))
#3n. Order 'newdiam' like in exercise m, but ties should be arranged with increasing depth.
arrange(newdiam, desc(price), depth)
#3o. Use 'dplyr', 'sample_n' to get the object 'diam750' which contains 750 randomly sampled observations of 'diamonds'. 
diam750 = sample_n(diamonds, 750); head(diam750)
#3p. Get a summary of the new data frame.
summary(diam750)
#3q. Plot a polygon plot of price vs depth. 
ggplot(diamonds, aes(x = price, y = depth, col = color))+geom_polygon()

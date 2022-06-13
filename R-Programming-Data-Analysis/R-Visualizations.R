#Using "Iris" datasets from the buit in data() function

library(ggplot2)

#Scatter plot

plot1 <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) + geom_point()

#Histogram

plot2 <- ggplot(iris, aes(x = Petal.Length, fill = Species)) + geom_histogram(binwidth = 0.3, alpha = 0.75)

#Density plot

plot3 <- ggplot(iris, aes (x = Sepal.Length, fill = Species)) + geom_density(alpha = 0.55)

#Violin Plot

plot4 <- ggplot(iris, aes (x = Sepal.Length, y = Sepal.Width, fill = Species)) + geom_violin(alpha = 0.55)

#Point and Smooth Line

plot5 <- ggplot(iris, aes (x = Sepal.Length, y = Petal.Length, fill = Species, col = Species)) + geom_point() + geom_smooth()

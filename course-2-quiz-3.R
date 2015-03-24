library(datasets)
data(iris)

?iris
head(iris)
mean(iris$Sepal.Length[iris$Species == 'virginica'])

colMeans(iris)
apply(iris[,1:4], 2, mean)
?apply

data(mtcars)
?mtcars
head(mtcars)
tapply(mtcars$cyl, mtcars$mpg, mean)
sapply(split(mtcars$mpg, mtcars$cyl), mean)
?sapply
?split
split(mtcars$mpg, mtcars$cyl)

head(mtcars)
sapply(split(mtcars$hp, mtcars$cyl), mean)

debug(ls)
ls()

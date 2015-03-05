myfun <- function (x) {
  rnorm(x)
}

myfun(4)

1/0
1/Inf
0/0
0/-0
-0
-Inf
-1/0
-1/-0

x <- 4
x
class(x)
x <- c(4, TRUE)

x <- c(1,3,5)
y <- c(3,2,10)
rbind(x,y)

x <- list(2,"a","b",TRUE)
x[[2]]

x <- 1:4
y <- 2
x + y

x <- c(17,14,4,5,13,12,10)
x[x>10] == 4
x

data <- read.csv("hw1_data.csv")
data
head(data)
tail(data)
data[47]
data[[47]]
data$47
data
data[47,]
data[,1]
data[,0]
data[,0 == NA]
count(data[,0], NA)
isNA
isNA()
is.NA()
is.na(data[,1])
sum(is.na(data[,1]))
pred <- !is.na(data[,1])
pred
valid <- data[,1][pred]
valid
mean(valid)
mean(data[,1])

data["Ozone"]
d.ozone <- data$Ozone
d.temp <- data$Temp
d.ozone[x => x > 31]
d.ozone <- d.ozone[d.ozone > 31 & !is.na(d.ozone)]
d.temp <- d.temp[d.temp > 90 & !is.na(d.temp)]
data
sub.data <- data[!is.na(data["Ozone"]) & data["Ozone"] > 31 & !is.na(data["Temp"]) & data["Temp"] > 90,]
sub.data
mean(sub.data["Solar.R"])
sd.solar <- sub.data[,"Solar.R"]
sd.solar
mean(sd.solar)
mean(data["Temp"][data["Month"] == 6])
data["Temp"][]
data$Ozone$Month==5
max(data$Ozone[data$Month == 5 & !is.na(data$Ozone)])

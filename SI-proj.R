#example
hist(runif(1000))
mns = NULL
for (i in 1 : 1000) mns = c(mns, mean(runif(40)))
hist(mns)

#project
n <- 1000
lambda <- 0.2
mean.theoretical <- 1/lambda
sd.theoretical <- 1/lambda
var.theoretical <- 1/lambda^2

v1 <- rexp(n, lambda)
hist(v1)

v2 <- NULL
se <- sqrt(var.theoretical / n)
cfunc <- function(x,n) (x - mean.theoretical) / se
for(i in 1:n) v2 <- c(v2, mean(rexp(40,lambda)))
v3 <- sapply(v2, cfunc)
hist(v2)
hist(v3)

# pt1
mean.theoretical
mean.sample <- mean(v2)

# pt2
var.theoretical
var(v3)

# pt3
hist(v1)
hist(v2)

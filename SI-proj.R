#example
hist(runif(1000))
mns = NULL
for (i in 1 : 1000) mns = c(mns, mean(runif(40)))
hist(mns)

#project
lambda <- 0.2
mean.theoretical <- 1/lambda
sd.theoretical <- 1/lambda

v1 <- rexp(1000, lambda)
hist(v1)

v2 <- NULL
for(i in 1:1000) v2 <- c(v2, mean(rexp(40,lambda)))
hist(v2)

mean.theoretical
mean.sample <- mean(v2)

sd.sample <- sd(mns.exp)
sd.ideal

data <- read.csv("data/us-communities.csv")

q1 <- strsplit(names(data), "wgtp")
q1[123]

data <- read.csv("data/gdp.csv")
data <- data[5:194,]
totals <- gsub(",", "", data$X.3)
totals.num <- as.numeric(totals)

gdp <- read.csv("data/gdp.csv")
eds <- read.csv("data/edstats.csv")
full <- merge(gdp, eds, by.x = "X", by.y = "CountryCode")
complete.cases(full)

library(quantmod)
amzn = getSymbols("AMZN", auto.assign = F)
sampleTimes = index(amzn)

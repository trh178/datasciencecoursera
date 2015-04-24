download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", "data/american-community-survey.csv")
data <- read.csv("data/american-community-survey.csv")

# ACR == 3 and AGS == 6
al <- (data$ACR == 3 & data$AGS == 6)
res <- data[which(al),]
head(res)

library(jpeg)
data <- readJPEG("data/getdata-jeff.jpg", native = TRUE)
quantile(data, probs = c(.30, .80))

#download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", "data/gdp.csv")
gdp <- read.csv("data/gdp.csv")
#download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", "data/edstats.csv")
edstats <- read.csv("data/edstats.csv")

#library(dplyr)
#library(tidyr)
gdp.tbl <- tbl_df(gdp)
edstats.tbl <- tbl_df(edstats)
rm(gdp)
rm(edstats)

gdp.tbl <- gdp.tbl %>%
    slice(5:194) %>%
    select(X, Gross.domestic.product.2012, X.2, X.3) %>%
    rename(cc = X, gdp = Gross.domestic.product.2012, country = X.2, dollars = X.3)

edstats.tbl <- edstats.tbl %>%
    select(CountryCode, Long.Name, Income.Group) %>%
    rename(cc = CountryCode)

res <- inner_join(gdp.tbl, edstats.tbl)
res <- res %>%
    mutate(gdpn = extract_numeric(gdp))

q3 <- res %>%
    arrange(desc(gdpn))

q4 <- res %>%
    group_by(Income.Group) %>%
    summarize(avg = mean(gdpn))

q5 <- res %>%
    filter(gdpn <= 38) %>%
    select(cc, Income.Group)




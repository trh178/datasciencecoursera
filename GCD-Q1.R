if(!file.exists("data")) {dir.create("data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile = "./data/american-community-survey.csv", method="curl")
dateDownloaded <- date()

data <- read.csv("./data/american-community-survey.csv")
head(data)

vals <- data$VAL
clean.vals <- vals[complete.cases(vals)]
length(clean.vals[clean.vals == 24])

fess <- data$FES
fess

file2Url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(file2Url, destfile = "./data/natural-gas-aquisition.xlsx", method="curl")
dateDownloaded2 <- date()

library(xlsx)
data2 <- read.xlsx("./data/natural-gas-aquisition.xlsx", sheetIndex=1, header=TRUE)

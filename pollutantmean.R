pollutantmean <- function(directory, pollutant, id=1:332) {
    path <- file.path(directory, sprintf("%03d", id))
    total <- 0
    count <- 0
    for (p in path) {
        data <- read.csv(paste(p, ".csv", sep=""))
        pol.na <- data[pollutant]
        pol <- pol.na[!is.na(pol.na)]
        total <- total + sum(pol)
        count <- count + length(pol)
    }
    round(total / count, digits=3)
}
# 
# pollutantmean("specdata", "sulfate", 1:10)
# ## [1] 4.064
# pollutantmean("specdata", "nitrate", 70:72)
# ## [1] 1.706
# pollutantmean("specdata", "nitrate", 23)
# ## [1] 1.281

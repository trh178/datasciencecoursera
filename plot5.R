library(data.table)
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

bmore <- NEI[NEI$fips == "24510",]
bmore.table <- data.table(bmore)
vehicle.ids <- SCC$SCC[grep("On-Road", SCC$EI.Sector, ignore.case = TRUE)]
vehicle.rows <- bmore.table[SCC %in% vehicle.ids]
totals <- with(vehicle.rows, aggregate(Emissions, by = list(year), FUN = sum))

qplot(Group.1, x, 
      data = totals, 
      geom = c("point", "smooth"), 
      method = "lm", 
      xlab = "Year",
      ylab = "Total PM2.5 Emissions (tons)",
      main = "Baltimore City Motor Vehicle Emmissions")

dev.copy(device = png, filename = "plot5.png")
dev.off()
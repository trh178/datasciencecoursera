library(data.table)
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

counties <- NEI[NEI$fips %in% c("24510","06037"),]
counties.table <- data.table(counties)
vehicle.ids <- SCC$SCC[grep("On-Road", SCC$EI.Sector, ignore.case = TRUE)]
vehicle.rows <- counties.table[SCC %in% vehicle.ids]
totals <- with(vehicle.rows, aggregate(Emissions, by = list(fips, year), FUN = sum))
totals$county <- factor(totals$Group.1, levels=c("06037", "24510"), labels=c("LA County", "Baltimore City"))

qplot(Group.2, x, 
      data = totals,
      facets = .~county,
      geom = c("point", "smooth"), 
      method = "lm", 
      xlab = "Year",
      ylab = "Total PM2.5 Emissions (tons)",
      main = "Baltimore City vs. LA County: Motor Vehicle Emissions")

dev.copy(device = png, filename = "plot6.png")
dev.off()
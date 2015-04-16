NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

bmore <- NEI[NEI$fips == "24510",]
totals <- with(bmore, aggregate(Emissions, by = list(type, year), FUN = sum))

qplot(Group.2, x, 
      data = totals, 
      geom = c("point", "smooth"), 
      method = "lm", 
      facets = .~Group.1,
      xlab = "Year",
      ylab = "Total PM2.5 Emissions (tons)")


dev.copy(device = png, filename = "plot3.png", width = 600, height = 600)
dev.off()

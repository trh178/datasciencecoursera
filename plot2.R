NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

bmore <- NEI[NEI$fips == "24510",]
totals <- aggregate(bmore$Emissions, by=list(bmore$year), FUN=sum)
barplot(totals$x, names.arg = totals$Group.1, main = "Baltimore City", xlab = "Year", ylab = "Total PM2.5 Emissions (tons)")

dev.copy(device = png, filename = "plot2.png")
dev.off()

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

totals <- aggregate(NEI$Emissions, by=list(NEI$year), FUN=sum)
barplot(totals$x, names.arg = totals$Group.1, xlab = "Year", ylab = "Total PM2.5 Emissions (tons)", axes = FALSE)
axis(2, at = seq(0,8000000,2000000), labels = c("0", "2M", "4M", "6M", "8M"))

dev.copy(device = png, filename = "plot1.png")
dev.off()

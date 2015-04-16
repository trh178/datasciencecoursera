library(data.table)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI.table <- data.table(NEI)
coal.ids = SCC$SCC[grep("coal", SCC$EI.Sector, ignore.case = TRUE)]
coal.rows <- NEI.table[SCC %in% coal.ids]
totals <- with(coal.rows, aggregate(Emissions, by = list(year), FUN = sum))

barplot(totals$x, 
        names.arg = totals$Group.1, 
        xlab = "Year", 
        ylab = "Total PM2.5 Emissions (tons)", 
        main = "United States Coal Emissions",
        axes = FALSE)
axis(2, at = seq(0,600000,200000), labels = c("0", "200k", "400k", "600k"))

dev.copy(device = png, filename = "plot4.png")
dev.off()

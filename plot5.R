if(!("NEI" %in% ls())){
        NEI <- readRDS("./data/summarySCC_PM25.rds")}
if(!("SCC" %in% ls())){
        SCC <- readRDS("./data/Source_Classification_Code.rds")}

baltimore <- subset(NEI, fips == "24510")

#obtain SCC codes for vehicles and use codes to subset baltimore
#NEI data frame
vehicles <- SCC[grep("[Vv]ehicles", SCC$EI.Sector),]
codes <- unique(vehicles$SCC)

baltimore <- subset(baltimore, SCC %in% codes)
final <- aggregate(baltimore$Emissions, by = list(Year = baltimore$year),
          FUN = sum)

with(final, plot(Year, x, ylab = "Emissions (tons)", type = "l", lwd = "2", main = "Vehicular PM2.5 Emissions in Baltimore City"))

dev.copy(png, "plot5.png")
dev.off()
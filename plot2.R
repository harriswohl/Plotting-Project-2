if(!("NEI" %in% ls())){
        NEI <- readRDS("./data/summarySCC_PM25.rds")}
if(!("SCC" %in% ls())){
        SCC <- readRDS("./data/Source_Classification_Code.rds")}

baltimore <- subset(NEI, fips == "24510")
yearbaltimore <- split(baltimore, baltimore$year)
emissions <- c()
years <- unique(baltimore[, "year"])
for(x in yearbaltimore){
        emissions <- c(emissions, sum(x$Emissions))
        
        
}
plot(years, emissions, type = "l", lwd = 3, col = "#330066", 
     main = "Baltimore PM2.5  Emissions", xlab = "Year",
     ylab = "Emissions (tons)")

dev.copy(png, "plot2.png")
dev.off()


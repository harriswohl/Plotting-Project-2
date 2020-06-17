if(!("NEI" %in% ls())){
        NEI <- readRDS("./data/summarySCC_PM25.rds")}
if(!("SCC" %in% ls())){
        SCC <- readRDS("./data/Source_Classification_Code.rds")}

yearsplit <- split(NEI, NEI$year)
emissions <- c()
for(x in yearsplit){
        emissions <- c(emissions,sum(x$Emissions))
}
years <- c(1999, 2002, 2005, 2008)

plot(years, emissions, main = "Total PM2.5 Emissions", xlab = "Year",
     ylab = "Emissions (tons)", type = "l", lwd = 3, col = "dark green")

dev.copy(png, "plot1.png")
dev.off()


if(!("NEI" %in% ls())){
        NEI <- readRDS("./data/summarySCC_PM25.rds")}
if(!("SCC" %in% ls())){
        SCC <- readRDS("./data/Source_Classification_Code.rds")}

library(ggplot2)
baltimore <- subset(NEI, fips == "24510")
#aggregate emissions data by type, take yearly sum for each type
new <- aggregate(baltimore$Emissions, by = list(Year = baltimore$year, 
                        Type = baltimore$type), FUN = sum)
colnames(new) <- c("Year", "Type", "Emissions")

ggplot(data = new, aes(Year, Emissions)) + geom_line(aes(color = Type), lwd = 1.5, data = new) + 
        labs(y = "Emissions (tons)", title = "Baltimore PM2.5 Emissions by Source Type")

dev.copy(png, "plot3.png")
dev.off()
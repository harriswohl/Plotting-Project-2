if(!("NEI" %in% ls())){
        NEI <- readRDS("./data/summarySCC_PM25.rds")}
if(!("SCC" %in% ls())){
        SCC <- readRDS("./data/Source_Classification_Code.rds")}

#extract vehicle SCC codes to subset NEI dataframe
vehicles <- SCC[grep("[Vv]ehicles", SCC$EI.Sector),]
codes <- unique(vehicles$SCC)

sub <- subset(NEI, (fips == "06037" | fips == "24510") 
              & NEI$SCC %in% codes)

#summing yearly emissions for each city 
final <- aggregate(sub$Emissions, by = list(Year = sub$year, City = sub$fips),
                   FUN = sum)
#changing fips ID to city name
final$City <- c(rep("LA",4), rep("Baltimore", 4))

colnames(final) <- c("Year", "City", "Emissions")

library(ggplot2)
qplot(Year, Emissions, facets = .~City, data = final, asp = 1/1, geom = "line",
      main = "Vehicular PM2.5 Emissions", ylab = "Emissions (tons)")


dev.copy(png, "plot6.png")
dev.off()

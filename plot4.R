if(!("NEI" %in% ls())){
NEI <- readRDS("./data/summarySCC_PM25.rds")}
if(!("SCC" %in% ls())){
SCC <- readRDS("./data/Source_Classification_Code.rds")}

#subset SCC so that only coal sector is included, extract SCC 
#codes and use them to subset NEI dataset
coal <- SCC[grep("[Cc]oal", SCC$EI.Sector),]
codes <- unique(as.character(coal$SCC))
sub <- NEI[NEI$SCC %in% codes,]

final <- aggregate(sub$Emissions, by = list(Year = sub$year), FUN = sum)

with(final, plot(Year, x, ylab = "PM2.5 Emissions (tons)", main = "PM2.5 Emissions from Coal Combustion",
                 type = "l", lwd = 3, col = "black"))
dev.copy(png, "plot4.png")
dev.off()
if(!file.exists("data")){
        mkdir("data")
}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
temp <- tempfile()
download.file(fileUrl, temp)
filePath <- "./data"
unzip(temp, exdir = filePath)
unlink(temp)

NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

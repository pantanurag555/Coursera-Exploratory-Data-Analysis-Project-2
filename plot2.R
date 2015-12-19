NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimoreNEI<-NEI[NEI$fips == "24510",]
yearlysum<-aggregate(Emissions~year,baltimoreNEI,sum)

png("plot2.png")

barplot(yearlysum$Emissions,names.arg=yearlysum$year,ylab="PM2.5 emissions (in tons)",xlab="Year",main="Total PM2.5 emissions per year in Baltimore City")

dev.off()
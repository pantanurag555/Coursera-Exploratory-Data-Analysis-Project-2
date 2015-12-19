NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

yearlysum<-aggregate(Emissions~year,NEI,sum)

png("plot1.png")

barplot(yearlysum$Emissions/10^6,names.arg=yearlysum$year,ylab="PM2.5 emissions (10^6 tons)",xlab="Year",main="Total PM2.5 emissions per year from all US sources")

dev.off()
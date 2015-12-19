library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimoreNEI<-NEI[NEI$fips == "24510",]
vehicle<-grep("vehicle",SCC$SCC.Level.Two,ignore.case=TRUE)
vehicleSCC<-SCC[vehicle,]$SCC
vehicleNEI<-baltimoreNEI[baltimoreNEI$SCC %in% vehicleSCC,]
gg<-ggplot(vehicleNEI,aes(factor(year),Emissions))+geom_bar(stat="identity",fill="grey",width=0.75)+theme_bw()+labs(x="Year", y=expression("Total PM"[2.5]*" Emission (in Tons)"),title=expression("PM"[2.5]*" Emissions from Motor Vehicles in Baltimore City for 1999-2008"))

png("plot5.png")

print(gg)

dev.off()
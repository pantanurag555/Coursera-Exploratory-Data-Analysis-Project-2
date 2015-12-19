library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI$fips<-as.numeric(NEI$fips)
baltilacNEI<-NEI[NEI$fips == 24510 | NEI$fips ==  6037,]
vehicle<-grep("vehicle",SCC$SCC.Level.Two,ignore.case=TRUE)
vehicleSCC<-SCC[vehicle,]$SCC
vehicleNEI<-baltilacNEI[baltilacNEI$SCC %in% vehicleSCC,]
vehicleNEI$city<-ifelse(vehicleNEI$fips=="24510","Baltimore City","Los Angeles County")
gg<-ggplot(vehicleNEI,aes(factor(year),Emissions,fill=city))+geom_bar(stat="identity")+guides(fill=FALSE)+facet_grid(.~city,scales = "free",space="free")+theme_bw()+labs(x="Year", y=expression("Total PM"[2.5]*" Emission (in Tons)"),title=expression("PM"[2.5]*" Emissions from Motor Vehicles in Baltimore and LA,1999-2008"))

png("plot6.png")

print(gg)

dev.off()
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimoreNEI<-NEI[NEI$fips == "24510",]
gg<-ggplot(baltimoreNEI,aes(factor(year),Emissions,fill=type))+geom_bar(stat="identity")+facet_grid(.~type,scales = "free",space="free")+theme_bw()+theme(axis.text.x=element_text(size=9))+guides(fill=FALSE)+labs(x="Year", y=expression("Total PM"[2.5]*" Emission (in Tons)"),title=expression("PM"[2.5]*" Emissions from Baltimore City for 1999-2008 by Source"))

png("plot3.png")

print(gg)

dev.off()
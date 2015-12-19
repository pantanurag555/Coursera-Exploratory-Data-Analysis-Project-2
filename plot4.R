library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coal<-grep("coal",SCC$Short.Name,ignore.case=TRUE)
coalSCC<-SCC[coal,]$SCC
coalNEI<-NEI[NEI$SCC %in% coalSCC,]
gg<-ggplot(coalNEI,aes(factor(year),Emissions/10^5))+geom_bar(stat="identity",fill="grey",width=0.75)+theme_bw()+labs(x="Year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)"),title=expression("PM"[2.5]*" Coal Combustion Source Emissions Across US from 1999-2008"))

png("plot4.png")

print(gg)

dev.off()
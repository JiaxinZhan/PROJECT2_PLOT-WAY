library(ggplot2)
library(RColorBrewer)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("C:\\Users\\DELL\\Desktop\\summarySCC_PM25.rds")
SCC <- readRDS("C:\\Users\\DELL\\Desktop\\Source_Classification_Code.rds")

str(NEI)
str(SCC)



## Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
## Which city has seen greater changes over time in motor vehicle emissions?
baltLosAngelesMotors <- subset(NEI, NEI$fips %in% c("24510","06037") & NEI$type == "ON-ROAD")
baltLosAngelesMotorsAGG <- aggregate(Emissions ~ year + fips, baltLosAngelesMotors, sum)

ggplot(baltLosAngelesMotorsAGG, aes(year, Emissions, col = fips)) +
  geom_line() +
  geom_point() +
  ggtitle(expression("Baltimore and Los Angeles" ~ PM[2.5] ~ "Motor Vehicle Emissions by Year")) +
  labs(x = "Year", y = expression(~PM[2.5]~ "Motor Vehicle Emissions") ) +
  scale_colour_discrete(name = "City", labels = c("Los Angeles", "Baltimore")) +
  theme(legend.title = element_text(face = "bold"))

dev.copy(png, "C:\\Users\\DELL\\Desktop\\plot 6.png", width = 480, height = 480)
dev.off()

library(ggplot2)
library(RColorBrewer)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("C:\\Users\\DELL\\Desktop\\summarySCC_PM25.rds")
SCC <- readRDS("C:\\Users\\DELL\\Desktop\\Source_Classification_Code.rds")

str(NEI)
str(SCC)



## How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
baltimoreMotor <- subset(NEI, NEI$fips == "24510" & NEI$type == "ON-ROAD")
baltimoreMotorAGG <- aggregate(Emissions ~ year, baltimoreMotor, sum)

ggplot(baltimoreMotorAGG, aes(year, Emissions)) +
  geom_line(col = "steelblue3") +
  geom_point(col = "steelblue3") +
  ggtitle(expression("Baltimore " ~ PM[2.5] ~ "Motor Vehicle Emissions by Year")) +
  xlab("Year") +
  ylab(expression(~PM[2.5]~ "Motor Vehicle Emissions"))

dev.copy(png, "C:\\Users\\DELL\\Desktop\\plot 5.png", width = 480, height = 480)
dev.off()
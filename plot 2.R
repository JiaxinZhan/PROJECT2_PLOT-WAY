library(ggplot2)
library(RColorBrewer)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("C:\\Users\\DELL\\Desktop\\summarySCC_PM25.rds")
SCC <- readRDS("C:\\Users\\DELL\\Desktop\\Source_Classification_Code.rds")

str(NEI)
str(SCC)

## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
## Use the base plotting system to make a plot answering this question.
baltimore <- subset(NEI, NEI$fips == "24510")

totalBaltimore <- aggregate(Emissions ~ year, baltimore, sum)

plot(totalBaltimore$year, totalBaltimore$Emissions, type = "o", main = expression("Total Baltimore" ~ PM[2.5] ~ "Emissions by Year"), 
     xlab = "Year", ylab = expression("Total Baltimore "~ PM[2.5] ~ "Emissions"), col = "steelblue3")

dev.copy(png, "C:\\Users\\DELL\\Desktop\\plot 2.png", width = 480, height = 480)
dev.off()
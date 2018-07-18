library(ggplot2)
library(RColorBrewer)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("C:\\Users\\DELL\\Desktop\\summarySCC_PM25.rds")
SCC <- readRDS("C:\\Users\\DELL\\Desktop\\Source_Classification_Code.rds")

str(NEI)
str(SCC)

## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
## Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
totalNEI <- aggregate(Emissions ~ year, NEI, sum)

plot(totalNEI$year, totalNEI$Emissions, type = "o", col = "steelblue3", main = expression("Total US" ~ PM[2.5] ~ "Emissions by Year"), 
     ylab = expression("Total US" ~ PM[2.5] ~ "Emissions"), xlab = "Year")
dev.copy(png, "C:\\Users\\DELL\\Desktop\\plot 1.png", width = 480, height = 480)
dev.off()
















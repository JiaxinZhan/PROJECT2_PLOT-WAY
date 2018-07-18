library(ggplot2)
library(RColorBrewer)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("C:\\Users\\DELL\\Desktop\\summarySCC_PM25.rds")
SCC <- readRDS("C:\\Users\\DELL\\Desktop\\Source_Classification_Code.rds")

str(NEI)
str(SCC)

## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
## which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? Which have seen increases in emissions from 1999-2008? 
## Use the ggplot2 plotting system to make a plot answer this question. library(ggplot2)
baltimore <- subset(NEI, NEI$fips == "24510")
baltimoreType <- aggregate(Emissions ~ year + type, baltimore, sum)

ggplot(baltimoreType, aes(year, Emissions, col ~ type)) + 
  geom_line() +
  geom_point() +
  ggtitle(expression("Total Baltimore " ~ PM[2.5] ~ "Emissions by Type and Year")) +
  ylab(expression("Total Baltimore " ~ PM[2.5] ~ "Emissions")) +
  xlab("Year") +
  scale_color_discrete(name = "Type of sources") + 
  theme(legend.title = element_text(face = "bold"))

dev.copy(png, "C:\\Users\\DELL\\Desktop\\plot 3.png", width = 480, height = 480)
dev.off()
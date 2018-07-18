library(ggplot2)
library(RColorBrewer)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("C:\\Users\\DELL\\Desktop\\summarySCC_PM25.rds")
SCC <- readRDS("C:\\Users\\DELL\\Desktop\\Source_Classification_Code.rds")

str(NEI)
str(SCC)


## Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?
SCCcoal <- SCC[grepl("coal", SCC$Short.Name, ignore.case = T), ]
NEIcoal <- NEI[NEI$SCC %in% SCCcoal$SCC, ]
totalCoal <- aggregate(Emissions ~ year + type, NEIcoal, sum)

ggplot(totalCoal, aes(year, Emissions, col = type)) +
  geom_line() +
  geom_point() +
  ggtitle(expression("Total US" ~ PM[2.5] ~ "Coal Emission by Type and Year")) +
  xlab("Year") +
  ylab(expression("US " ~ PM[2.5] ~ "Coal Emission")) +
  scale_colour_discrete(name = "Type of sources") +
  theme(legend.title = element_text(face = "bold"))

dev.copy(png, "C:\\Users\\DELL\\Desktop\\plot 4.png", width = 480, height = 480)
dev.off()
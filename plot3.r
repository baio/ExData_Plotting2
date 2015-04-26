library("plyr")
library(ggplot2)

#source("read-data.r")

#here collect mean, sum and number of observations spliced by each year and point type
summary <- ddply(NEI[which(NEI$fips == "24510"),], .(year, type), summarize, mean = mean(Emissions), sum = sum(Emissions), n = length(Emissions))

plot <- ggplot(summary, aes(as.factor(year), mean))

#plot mean
plot + 
  geom_bar(stat="identity") +
  facet_grid(. ~ type) +
  labs(title = "Total emissions from PM2.5 in the Baltimore City (tons) by Point Types") +
  labs(x = "years") + 
  labs(y = "emmissions from PM2.5 mean (tons)")  
  
# all decreasing !
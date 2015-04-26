library("plyr")
library(ggplot2)

#source("read-data.r")

#seelct SCC for `mobile sources` (vechicles) 
scc <- SCC[which(SCC$SCC.Level.One == "Mobile Sources"), ]$SCC

#here collect mean, sum and number of observations spliced by each year
summary <- ddply(NEI[which(NEI$fips == "24510" & NEI$SCC %in% scc),], .(year), summarize, mean = mean(Emissions), sum = sum(Emissions), n = length(Emissions))

plot <- ggplot(summary, aes(as.factor(year), mean))

#plot mean
plot + 
  geom_bar(stat="identity") +
  labs(title = "Emissions from motor vehicle sources in Baltimore City") +
  labs(x = "years") + 
  labs(y = "emmissions from motor vehicle sources (tons)")  

# decreasing and increasing !
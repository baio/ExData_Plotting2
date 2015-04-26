library("plyr")
library("ggplot2")
library("ggthemes")

#source("read-data.r")

# select all cola - related, suppose EI.Sector contains pattern `fuel comb .* coal`
scc <- SCC[grep(pattern="fuel comb .* coal", SCC$EI.Sector, ignore.case = T), ]$SCC

#here collect mean, sum and number of observations spliced by each year
summary <- ddply(NEI[which(NEI$SCC %in% scc),], .(year), summarize, mean = mean(Emissions), sum = sum(Emissions), n = length(Emissions))

plot <- ggplot(summary, aes(as.factor(year), mean))

#plot mean
plot + 
  geom_bar(stat="identity") +
  labs(title = "Total emissions from PM2.5 in the USA from coal combustion-related sources") +
  labs(x = "years") + 
  labs(y = "emmissions from PM2.5 mean (tons)")  +
  theme_hc()

# decreasing (a little) !
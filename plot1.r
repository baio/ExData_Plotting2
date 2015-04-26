library("plyr")

#source("read-data.r")

#here collect mean, sum and number of observations spliced by each year
summary <- ddply(NEI, .(year), summarize, mean = mean(Emissions), sum = sum(Emissions), n = length(Emissions))

#plot mean
barplot(summary$mean, names=summary$year, main = "Total emissions from PM2.5 in the USA (tons)")

# YEP, decreasing !
library("plyr")
library("ggplot2")

#source("read-data.r")

#seelct SCC for `mobile sources` (vechicles) 
scc <- SCC[which(SCC$SCC.Level.One == "Mobile Sources"), ]$SCC

#here collect mean, sum and number of observations spliced by each year
summary <- ddply(NEI[which((NEI$fips == "24510" | NEI$fips == "06037") & NEI$SCC %in% scc),], .(year, fips), summarize, mean = mean(Emissions), sum = sum(Emissions), n = length(Emissions))

fips_names <- list(
  '24510'="Baltimore City",
  '06037'="Los Angeles"
)

fips_labeller <- function(variable,value){
  return(fips_names[value])
}

plot <- ggplot(summary, aes(as.factor(year), mean))

#plot mean
plot + 
  geom_bar(stat="identity") +
  facet_grid(. ~ fips, labeller = fips_labeller) +
  labs(title = "Emissions from motor vehicle sources in Baltimore City vs LA") +
  labs(x = "years") + 
  labs(y = "emmissions from motor vehicle sources (tons)")  

# decreasing !
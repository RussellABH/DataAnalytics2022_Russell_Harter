# read in the data and set the names accordingly
EPI_data <- read.csv("2010EPI_data.csv")
names(EPI_data) <- EPI_data[1,]
EPI_data <- EPI_data[-1,]
View(EPI_data)

# Gather and transform EPI. I don't like attach()
#  For other variables uncomment that code

# data <- na.omit(as.numeric(EPI_data$EPI))
# data <- na.omit(as.numeric(EPI_data$DALY))
data <- na.omit(as.numeric(EPI_data$WATER_H))


# view some data
summary(data)

# Stem + Histogram + Box plot
fivenum(data, na.rm=T)
stem(data)
hist(data)
#hist(data,seq(30., 95., 1.0), prob=T)
hist(data, freq=F); lines(density(data, bw="SJ")); rug(data)
boxplot(data)

# More complicated graphs
plot(ecdf(data), do.points=F,verticals=T)
qqnorm(data); qqline(data)

# Compare all three variables
allData = data.frame(EPI = na.omit(as.numeric(EPI_data$EPI)), 
                     DALY = na.omit(as.numeric(EPI_data$DALY)), 
                     WATER_H = na.omit(as.numeric(EPI_data$WATER_H)))
boxplot(allData)

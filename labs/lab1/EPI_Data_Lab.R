# read in the data and set the names accordingly
EPI_data <- read.csv("2010EPI_data.csv")
names(EPI_data) <- EPI_data[1,]
EPI_data <- EPI_data[-1,]
View(EPI_data)
# Need to convert values to numerics


EPI <- EPI_data$EPI # I don't like attaching so I'm going to do this

# view some data
colnames(EPI_data)
summary(EPI)

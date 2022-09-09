# Creating a dataframe
# Example: RPI Weather dataframe

days <- c("Mon", 'Tue', 'Wed', 'Thur', 'Fri', 'Sat', 'Sun') # days
temp <- c(28, 30.5, 32, 31.2, 29.3, 27.9, 26.4) # Temp in F' during winter
snowed <- c('T','T','F','F','T','T','F') # Snowed on that day: (T)rue (F)alse
snowed
help("data.frame")

RPI_Weather_Week <- data.frame(days, temp, snowed)
head(RPI_Weather_Week) # Head will only show first 6 rows

str(RPI_Weather_Week)

summary(RPI_Weather_Week)
summary((RPI_Weather_Week$temp)) # Can't use `.` in place of `$`

RPI_Weather_Week[,'snowed']
RPI_Weather_Week$snowed
RPI_Weather_Week[1:5, c('days', 'temp')] # First 5 rows of days and temp

subset(RPI_Weather_Week, subset = snowed=='T') # Helpful subset

sorted.snowed <- order(RPI_Weather_Week$snowed)
sorted.snowed
RPI_Weather_Week[sorted.snowed,]

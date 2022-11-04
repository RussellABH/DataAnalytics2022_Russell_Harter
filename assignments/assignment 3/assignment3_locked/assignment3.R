# Data and Information Resources, Role of Hypothesis, Exploration and Distributions lecture was helpful
# ------------------------------ Part a ------------------------------
# Note that I use 1 through 7 for ease of writing code. The actual dataset numbers are found below.
nyt1 = read.csv("data/nyt18.csv")
nyt2 = read.csv("data/nyt19.csv")
nyt3 = read.csv("data/nyt24.csv")
nyt4 = read.csv("data/nyt25.csv")
nyt5 = read.csv("data/nyt26.csv")
nyt6 = read.csv("data/nyt27.csv")
nyt7 = read.csv("data/nyt30.csv")

# Look at the data
summary(nyt1)
head(nyt2)
View(nyt1)

# It seems like a lot of the data is missing, and it's inconsistent on what's missing.
#  I chose age and impressions for the variables. I'm going to remove the rows
#  in which the age is 0, since that's not possible.
nrow(nyt1)
nyt1 <- nyt1[!(nyt1$Age == 0),]
min(nyt1$Age)
nrow(nyt1)
nyt2 <- nyt2[!(nyt2$Age == 0),]
nyt3 <- nyt3[!(nyt3$Age == 0),]
nyt4 <- nyt4[!(nyt4$Age == 0),]
nyt5 <- nyt5[!(nyt5$Age == 0),]
nrow(nyt6)
nyt6 <- nyt6[!(nyt6$Age == 0),]
nrow(nyt6)
nyt7 <- nyt7[!(nyt7$Age == 0),]

# Generate boxplots
boxplot(nyt1$Age, nyt2$Age, nyt3$Age, nyt4$Age, nyt5$Age, nyt6$Age, nyt7$Age, 
        names = c("nyt18", "nyt19", "nyt24", "nyt25", "nyt26", "nyt27", "nyt30"),
        main = "Age Data")

boxplot(nyt1$Impressions, nyt2$Impressions, nyt3$Impressions, nyt4$Impressions, nyt5$Impressions, nyt6$Impressions, nyt7$Impressions, 
        names = c("nyt18", "nyt19", "nyt24", "nyt25", "nyt26", "nyt27", "nyt30"),
        main = "Impressions Data")

# Discussion:
#  In both cases, it seems like the data has the exact same distribution across all nyt datasets.
#  I actually thought that this might've been because I removed the rows with 0s, but I did it 
#  without removing those rows and they still all had the same distribution. Honestly it seems
#  like all these nyt datasets came from one main dataset and each individual one was randomly
#  sampled from the main one without replacement, they're so perfectly similar. 

# ------------------------------ Part b ------------------------------
# I'm going to use the same variables as I used in a

#  After experimenting, using 40 breaks seems to show a pattern without being too hard to see.
#  I also forced the x and y axis so show all numbers.
hist(nyt1$Age, breaks = 40, xlim = c(0, 100)) 
hist(nyt2$Age, breaks = 40, xlim = c(0, 100)) 
hist(nyt3$Age, breaks = 40, xlim = c(0, 100)) 
hist(nyt4$Age, breaks = 40, xlim = c(0, 100)) 
hist(nyt5$Age, breaks = 40, xlim = c(0, 100)) 
hist(nyt6$Age, breaks = 40, xlim = c(0, 100)) 
hist(nyt7$Age, breaks = 40, xlim = c(0, 100)) 

hist(nyt1$Impressions, breaks = 20, xlim = c(0, 20)) 
hist(nyt2$Impressions, breaks = 20, xlim = c(0, 20)) 
hist(nyt3$Impressions, breaks = 20, xlim = c(0, 20)) 
hist(nyt4$Impressions, breaks = 20, xlim = c(0, 20)) 
hist(nyt5$Impressions, breaks = 20, xlim = c(0, 20)) 
hist(nyt6$Impressions, breaks = 20, xlim = c(0, 20)) 
hist(nyt7$Impressions, breaks = 20, xlim = c(0, 20)) 

# Discussion:
#  Regarding the age, yet again we see the exact same pattern emerge. All the datasets have 
#  essentially the exact same distribution. However, it's worth noting that for some reason
#  nyt27 (my 6) has a little less than double the amount of data of the other data sets.
#  This is true even without removing the 0 rows, so I don't know why it's so much bigger.
#  The distribution skews right slightly and has a spiked pattern. Skewing right makes sense
#  as the older you are the you'll probably use nyt less, but I can't think of a reason
#  that ages 25ish, 35ish, and 45ish would use it less than other neighbors. 
#  Regarding the Impressions, they all yet again have essentially the same distribution.
#  Ignoring the total num row differences, it seems to be a relatively gaussian curve, however
#  a little skewed to the right.

#  ------------------------------ Part c ------------------------------
# Plot ecdf
plot(ecdf(nyt1$Age))
plot(ecdf(nyt2$Age))
plot(ecdf(nyt3$Age))
plot(ecdf(nyt4$Age))
plot(ecdf(nyt5$Age))
plot(ecdf(nyt6$Age))
plot(ecdf(nyt7$Age))

#Plot an ecdf on a normal distribution for comparison
plot(ecdf(rnorm(2000)))

plot(ecdf(nyt1$Impressions))
plot(ecdf(nyt2$Impressions))
plot(ecdf(nyt3$Impressions))
plot(ecdf(nyt4$Impressions))
plot(ecdf(nyt5$Impressions))
plot(ecdf(nyt6$Impressions))
plot(ecdf(nyt7$Impressions))




# Get a normal distribution of each and qqplot against that
#  As this takes a while to compute and I wasn't asked to do this for each dataset
#  I'm just going to use one of the datasets.
qqnorm(nyt1$Age)
qqline(nyt1$Age)

qqnorm(nyt1$Impressions)
qqline(nyt1$Impressions)

# Discussion:
#  Of course, when doing the ecdf all the graphs look the same. Moving past that,
#  I've realized that this data is almost certainly not normal. From looking 
#  at the ecdf of the variables, it's close but is slightly more linear. This is
#  made even more clear when we make the qqplot. The middle is almost perfectly
#  normal, however once we leave around 2 quantiles in either direction it gets
#  decisively less normal. It seems that in both variables the data gets more spread 
#  out. This reminds me now more of a Cauchy distribution. 

#  ------------------------------ Part d ------------------------------
# I want to use a Shapiro-wilks test for this, but that only works on sample sizes up to 5000.

#  Start of discussion: While doing research for this, I found out that most normality testing is useless
#   when it comes to very large sample sizes like this one since once you get large it's 
#   basically guaranteed that our data will deviate from the idealistic normal distribution.
#   To demonstrate this, I'm going to do the Shapiro-wilks test on increasingly
#   larger samples from the data.


ageSmall <- sample(nyt1$Age, 50)
impressionsSmall <- sample(nyt1$Impressions, 50)

shapiro.test(impressionsSmall)
shapiro.test(impressionsSmall)


ageSmall <- sample(nyt1$Age, 500)
impressionsSmall <- sample(nyt1$Impressions, 500)

shapiro.test(impressionsSmall)
shapiro.test(impressionsSmall)


ageSmall <- sample(nyt1$Age, 5000)
impressionsSmall <- sample(nyt1$Impressions, 5000)

shapiro.test(impressionsSmall)
shapiro.test(impressionsSmall)

# Discussion Continued:
#  As we can see, the test gets increasingly confident that the data does not
#  follow a normal distribution as the number of samples we pull from it goes up.
#  Therefore, I don't believe that we can really say for sure whether or not 
#  the data follows a normal distribution. Or rather, we should say that since the 
#  data set is large it does not follow a normal distribution. 
#  It is worth noting that it fails to have a normal distribution even on a small
#  sample, but I still believe that using normally tests on data of this size isn't
#  very effective. Visualizing with the qqplot is probably the best we'll get, and 
#  there I saw that it likely wasn't normal (at least to my eye), so that's my conclusion.
#  This seems to not be normally distributed and we fail to reject the null hypothesis. 
# PCA with iris dataset
data("iris")
head(iris)
# creating another dataset from iris dataset that
# contains the columns from 1 to 4
irisdata1 <- iris[,1:4]
irisdata1

head(irisdata1)
# Read the documentation for the princomp() function in RStudio.
help("princomp")
principal_components <- princomp(irisdata1, cor = TRUE, score = TRUE)
# cor = a logical value indicating whether the calculation should
# use the correlation matrix or the covariance matrix.
# (The correlation matrix can only be used if there are no constant variables.)
# score = a logical value indicating whether the score on
# each principal component should be calculated.
summary(principal_components)
# in the summary you can see that it has four Principal Components it is because the input data has
# four different features

# See nov 1 slides for interpretation

# using the plot() function, we can plot the
# principal components.
plot(principal_components)

# plotting the principal_components using the a
# line in plot() functions
plot(principal_components, type = "l")

# using the biplot() function we can plot the components
# Read the documentation for the bilopt() function in the RStudio
help("biplot")
biplot(principal_components)

# PCA with iris dataset
data("iris")
head(iris)
# creating another dataset from iris dataset that contains the columns from 1 to 4
irisdata1 <- iris[,1:4]
irisdata1
head(irisdata1)
principal_components <- princomp(irisdata1, cor = TRUE, score = TRUE)
summary(principal_components)
# in the summary you can see that it has four Principal Components it is becasue the input data
# has
# four different features.
# using the plot() function, we can plot the principal components.
plot(principal_components)
# plotting the principal_components using the a line in plot() functions
plot(principal_components, type = "l")
# using rhw biplot() function we can plot the components
biplot(principal_components)


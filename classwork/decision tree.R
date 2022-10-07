library(rpart)
library(rpart.plot)

# we will be using the iris dataset
iris
dim(iris)
# creating a sample from the iris dataset
s_iris <- sample(150,100) # Can seed this
s_iris
# creat testing and training sets
iris_train <-iris[s_iris,]
iris_test <-iris[-s_iris,]
dim(iris_test)
dim(iris_train)

# generate the decision tree model
dectionTreeModel <- rpart(Species~., iris_train,
                          method = "class")
# Same thing as this:
# dectionTreeModel <- rpart(Species~colname1+colname2+colname3+colname4, iris_train,
#                           method = "class") 

dectionTreeModel

#plotting the decision tree model using
#rpart.plot() function
rpart.plot(dectionTreeModel)

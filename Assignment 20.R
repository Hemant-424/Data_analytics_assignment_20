#2. Perform the below given activities:
#a. Create classification model using different random forest models


require(randomForest)
set.seed(101)
dim(weight_lifting_exercises)
train <- sample(nrow(weight_lifting_exercises), 0.7*nrow(weight_lifting_exercises), replace = FALSE)
TrainSet <- weight_lifting_exercises[train,]
ValidSet <- weight_lifting_exercises[-train,]  #(we can also call as test dataset)


weight.rf=randomForest(classe ~ . , data = weight_lifting_exercises , subset = train)
weight.rf
plot(weight.rf)


#b. Verify model goodness of fit





#c. Apply all the model validation techniques

# Predicting on train set
predTrain <- predict(weight.rf, TrainSet, type = "class")
# Checking classification accuracy
table(predTrain, TrainSet$classe)  


# Predicting on Validation set
predValid <- predict(weight.rf, ValidSet, type = "class")
# Checking classification accuracy
mean(predValid == ValidSet$classe)                    
table(predValid,ValidSet$classe)


#d. Make conclusions



#e. Plot importance of variables

# To check important variables
importance(weight.rf)        
varImpPlot(weight.rf) 


# Fine tuning parameters of Random Forest model
model7 <- randomForest(classe~ ., data = TrainSet, ntree = 500, mtry = 5, importance = TRUE)
model7






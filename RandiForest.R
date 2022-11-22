
# Loading package
library(caTools)
library(randomForest)

df = subset(Bank, select = c(Age,Employment,CreditScore,RiskFactor))
# Splitting data in train and test data
split <- sample.split(df, SplitRatio = 0.7)
split

train <- subset(df, split == "TRUE")
test <- subset(df, split == "FALSE")

# Fitting Random Forest to the train dataset
set.seed(120) # Setting seed
classifier_RF = randomForest(x = train[-4],
                             y = train$RiskFactor,
                             ntree = 500)

classifier_RF

# Predicting the Test set results
y_pred = predict(classifier_RF, newdata = test[-4])

# Confusion Matrix
confusion_mtx = table(test[, 4], y_pred)
confusion_mtx

# Plotting model
plot(classifier_RF)

# Importance plot
importance(classifier_RF)

# Variable importance plot
varImpPlot(classifier_RF)
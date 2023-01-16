library(caTools)
library(randomForest)

df<-subset(Bank,select = c(Age,Employment,CreditScore,RiskFactor))
df

split<-sample.split(df,SplitRatio=0.7)
split

train<-subset(df,split=="TRUE")
test<-subset(df,split=="FALSE")

set.seed(120)
classifier_RF=randomForest(x=train[-4],
                            y=train$RiskFactor,
                            ntree=500)
classifier_RF

y_pred<-predict(classifier_RF,newdata = test[-4])
y_pred

confusion_mtx=table(test[,4],y_pred)
confusion_mtx

plot(classifier_RF)

importance(classifier_RF)
varImpPlot(classifier_RF)
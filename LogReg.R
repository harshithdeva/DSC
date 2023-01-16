library(caTools)
library(ROCR)
library(ggplot2)
library(dplyr)

#Income=c(12000,15000,24000,10000,6900,13500,18000,50000,46000,37000)
#Age=c(32,26,37,44,56,24,45,32,21,28)
#Permanent_Job=c(1,0,0,1,1,0,1,1,1,0)
#Loan_appr=c(1,0,1,1,0,0,1,1,1,0)
#df<-data.frame(Age,Income,Permanent_Job,Loan_appr)

#write.csv(df,"D:/SEM 7/DSC Lab/Practice/log.csv")

df<-subset(diabetes3,select = c(Pregnancies,Glucose,BloodPressure,BMI,Age,Insulin,Outcome))
split=sample.split(df,SplitRatio = 0.7)

train=subset(df,split=="TRUE")
test=subset(df,split=="FALSE")

logr=glm(formula = Outcome~Pregnancies+Glucose+BloodPressure+BMI+Age+Insulin,
         data=train,family = "binomial")
summary(logr)

y_pred<-predict(logr,test,type="response")
y_pred

y_pred<-ifelse(y_pred>0.5,1,0)

cm=table(test$Outcome,y_pred)
cm

ROCPred <- prediction(y_pred, test$Outcome)
ROCPer <- performance(ROCPred, measure = "tpr",
                      x.measure = "fpr")

plot(ROCPer)
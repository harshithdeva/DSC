library(arules)
library(arulesViz)

df=read.transactions('D:/SEM 7/DSC Lab/Exam practice/Market_Basket_Optimisation1.csv')
str(df)

rule1<-apriori(df,parameter=list(support=0.002,confidence=0.5))
inspect(head(rule1,5))
inspect(head(sort(rule1,by='lift'),5))
plot(rule1)
plot(rule1, method="grouped")

#rule2<-apriori(df,parameter = list(support=0.002,confidence=0.5,minlen=5))
#inspect(head(rule2,4))
#inspect(head(sort(rule2,by='lift'),4))
#plot(rule2,method="grouped")

rule3<-apriori(df,parameter = list(support=0.003,confidence=0.6))
inspect(head(rule3))
plot(rule3,method="grouped")
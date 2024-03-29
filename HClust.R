library(dplyr)
library(ggplot2)

df=subset(Bank,select=c(Age,Employment,CreditScore,RiskFactor))
df

distance_mat=dist(df,method = "euclidean")
distance_mat

set.seed(240)
Hierar_cl=hclust(distance_mat,method="average")
plot(Hierar_cl)

abline(h=110, col="green")

fit<-cutree(Hierar_cl,k=3)
fit

table(fit)
rect.hclust(Hierar_cl,k=3,border = "green")
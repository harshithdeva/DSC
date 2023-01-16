library(ggfortify)
library(ggplot2)
library(dplyr)
summary(iris)
head(iris)
df=select(iris,c(1:4))

wssplot<-function(df,nc=15,seed=1234)
{
  wss<-(nrow(data)-1)*(sum(apply(df,2,var)))
  for(i in 2:n)
  {
    set.seed(seed)
    wss[i]<-sum(kmeans(df,center=i)$withinss)
    
  }
  plot(1:nc,df,type='b',xlab("No of clust"),
       ylab("WSS"))
  wss
}
kmean<-kmeans(df,2)
kmean$centers
autoplot(kmean,df,frame=TRUE)
kmean<-kmeans(data,3)
kmean$centers

  

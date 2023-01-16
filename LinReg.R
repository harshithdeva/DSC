library(ggpubr)
library(ggplot2)
library(dplyr)
library(caTools)
library(broom)

df<-subset(Book1,select=c(Age,Salary,Score))
df
inc<-lm(Score~Salary,data=df)
zz=ggplot(Book1,aes(x=Salary,y=Score))+geom_point()+geom_smooth(method="lm",col="Black")
zz

split = sample.split(df, SplitRatio = 0.7)
train = subset(df, split == "TRUE")
test = subset(df, split == "FALSE")

lm.r= lm(formula = Score ~ Salary,
         data = train)
coef(lm.r)

# Predicting the Test set results
ypred = predict(lm.r, newdata = test)


ggplot() + geom_point(aes(x = train$Salary,
                          y = train$Score), colour = 'red') +
  geom_line(aes(x = train$Salary,
                y = predict(lm.r, newdata = train)), colour = 'blue') +
  
  ggtitle('Training set') +
  xlab('Salary') +
  ylab('Score')


ggplot() +
  geom_point(aes(x = test$Salary, y = test$Score),
             colour = 'red') +
  geom_line(aes(x = train$Salary,
                y = predict(lm.r, newdata = train)),
            colour = 'blue') +
  ggtitle('Test set') +
  xlab('Salary') +
  ylab('Score')
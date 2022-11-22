library(ggplot2)
library(dplyr)
library(broom)
library(ggpubr)

summary(Book1)

inc <- lm(Score ~ Salary, data = Book1)
summary(inc)

income.graph<-ggplot(Book1, aes(x=Salary, y=Score))+
  geom_point() + geom_smooth(method="lm", col="black")
income.graph
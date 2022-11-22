
#install.packages("dplyr")

# Loading package
library(dplyr)

df<-subset(Bank,select=c(Age,Employment,CreditScore,RiskFactor))

distance_mat <- dist(df, method = 'euclidean')
distance_mat


set.seed(240)  # Setting seed
Hierar_cl <- hclust(distance_mat, method = "average")
Hierar_cl

# Plotting dendrogram
plot(Hierar_cl)

# Choosing no. of clusters
# Cutting tree by height
abline(h = 110, col = "green")

# Cutting tree by no. of clusters
fit <- cutree(Hierar_cl, k = 3 )
fit

table(fit)
rect.hclust(Hierar_cl, k = 3, border = "green")
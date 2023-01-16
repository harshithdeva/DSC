library(arules)
library(arulesViz)

data("Groceries")
summary(Groceries)

apriori(Groceries,parameter=list(support=0.002,confidence=0.5)) -> rule1
inspect(head(rule1,5))
inspect(head(sort(rule1,by="lift"),5))
plot(rule1)
plot(rule1,method="grouped")

apriori(Groceries,parameter=list(support=0.002,confidence=0.5,minlen=5)) -> rule2
inspect(head(rule2,4))
plot(rule2,method="grouped")

apriori(Groceries,parameter=list(support=0.007,confidence=0.6)) -> rule3
inspect(head(rule3))
plot(rule3,method="grouped")
















#library(arules)

#data(Market_Basket_Optimisation)
# Loading data
#Market_Basket_Optimisation = read.transactions('./Market_Basket_Optimisation.csv', 
#                       sep = ', ', rm.duplicates = TRUE)

# Structure 
#str(Market_Basket_Optimisation)

#install.packages("arulesViz")

# Loading package
#library(arulesViz)

# Fitting model
# Training Apriori on the Market_Basket_Optimisation
#set.seed = 220 # Setting seed
#associa_rules = apriori(data = Market_Basket_Optimisation, 
 #                       parameter = list(support = 0.004, 
  #                                       confidence = 0.2))

# Plot
#itemFrequencyPlot(Market_Basket_Optimisation, topN = 10)

# Visualising the results
#inspect(sort(associa_rules, by = 'lift')[1:10])
#plot(associa_rules, method = "graph", measure = "confidence", shading = "lift")


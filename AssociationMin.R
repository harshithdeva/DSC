library(arules)
library(arulesViz)

# Loading data
dataset = read.transactions('D:/SEM 7/DSC Lab/Exam practice/Market_Basket_Optimisation1.csv', 
                            rm.duplicates = TRUE)

# Structure 
str(dataset)
# Installing Packages
#install.packages("arules")
#install.packages("arulesViz")

# Loading package


# Fitting model
# Training Apriori on the dataset
set.seed = 220 # Setting seed
associa_rules = apriori(data = dataset, 
                        parameter = list(support = 0.004, 
                                         confidence = 0.2))

# Plot
itemFrequencyPlot(dataset, topN = 10)

# Visualising the results
inspect(sort(associa_rules, by = 'lift')[1:10])
plot(associa_rules, method = "graph", 
     measure = "confidence", shading = "lift")
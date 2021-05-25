
install.packages("arules")

library("arules") # Used for building association rules i.e. apriori algorithm

TransRetail <- read.csv(file.choose())

View(TransRetail)

rules <- apriori(TransRetail,parameter=list(support=0.003, confidence = 0.8,minlen=5))
rules
summary(rules)
inspect(head(sort(rules, by = "lift"))) 

head(quality(rules))

plot(rules,method = "scatterplot",jitter =0)

plot(rules, method = "grouped")

plot(rules,method = "graph")

write(rules, file = "tran.csv", sep = ",")

getwd()

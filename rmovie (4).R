
install.packages("arules")

library("arules") # Used for building association rules i.e. apriori algorithm
#Loading the dataset

mymovies <- read.csv(file.choose())

View(mymovies)

rules <- apriori(as.matrix(mymovies[,6:15],parameter=list(support=0.2, confidence = 0.5,minlen=5)))
inspect(head(sort(rules, by = "lift"))) 
head(quality(rules))

plot(rules,method = "scatterplot")

plot(rules, method = "grouped")

plot(rules,method = "graph")

write(arules, file = "movie.csv", sep = ",")

getwd()

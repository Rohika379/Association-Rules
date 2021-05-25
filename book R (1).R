
install.packages("arules")

library("arules") # Used for building association rules i.e. apriori algorithm

data <- read.csv("C:\\Users\\rohika\\OneDrive\\Desktop\\360digiTMG assignment\\Association rule\\book.csv")
colnames(data)

#Levelling the numeric variables

data$ChildBks <- factor(data$ChildBks,levels = c("1","0"),labels = c("ChildBks",""))
data$YouthBks <- factor(data$YouthBks,levels = c("1","0"),labels = c("YouthBks",""))
data$CookBks <- factor(data$CookBks,levels = c("1","0"),labels = c("CookBks",""))
data$DoItYBks <- factor(data$DoItYBks,levels = c("1","0"),labels = c("DoItYBks",""))
data$RefBks <- factor(data$RefBks,levels = c("1","0"),labels = c("RefBks",""))
data$ArtBks <- factor(data$ArtBks,levels = c("1","0"),labels = c("ArtBks",""))
data$GeogBks <- factor(data$GeogBks,levels = c("1","0"),labels = c("GeogBks",""))
data$ItalCook <- factor(data$ItalCook,levels = c("1","0"),labels = c("ItalCook",""))
data$ItalAtlas <- factor(data$ItalAtlas,levels = c("1","0"),labels = c("ItalAtlas",""))
data$ItalArt <- factor(data$ItalArt,levels = c("1","0"),labels = c("ItalArt",""))
data$Florence <- factor(data$Florence,levels = c("1","0"),labels = c("Florence",""))

data1 <- as(data,"transactions")

itemFrequencyPlot(data1,topN=25)

library(car)

arules <- apriori(data1, parameter = list(supp = 0.005, confidence = 0.50, minlen = 2))
# Building rules using apriori algorithm

arules

# Viewing rules based on lift value
inspect(head(sort(rules), n = 10))

# Overal quality 
head(quality(arules))

# install.packages("arueslViz")
library("arulesViz") # for visualizing rules

# Different Ways of Visualizing Rules
plot(arules)

windows()
plot(arules, method = "grouped")
plot(arules[1:10], method = "graph") # for good visualization try plotting only few rules

write(arules, file = "books.csv", sep = ",")

getwd()


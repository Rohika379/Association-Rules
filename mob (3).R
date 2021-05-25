
install.packages("arules")

library("arules") # Used for building association rules i.e. apriori algorithm

data <- read.csv("C:\\Users\\rohika\\OneDrive\\Desktop\\360digiTMG assignment\\Association rule\\myphonedata.csv")

#Picking up the columns for analysis

data <- data[4:9]
class(data)

colnames(data)

data$red <- factor(data$red,levels = c("1","0"),labels = c("ChildBks",""))
data$white <- factor(data$white,levels = c("1","0"),labels = c("white",""))
data$green <- factor(data$green,levels = c("1","0"),labels = c("green",""))
data$yellow <- factor(data$yellow,levels = c("1","0"),labels = c("yellow",""))
data$orange <- factor(data$orange,levels = c("1","0"),labels = c("orange",""))
data$blue <- factor(data$blue,levels = c("1","0"),labels = c("blue",""))

data1 <- as(data,"transactions")

itemFrequencyPlot(data1,topN=15)

plot(rules)

rules <- apriori(data1, parameter = list(supp = 0.005, confidence = 0.50, minlen = 2, maxlen = 4))

inspect(head(sort(rules), n = 10))
plot(head(sort(rules, by = "lift"), n = 10), method = "graph", control = list(cex = 1.0)) #cex = font size

plot(head(sort(rules), n = 10), method = "grouped", control = list(cex = 0.8))

write(rules, file = "mob.csv", sep = ",")

getwd()

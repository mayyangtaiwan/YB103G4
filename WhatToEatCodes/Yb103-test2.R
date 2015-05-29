ingre= read.csv('icook_Love.txt', header = F, sep=",")
# Read in the data
x <- scan("data.txt", what="", sep="\n")
# Separate elements by one or more whitepace
y <- strsplit(x, "[[:space:]]+")
# Extract the first vector element and set it as the list element name
names(y) <- sapply(y, `[[`, 1)
#names(y) <- sapply(y, function(x) x[[1]]) # same as above
# Remove the first vector element from each list element
y <- lapply(y, `[`, -1)
#y <- lapply(y, function(x) x[-1]) # same as above

data <- read.csv("ingredients_copy.txt",header=F,sep = ",")
data <-  data[!duplicated(data),]
pop <- NULL
for(i in 1:length(data)){
  pop <- paste(pop, data[i],sep="\n")
}
write(pop, file = "Trans", sep = ",")
transdata <- read.transactions("Trans", format = "basket", sep=",", rm.duplicates=TRUE)

itemFrequencyPlot(transdata)
plot(itemFrequency(transdata))
filter_trains = transdata[size(transdata) >=3]
inspect(filter_trains)
summary(transdata)
inspect(transdata)

itemFrequencyPlot(transdata, support = 0.1, cex.names=0.8,topN=5)
rules = apriori(transdata, parameter = list(supp = 0.001, conf =0.5, target= "rules"))
summary(rules)
inspect(head(rules))
rules=sort(rules, by="confidence", decreasing=TRUE)
head(interestMeasure(rules, c("support", "chiSquare", "confidence","conviction","cosine", "coverage", "leverage", "lift","oddsRatio"),Groceries))

rules.sorted = sort(rules, by="lift")
subset.matrix = is.subset(rules.sorted, rules.sorted)
subset.matrix[lower.tri(subset.matrix, diag=T)] = NA
redundant = colSums(subset.matrix, na.rm=T) >= 1
rules.pruned = rules.sorted[!redundant]
inspect(head(rules.pruned))

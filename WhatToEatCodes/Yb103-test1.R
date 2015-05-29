library(arules)
par(family="Hannotate TC")
ingre= scan('ingredientsALL_ver1.txt', what="character", sep="\n")
ingreList = strsplit(ingre, ",")
names(ingreList) = sapply(ingreList, function(x) x[[1]])
ingreList1 = lapply(ingreList, function(x) x[-1])
ingreList2 = lapply(ingreList1, function(e) {e[which(1:length(e)%%3 == 1)]})
#ingreList2
ingreList3 = lapply(ingreList2, unique)
#str(ingreList3)
trans = as(ingreList3, "transactions")
trans

itemFrequencyPlot(trans)
plot(itemFrequency(trans))
filter_trains = trans[size(trans) >=3]
#inspect(filter_trains)
#summary(trans)
#inspect(trans)



itemFrequencyPlot(trans, support = 0.01, cex.names=0.8,topN=30, main="楊桃網")
#rules=eclat(trans,parameter=list(support=0.001,maxlen=10))
rules = apriori(trans, parameter = list(supp = 0.01, conf =0.5, target= "rules"))
write(rules, file = "data.csv", quote=TRUE, sep = ",", col.names = NA)
summary(rules)
inspect(head(rules))
rules=sort(rules, by="confidence", decreasing=TRUE)
plot(rules)
inspect(head(rules))
inspect(head(rules, 100))
head(interestMeasure(rules, c("support", "chiSquare", "confidence","conviction","cosine", "coverage", "leverage", "lift","oddsRatio"),trans))

rules.sorted = sort(rules, by="lift")
subset.matrix = is.subset(rules.sorted, rules.sorted)
subset.matrix[lower.tri(subset.matrix, diag=T)] = NA
redundant = colSums(subset.matrix, na.rm=T) >= 1
rules.pruned = rules.sorted[!redundant]
inspect(head(rules.pruned))

library(arulesViz)
plot(rules.pruned)
plot(rules.pruned, shading="order", control=list(jitter=6))
soda_rule=apriori(data=trans, parameter=list(supp=0.001,conf= 0.1, minlen=2), appearance = list(default="rhs",lhs="蝦米"))
plot(sort(soda_rule, by="lift"), method="graph",control=list(type="items"), main="蝦米")
plot(soda_rule, method="grouped")


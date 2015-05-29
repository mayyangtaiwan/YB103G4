library(arules)
library(arulesViz)
par(family="STKaiti")
#quartz(family="STKaiti")
ingre= scan('YTower_ingregients_edited_v3.txt', what="character", sep="\n")
ingreList = strsplit(ingre, ",")
names(ingreList) = sapply(ingreList, function(x) x[[1]])
ingreList1 = lapply(ingreList, function(x) x[-1])
ingreList2 = lapply(ingreList1, function(e) {e[which(1:length(e)%%3 == 1)]})
#ingreList2
ingreList3 = lapply(ingreList2, unique)
#str(ingreList3)
trans = as(ingreList3, "transactions")
LIST(trans)
x = LIST(trans, decode=F)
#summary(trans)
#inspect(trans)
#rules = apriori(trans, parameter = list(supp = 0.01, conf =0.5, target= "rules"))
#write(rules, file = "data.csv", quote=F, sep = ",", col.names = F, row.names=F)
#plot(sort(rules, by="lift"), method="graph",control=list(type="itemsets", measureLabels=T),interactive=TRUE)

#itemFrequencyPlot(trans, support = 0.01, cex.names=0.8,topN=10, main="楊桃網")

ingre_rule=apriori(data=trans, parameter=list(supp=0.001,conf= 0.01, minlen=2), appearance = list(default="rhs",lhs="醬油"))
plot(sort(ingre_rule, by="lift"), method="graph",
     control=list(type="items", measureLabels=T),interactive=TRUE)
plot(ingre_rule, method="grouped",interactive=TRUE)

#=====================#
source("http://bioconductor.org/biocLite.R")
biocLite()
biocLite("graphviz")


rules.sorted = sort(rules, by="lift")
subset.matrix = is.subset(rules.sorted, rules.sorted)
subset.matrix[lower.tri(subset.matrix, diag=T)] = NA
redundant = colSums(subset.matrix, na.rm=T) >= 1
rules.pruned = rules.sorted[!redundant]
#inspect(head(rules.pruned))

rules = apriori(trans, parameter = list(supp = 0.01, conf =0.5, target= "rules"))
library(arulesViz)
## Scatterplot
#plot(rules)
## try: sel <- plot(rules, interactive=TRUE)

## Scatterplot with custom colors
library(colorspace) # for sequential_hcl
plot(rules, control=list(col=sequential_hcl(n=100)))

## Two-key plot is a scatterplot with shading = "order"
plot(rules, shading="lift", control=list(main = "Two-key plot", cex=0.3,
                                          col=rainbow(3)))

## The following techniques work better with fewer rules
subrules <- subset(rules, lift>2.5)
subrules

## 2D matrix with shading
plot(subrules, method="matrix", measure="lift")
plot(subrules, method="matrix", measure="lift", control=list(reorder=TRUE))

## 3D matrix
plot(subrules, method="matrix3D", measure="lift")
plot(subrules, method="matrix3D", measure="lift", control=list(reorder=TRUE))

## matrix with two measures
plot(subrules, method="matrix", measure=c("lift", "confidence"))
plot(subrules, method="matrix", measure=c("lift", "confidence"), 
     control=list(reorder=TRUE))

## try: plot(subrules, method="matrix", measure="lift", interactive=TRUE, 
##		control=list(reorder=TRUE))

## grouped matrix plot
plot(rules, method="grouped")
## try: sel <- plot(rules, method="grouped", interactive=TRUE)

## graphs only work with very few rules
subrules2 <- sample(rules, 10)
plot(subrules2, method="graph")
plot(subrules2, method="graph", control=list(type="itemsets"))
## try: plot(subrules2, method="graph", interactive=TRUE)
## try: plot(subrules2, method="graph", control=list(engine="graphviz"))


## parallel coordinates plot
plot(subrules2, method="paracoord")
plot(subrules2, method="paracoord", control=list(reorder=TRUE))

## Doubledecker plot only works for a single rule
oneRule <- sample(rules, 1)
plot(oneRule, method="doubledecker", data = Groceries)

## use iplots (experimental)
## try: sel <- plot(rules, method="iplots", interactive=TRUE)


## for itemsets
itemsets <- eclat(Groceries, parameter = list(support = 0.02, minlen=2))
plot(itemsets)
plot(itemsets, method="paracoord", control=list(alpha=.5, reorder=TRUE))
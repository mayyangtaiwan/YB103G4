library(arules)
library(arulesViz)
library(dplyr)
library(colorspace)
library(RColorBrewer)
#All1= read.csv('Ingres_All.csv', header =F, strip.white=TRUE, sep=',')
#All2 = read.csv("tagsAll-Name.csv",header =F, strip.white=TRUE, sep=',')
#轉型join
#All1[,2] = as.character(All1[,2])
#All2[,2] = as.character(All2[,2])
#All= inner_join(All1, All2, by = c('V2'='V2'))
#配對回主類別
All[,3] = sub("([[:alpha:]]{1}[[:digit:]]+)", "", All[,3])
#filter調味料和其他
ALL = All %>% filter(V1.y!="K")%>% filter(V1.y!="L")
write.table(ALL,'ALL_forApriori.txt', sep=',', quote=F, row.names=F, col.names=F)

ALL = read.csv("ALL_forApriori.txt",header =F, strip.white=TRUE, sep=',')
#生成lists
bll = tapply(ALL[,2], ALL[,1], paste)
#filter null lists
Bll = Filter(Negate(is.null), bll)
#filter dup lists
ingreList = lapply(Bll, unique)
trans = as(ingreList, "transactions")
#write(trans,"trans.txt") 
#-----------
#trans = scan("trans.txt", what="character", sep="\n")
#inspect(trans)
par(family="Hannotate TC")
itemFrequencyPlot(trans, support = 0.001, cex.names=1.2,topN=12, main="食材出現頻率",col=heat.colors(12))
#Apriori rules - STRONG rules- visulization用-1-以麵粉雞蛋乃為主 沒有意外的rules
#"hyperedgesets", "rules", "closed frequent itemsets", "maximally frequent itemsets", "frequent itemsets"
rules = apriori(trans, parameter = list(supp = 0.001, conf =0.5, target= "rules"))

summary(rules)
inspect(rules)
#prun redundant rules
rules.sorted = sort(rules, by="lift")
subset.matrix = is.subset(rules.sorted, rules.sorted)
subset.matrix[lower.tri(subset.matrix, diag=T)] = NA
redundant = colSums(subset.matrix, na.rm=T) >= 1
rules.pruned = rules.sorted[!redundant]
#inspect(rules.pruned)
plot(sort(rules.pruned, by="lift"), method="graph",control=list(type="itemsets", measureLabels=T),interactive=TRUE)
plot(sort(rules.pruned, by="lift"), method="graph",control=list(type="items", measureLabels=T),interactive=TRUE)
plot(rules.pruned, method="grouped",interactive=TRUE)

#============================================================
#Apriori rules - STRONG rules- visulization用-2-降低minsup門檻 mine interesting rules
rules = apriori(trans, parameter = list(supp = 0.001, conf =0.5, target= "rules"))
summary(rules) #459
inspect(rules)
#prun redundant rules 
rules.sorted = sort(rules, by="lift")
subset.matrix = is.subset(rules.sorted, rules.sorted)
subset.matrix[lower.tri(subset.matrix, diag=T)] = NA
redundant = colSums(subset.matrix, na.rm=T) >= 1
rules.pruned = rules.sorted[!redundant]
#inspect(rules.pruned) #309
plot(sort(rules.pruned, by="lift"), method="graph",control=list(type="itemsets", measureLabels=T),interactive=TRUE)
plot(sort(rules.pruned, by="lift"), method="graph",control=list(type="items", measureLabels=T),interactive=TRUE)
plot(rules.pruned, method="grouped",interactive=TRUE)

## Scatterplot
plot(rules.pruned, control=list(col=brewer.pal(9,"Spectral"), main = "Two-key plot", cex=0.5, jitter =2))

## The following techniques work better with fewer rules
subrules <- subset(rules.pruned, lift>2.5)
subrules

## 2D matrix with shading
plot(rules.pruned, method="matrix", measure="lift")
plot(rules.pruned, method="matrix", measure="lift", control=list(reorder=TRUE, col=brewer.pal(9,"Spectral")))

## 3D matrix
plot(rules.pruned, method="matrix3D", measure="lift")
plot(rules.pruned, method="matrix3D", measure="lift", control=list(reorder=TRUE, col=brewer.pal(9,"Spectral")))

## matrix with two measures
plot(rules.pruned, method="matrix", measure=c("lift", "confidence"))
plot(rules.pruned, method="matrix", measure=c("lift", "confidence"), 
     control=list(reorder=TRUE))


## parallel coordinates plot, only work with very few rules
plot(rules.pruned, method="paracoord")
plot(rules.pruned, method="paracoord", control=list(reorder=TRUE))


## for itemsets
itemsets <- eclat(trans, parameter = list(support = 0.02, minlen=2))
plot(itemsets,interactive=TRUE)
plot(itemsets, method="paracoord", control=list(alpha=.5, reorder=TRUE))
#============================================================
ingre_rule=apriori(rules.pruned, parameter=list(supp=0.01,conf= 0.01, minlen=2), appearance = list(default="rhs",lhs="低筋麵粉"))
plot(sort(ingre_rule, by="lift"), method="graph", control=list(type="items", measureLabels=T),interactive=TRUE)
plot(ingre_rule, method="grouped",interactive=TRUE)
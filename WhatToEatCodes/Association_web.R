library(arules)
library(arulesViz)
library(dplyr)
ALL = read.csv("ALL_forApriori.txt",header =F, strip.white=TRUE, sep=',')
#生成lists
bll = tapply(ALL[,2], ALL[,1], paste)
#filter null lists
Bll = Filter(Negate(is.null), bll)
#filter dup lists
ingreList = lapply(Bll, unique)
trans = as(ingreList, "transactions")

#Apriori rules by lift - 2086條 - 網站用 - no 修剪
ingre_rule=
  apriori(data=trans, 
          parameter=list(supp=0.001,conf= 0.1, minlen=2), 
          appearance = list(default="both"))

summary(ingre_rule)
head(interestMeasure(ingre_rule, c("support","confidence", "lift","chiSquare","cosine", "oddsRatio"),trans))

rules123=sort(ingre_rule, by="lift", decreasing=TRUE)
dfrules123 = as(rules123, "data.frame")[,1]
write.table(dfrules123,"apriori_lift.txt", sep=",", quote=F, row.names= F)


#inspect(ingre_rule)
#Apriori rules by confidence - -
#rules123=sort(ingre_rule, by="confidence", decreasing=TRUE)
#write(rules," .txt") 全部寫入用
#dfrules123 = as(rules123, "data.frame")[,1]
#write.table(dfrules123,"apriori_confi.txt", sep=",", quote=F, row.names= F)
#轉成df用
#fff = as(ingre_rule, "data.frame")[,1]
#write.table(fff, "apriori.txt", sep=",", quote=F, row.names= F)


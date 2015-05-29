library(dplyr)
Qoo = read.table("ingre_dups.txt",sep=",")
Qoo$V3 = as.integer(as.character(Qoo$V3))
Qoo$V4 = as.integer(as.character(Qoo$V4))
Qxx = 
  Qoo %>% 
  group_by(V1) %>% 
  summarise(PerGramMean = mean(V5, na.rm = T))
write.table(Qxx, "ingre_no_dups2.txt",sep=",",quote = F, row.names = F,col.names = F)
Qyy =
  select(Qoo, V1, V6) %>% 
  filter(V6 != '') %>% 
  distinct(V1,V6)

write.table(Qyy, "ingre_units.txt",sep=",",quote = F, row.names = F,
            col.names = F)

#==========================

Qoo1 = read.csv("ingre_no_dups2.txt",sep="," , header =F)
Qoo2 = read.csv("ingre_no_dups1.txt",sep="," , header =F)

QQQ = rbind(Qoo1, Qoo2)
write.table(QQQ, "IngreCal.txt",quote = F, ,sep=",", row.names = F)

#==========================
aa = read.csv("tagsAll-Name.csv",sep=",", header =F)
bb = read.csv("IngreCal.txt",sep="," ,header =F)
head(cc)
cc = left_join(aa, bb, by = c('V1'='V1'))
write.csv(cc[,c(1,3)], "IngreCalJoin.csv",quote = F, row.names = F)  
write.csv(cc, "IngreCalAll.csv",quote = F, row.names = F)  
#==========================
#calplot
library(dplyr)
library(ggplot2)
calall= read.csv("IngreCalJoin.csv",sep=",", header =F)
calall = calall[-1,] 
calall = calall[-1,] 
str(calall)
calF= filter(calall, V2 != '') 
calF[,1] = sub("(K[[:digit:]]+)", "", calF[,1])
CalO= calF[order(calF[,1]),]
Cal1= filter(CalO, V1 != 'LA')
Cal1= filter(Cal1, V1 != 'KA')
Cal1$V2 = as.numeric(as.character(Cal1$V2))
qplot(Cal1$V2, Cal1$V1, xlab = 'Ingre Cal', ylab= 'Main Ingre Cat', colour=Cal1$V1)

#==========================

aa = tapply(Qxx[,4], Qxx[,1], function(x) paste(x,collapse=","))
bb = tapply(Qyy[,2], Qyy[,1], function(x) paste(x,collapse=","))
aaa = melt(aa)
bbb = melt(bb)
merge(bbb, Qxx, by.x = by, by.y = by, all = T)

write.table(inner_join(Qxx, Qyy), "joined.txt",sep=",",quote = F, row.names = F,
            col.names = F)

a = read.table("joined.txt",sep=",")
b = tapply(a[,5], a[,1:4], paste)
a$tf = sapply(a[,1], function(e){b[e]})
==========================
a = read.table(text=' a b
1 c
1 d
2 c
2 a
2 b
3 a
', head=T)

b = read.table(text=' a c
1 x i
2 y j
3 z k
', head=T)
mapply(FUN = c, 
       lapply(split(b, row.names(b)), function(x) as.character(unlist(x, use.names = FALSE))), 
       split(as.character(a$b), a$a), 
       SIMPLIFY = FALSE)

library(reshape2)
apply(cbind(b, dcast(a, a~b)[, -1]), 1, function(x) unname(x[!is.na(x)]))
aa = tapply(a[,2], a[,1], function(x) paste(x,collapse=","))
bb = tapply(b[,1:2], b[,1], function(x) paste(x,collapse=","))
aaa = melt(aa)
bbb = melt(bb)
merge(bbb, aaa, by= "indices")

a$tf = sapply(a[,1], function(e){aa[e]})

str(c)
library(reshape)
merge(melt(c), a, by.x = by, by.y = by)


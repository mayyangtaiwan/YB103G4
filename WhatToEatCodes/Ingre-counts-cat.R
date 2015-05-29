library(dplyr)
Qoo1 = read.csv("Ingre-counts.csv",sep=",", header =F)
Qoo2 = read.csv("tagsAll-Name.csv",sep="," ,header =F)
Qoo1=Qoo1[,1:2]

Qoo1[,1] = as.character(Qoo1[,1])
Qoo2[,2] = as.character(Qoo2[,2])

Qoo2[,1] = sub("([[:alpha:]]{1}[[:digit:]]+)", "", Qoo2[,1])
Qoo = inner_join(Qoo1, Qoo2, by = c('V1'='V2'))
str(Qoo)
x = read.table(text = "A  牛肉
               B	豬肉
               C	雞肉
               D	羊
               E	其他肉類
               F	海鮮類
               G	蔬菜類
               H	蛋_豆_奶_豆製品類
               I	海菜菇蕈中藥
               J	澱粉
               K	調味料
               L	其他")
Qo = inner_join(Qoo, x, by = c('V1.y'='V1'))
str(Qo)
write.csv(Qo[,c(4,3,1,2)], "ingre-counts-with-cat.csv", quote=F)
Q= 
Qo %>%
  filter(V1.y != 'K') %>% filter(V1.y != "L")


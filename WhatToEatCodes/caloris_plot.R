#calplot
library(dplyr)
library(ggplot2)
calall= read.csv("ingre_cal.csv",sep=",", header =F)
str(calall)
calF= filter(calall, V2 != '') 
calF[,1] = sub("([[:digit:]]+)", "", calF[,1])
CalO= calF[order(calF[,1]),]
Cal1= filter(CalO, V1 != 'LA')
Cal1= filter(Cal1, V1 != 'KA')
Cal1$V2 = as.numeric(as.character(Cal1$V2))
qplot(Cal1$V2, Cal1$V1, xlab = 'Ingre Cal/g', ylab= 'Sub Ingre Cat', colour=Cal1$V1)+theme(legend.position="none")

ggpairs(Cal1,legends = T)
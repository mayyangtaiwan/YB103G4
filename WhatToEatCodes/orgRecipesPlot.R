library(dplyr)
library(ggplot2)
library('RColorBrewer')
srcs = read.table(head=T, text ="食譜 原始數量  使用數量
楊桃網  20753  20562 
愛料理  53948  35922
多多開火	27180  0
三立型男大主廚	2602  0
三立美食鳳味	1322  0
全聯食譜	859  0
中視我的美食DIY	2114  0
自由時報週末生活	2959  0
cook1cook	10008  0
心食譜	25000  0
菲姐	363  0") 
str(srcs)
sum(srcs[,2])#147108
qplot(srcs$原始數量,srcs$食譜, colour=srcs$食譜)+theme(text=element_text(family="Hannotate TC",size=10))
ggplot(data=srcs, aes(x=srcs$食譜, y=srcs$原始數量, fill=srcs$食譜))+
  geom_bar(stat="identity") +
  geom_point(data=srcs, aes(x=srcs$食譜, y=srcs$使用數量,size = srcs$使用數量))+
  theme(text=element_text(family="Hannotate TC",size=10),
        axis.text.x = element_text(colour="grey20",size=18,angle=60,hjust=.5,vjust=.5,face="plain"),
        axis.text.y = element_text(colour="grey20",size=12,angle=0,hjust=1,vjust=0,face="plain"))+
  guides(fill=FALSE) +xlab("食譜來源") + ylab("食譜數量") +ggtitle("原始食譜資料147108筆")+
  geom_text(aes(label=srcs$原始數量, vjust=-.1))
  
qplot(srcs$原始數量, srcs$食譜, data=srcs, geom="line")+
  theme(text=element_text(family="Hannotate TC",size=10),
        axis.text.x = element_text(colour="grey20",size=10,angle=45,hjust=.5,vjust=.5,face="plain"),
        axis.text.y = element_text(colour="grey20",size=15,angle=0,hjust=1,vjust=0,face="plain"))

grid(nx=NA,ny=NULL,lty=1,lwd=1,col="gray")
ggplot(data=srcs, aes(x="", y=srcs$原始數量, fill=srcs$食譜)) +
  geom_bar(colour="black", stat="identity")+
  theme(text=element_text(family="Hannotate TC",size=10),axis.text.x = element_text(angle=90, vjust=1)) )+
  ggtitle("原始食譜資料147108筆")+ 
  coord_polar(theta="y")


srcs[1]
par(family="Hannotate TC")
par(mai=c(1,2.5,1,1))
barplot(srcs$原始數量,names.arg = srcs$食譜,col= heat.colors(20), horiz=TRUE, las=1)

par(family="Hannotate TC")
par(mai=c(1,2.5,1,1))
srcs<-srcs[order(srcs[,2]),]
pielabels <- sprintf("%s = %3.1f%s", srcs[,1],
                     100*srcs[,2]/sum(srcs[,2]), "%")
pie(srcs[,2],
    labels=NA,
    clockwise=TRUE,
    col=brewer.pal(12,"Paired"),
    border="white",
    radius=1,
    cex=0.9,
    main="食譜數量百分比圖")


legend("bottomleft",legend=pielabels,bty="n",adj = c(0, 0.1),
      fill=brewer.pal(12,"Paired"))


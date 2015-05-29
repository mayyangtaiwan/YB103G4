library(dplyr)
library(ggplot2)
library(plot3D)
library(RColorBrewer)
library(rgl)
ingreCounts = read.csv("Ingre-counts.csv", sep = ",", header=F)
ingreCal = read.csv("Ingre-cal.csv", sep = ",")
ingreCal= ingreCal[,c(1,2,3,4,5)]

ingreCounts[,1] = as.character(ingreCounts[,1])
ingreCal[,2] = as.character(ingreCal[,2])
ingreCal[,3] = as.numeric(ingreCal[,3])
ingreCal[,4] = as.numeric(ingreCal[,4])
Qoo = right_join(ingreCounts, ingreCal, by = c('V1'='IngreName'))

Qoo[,6] = substring(Qoo$IngreSubCatNo, 1, 1)
write.csv(Qoo, "forplot.csv", quote=F)

SeaFood= Qoo %>% filter(IngreSubCatNo == 'F')
par(family='Hannotate TC')
plot3d(x =SeaFood$V2 , y = SeaFood$IngreCal, z =SeaFood$IngreSeason,
       type = "s", radius=1.025,
       xlab = "Frequency", ylab = "Calories",zlab ="Seasons",
       box = FALSE)
text3d(x =SeaFood$V2 , y = SeaFood$IngreCal, z =SeaFood$IngreSeason,
       col = as.factor(SeaFood$IngreSeason),
       text=SeaFood$V1)

par(family='Hannotate TC')
text3D(x =SeaFood$V2 , y = SeaFood$IngreCal, z =SeaFood$IngreSeason,
       phi = 20, ticktype = "detailed",
       colvar = SeaFood$IngreSeason,col=brewer.pal(6,"Dark2"),theta = 30, d = 6, 
       labels= SeaFood$V1, pch = 2, cex = 0.8, 
       xlab = "Frequency", ylab = "Calories",zlab = "Seasons",colkey = FALSE)

Veg= Qoo %>% filter(IngreSubCatNo == 'G')
par(family='Hannotate TC')
plot3d(x =Veg$V2 , y = Veg$IngreCal, z =Veg$IngreSeason,
       type = "s", radius=1.025,
       xlab = "Frequency", ylab = "Calories",zlab ="Seasons",
       box = FALSE)
text3d(x =Veg$V2 , y = Veg$IngreCal, z =Veg$IngreSeason,
       col = as.factor(Veg$IngreSeason),
       text=Veg$V1)

par(family='Hannotate TC')
text3D(x =Veg$V2 , y = Veg$IngreCal, z =Veg$IngreSeason,
       phi = 20, ticktype = "detailed",
       colvar = Veg$IngreSeason,col=brewer.pal(6,"Dark2"),theta = 30, d = 6, 
       labels= Veg$V1, pch = 2, cex = 0.8, 
       xlab = "Frequency", ylab = "Calories",zlab = "Seasons",colkey = FALSE)
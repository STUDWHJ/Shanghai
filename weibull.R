library(R0)
library("MASS")
library(readxl)

df=read_excel("F:/Desktap/1.xlsx")
head(data)
data.frame(df)

df$data=as.character(df$data)#修改数据集格式
y=df$number
attr(y,"names")=df$data
str(y)
check.incid(y)
plot(y)

mGT <- generation.time("weibull", c(4.87,0.65))
TD <- estimate.R(y, mGT, begin=1, end=122, methods="TD", nsim=100)
TD
plot(TD)
TD$estimates$TD$Rt.quant
TD.weekly <- smooth.Rt(TD$estimates$TD,1)
a<-TD.weekly$R
a
plot(TD.weekly)
str(TD.weekly$R)
write.csv(a,file="F:/Desktap/weia.csv",quote=F,row.names = F)


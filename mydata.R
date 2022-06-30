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

est.GT(serial.interval=y)
GT.flu<-generation.time("gamma", c(4.87,0.65))  
mGT<-generation.time("gamma", c(4.87,0.65))
estR0<-estimate.R(y, mGT, begin=1, end=73, methods=c("EG", "ML", "TD", "SB"), 
                  pop.size=100000, nsim=1000)


plotfit(estR0)
print(estR0)
plot(estR0)




A<-estR0$estimates$TD$R
B<-estR0$estimates$SB$R
write.csv(A,"F:/Desktap/2222.xlsx")
write.csv(B,"F:/Desktap/22222.xlsx")

 
 
mGT <- generation.time("gamma", c(4.87,0.65))
TD <- estimate.R(y, mGT, begin=1, end=92, methods="TD", nsim=100)
TD
plot(TD)
TD$estimates$TD$Rt.quant
TD.weekly <- smooth.Rt(TD$estimates$TD,7)
a<-TD.weekly$R
a
plot(TD.weekly)
str(TD.weekly$R)
write.csv(a,file="F:/Desktap/a.csv",quote=F,row.names = F)

mGT <- generation.time("lognormal", c(7,2))
SB <-est.R0.SB(y, mGT,begin=1, end=92)
SB
SB$Rt.quant
plot(SB)
SB.weekly <- smooth.Rt(SB$estimates$SB, 1)
SB.weekly
b<-SB.weekly$R
b
write.csv(b,file="F:/Desktap/b.csv",quote=F,row.names = F)




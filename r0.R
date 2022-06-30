library(R0)
library("MASS")
data(Germany.1918) 
data.frame(Germany.1918)
mGT <- generation.time("gamma", c(3,1.5))#Q求TD
TD <- estimate.R(Germany.1918, mGT, begin=1, end=126, methods="TD", nsim=1000)
TD
plot(mGT)

TD.weekly <- smooth.Rt(TD$estimates$TD, 7)#7天rt值估计
TD.weekly

est.GT(serial.interval=Germany.1918)#时间序列求GT
mGT<-generation.time("gamma", c(3, 1.5))#求不同方法的estr0
estR0<-estimate.R(Germany.1918, mGT, begin=1, end=27, methods=c("EG", "ML", "TD", "AR", "SB"), 
                  pop.size=100000, nsim=1000)
estR0


data(Germany.1918)
tmp<-sa.GT(incid=Germany.1918, GT.type="gamma", GT.mean=seq(1,5,1), GT.sd.range=1, begin=1, end=27,
           est.method="EG")


est.R0.EG(Germany.1918, mGT, begin=1, end=27)
est.R0.ML(Germany.1918, mGT, begin=1, end=27, range=c(0.01,50))
est.R0.TD(Germany.1918, mGT, begin=1, end=126, nsim=100)

plotfit.R0.R(estR0)
tmp<-sa.GT(incid=Germany.1918, GT.type="gamma", GT.mean=seq(4.87,0.65), GT.sd.range=1, begin=1, end=27,
           est.method="EG")
tmp
plot(sen, what=c("criterion","heatmap"))
data(Germany.1918)
mGT<-generation.time("gamma", c(2.6,1))
sen=sa.time(Germany.1918, mGT, begin=1:15, end=16:30, est.method="EG")
plot(sen, what=c("criterion","heatmap"))
end

sim.epid(epid.nb=100, GT=generation.time("gamma",c(3,1.5)), R0=1.5, 
         epid.length=30, family="poisson", peak.value=150)





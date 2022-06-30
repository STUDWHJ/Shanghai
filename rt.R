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

mGT <- generation.time("gamma", c(4.87,0.65))#6阶段
TD <- estimate.R(y, mGT, begin=1, end=41, methods="TD", nsim=100)
TD
plot(TD)

mGT <- generation.time("gamma", c(4.87,0.65))
TD <- estimate.R(y, mGT, begin=42, end=59, methods="TD", nsim=100)
TD
plot(TD)

mGT <- generation.time("gamma", c(4.87,0.65))
TD <- estimate.R(y, mGT, begin=60, end=67, methods="TD", nsim=100)
TD
plot(TD)

mGT <- generation.time("gamma", c(4.87,0.65))
TD <- estimate.R(y, mGT, begin=68, end=76, methods="TD", nsim=100)
TD
plot(TD)

mGT <- generation.time("gamma", c(4.87,0.65))
TD <- estimate.R(y, mGT, begin=77, end=91, methods="TD", nsim=100)
TD
plot(TD)

mGT <- generation.time("gamma", c(4.87,0.65))
TD <- estimate.R(y, mGT, begin=92, end=122, methods="TD", nsim=100)
TD
plot(TD)

#3阶段

mGT <- generation.time("gamma", c(4.87,0.65))
TD <- estimate.R(y, mGT, begin=1, end=59, methods="TD", nsim=100)
TD
plot(TD)

mGT <- generation.time("gamma", c(4.87,0.65))
TD <- estimate.R(y, mGT, begin=60, end=76, methods="TD", nsim=100)
TD
plot(TD)

mGT <- generation.time("gamma", c(4.87,0.65))
TD <- estimate.R(y, mGT, begin=77, end=122, methods="TD", nsim=100)
TD
plot(TD)

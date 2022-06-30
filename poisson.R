library(AER)
library("readxl")
df<-read_excel("F:/Desktap/222.xlsx")
df
poisson_fit <- glm(formula = number ~ r, family = poisson,
                   data = df)

summary(poisson_fit)
coef(poisson_fit)
plot(poisson_fit)

deviance(poisson_fit)/df.residual(poisson_fit)
library(qcc)
qcc.overdispersion.test(df$number,type="poisson")
# p小于 0.05,表明确实存在过度离势,family选择quasipoisson
poisson_fit2 <- glm(formula = number ~ r, family = quasipoisson(),data = df)

summary(poisson_fit2)

poisson_fit3 <- glm(formula = number ~ r, 
                    family = quasipoisson,data = df)

summary(poisson_fit3)
anova(poisson_fit3)

poisson_fit3$fitted.values
new_data <-data.frame(age = mean(Affairs$age),
                      yearsmarried = mean(Affairs$yearsmarried),
                      religiousness = mean(Affairs$religiousness),
                      rating=seq(1:5))
#?predict.glm
pred_value <- predict(poisson_fit3,df,type='response')
pred_value

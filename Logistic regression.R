setwd("D:\\SLIIT\\3rd year 2nd sem\\Fundamentals of Data Mining\\Lectures")
df = read.table("leukemia_remission.txt",header = TRUE)
df

#Modelling
model1 = glm(REMISS~LI,data=df,family="binomial")
summary(model1)
confint(model1)

model11 = glm(REMISS~LI+TEMP,data=df,family="binomial")
summary(model11)

#Odds ratio
coef(model1)
exp(coef(model1))
exp(coef(model11))

#Full model
model2 = glm(REMISS~.,data=df,family="binomial")
summary(model2)
confint(model2)
exp(coef(model2))

#Null model
model3 = glm(REMISS~1,data=df,family="binomial")
summary(model3)

#Coefficient of determination
ln = logLik(model3)
ls = logLik(model2)
lm = logLik(model1)
R_Square = (ln - lm) / (ln - ls)
R_Square

#Hosmer-Lemeshow Test
install.packages("ResourceSelection")
library(ResourceSelection)
fitted(model1)
hoslem.test(df$REMISS, fitted(model1))
library(MASS)

setwd("D:\\SLIIT\\3rd year 2nd sem\\Fundamentals of Data Mining\\Lectures")
df = read.csv("iris.csv")
head(df)

set.seed(2222)
trainID = sample(1:nrow(df),0.8*nrow(df))

train = df[trainID,]
test = df[-trainID,]

fit = lda(Species~.,data=train)
fit

y_pred = predict(fit,test)
y_actual = test$Species
conf = table(y_actual,y_pred$class)
conf

sum(diag(conf)) / sum(conf) * 100

fit = qda(Species~.,data=train)
fit

y_pred = predict(fit,test)
y_actual = test$Species
conf = table(y_actual,pred$class)
conf
sum(diag(conf)) / sum(conf) * 100
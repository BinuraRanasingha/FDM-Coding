setwd("D:\\SLIIT\\3rd year 2nd sem\\Fundamentals of Data Mining\\Lectures")
df = read.csv("Obese.csv")
head(df)

#Removing ID column since ID is not a variable
df$ID = NULL
head(df)

#Making dummy variables for the categorical data
summary(df)
str(df)
df$Gender = factor(df$Gender)
df$Area = factor(df$Area)
df$Martial = factor(df$Martial)
df$Employ = factor(df$Marital)
df$Obese = factor(df$Obese)
str(df)
contrasts(df$Gender)

#Fitting logistic regression
fit = glm(Obese~.,data=df,family="binomial")
summary(fit)

#Checking the model accuracy in predictions
set.seed(2222)
trainID = sample(1:nrow(df),round(0.8*nrow(df)))

train = df[trainID,]
test = df[-trainID,]

fit = glm(Obese~.,data=train,family="binomial")
summary(fit)

y_pred_prob = predict(fit,test,type="response")
y_pred_prob

y_pred = ifelse(y_pred_prob >= 0.5, "Yes", "No")
y_actual=test$Obese
conf=table(y_actual,y_pred)
conf

sum(diag(conf)) / sum(conf) * 100
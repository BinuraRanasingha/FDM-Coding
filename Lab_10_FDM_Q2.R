# Import the Boston inbuilt dataset to the R environment
install.packages("MASS")
library(MASS)
data("Boston")
head(Boston)
summary(Boston)
str(Boston)

#Fit a simple linear regression model for the response variable medv using lstat 
#independent varaiable and save as fit1
fit1 = lm(medv~lstat,data=Boston)
summary(fit1)

# Fit a multiple linear regression model for the response variable medv usinglstat 
#& black independent varaiables and save as fit2
fit2 = lm(medv~lstat + black,data=Boston)
summary(fit2)

#Fit a multiple linear regression model for the response variable medv using all 
#other independent variables and save as fit3
fit3 = lm(medv~.,data=Boston)
summary(fit3)

#Fit a multiple linear regression model for the response variable medv using
#all other independent variables except indus variable and save as fit4.
fit4 = lm(medv~.-indus,data=Boston)
summary(fit4)

# Consider the fit3 and get the following charts
#a. Residuals VS Fitted Value - shows if have non-linear patterns
#b. Normality plot of Standard Residuals - residuals are normally distributed
#c. Standardized Residuals VS Fitted Value - shows if residuals equally along the range of predictors
#d. Residuals VS Leverage - to find outliers

par(mfrow=c(2,2))
plot(fit3)

#Check the Variance Inflation Factor (VIF) and discuss the multicollinearity
#among the independent variables
install.packages("car")
library(car)
vif(fit3)

#if vif > 10 then it acts as dependent variable for some independent variable

#Split the data into train & test such that 80% will be the training data.
trainID = sample(1:nrow(Boston),round(0.8*nrow(Boston)))
train=Boston[trainID,]
test=Boston[-trainID,]

#a. Fit the full model to the train data and discuss the significance of variables.
fit=lm(medv~.,data=train)
summary(fit)
#b. Get the predictions to the test data.
y_pred = predict(fit,test)
y_actual = test$medv
#c. Find the Mean Squared Error and then find the Root Mean Squared Error
MSE = mean((y_actual-y_pred)^2)
MSE

RMSE = sqrt(MSE)
RMSE
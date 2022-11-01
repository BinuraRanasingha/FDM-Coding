#One proportion z test Assume that out of 100 patients 60 patients are Covid positive in one 
#group. H1: P(Positive)>0.5 H0: P(Positive)=0.5
prop.test(x = 60,n=100,p=0.5,alternative = "greater")
#p-value(0.02872) < 0.05 so reject H0 at 5% level of siginificance.

#Two proportions z test
#Assume that out of 100 patients 60 patients are Covid positive in one group
#Assume that out of 200 patients 80 patients are Covid positive in another group
#H1: P(G1 Positive)>P(G2 Positive)
prop.test(x=c(60,80),n=c(100,200),alternative = "greater")
#p-value(0.0008149)<0.05 so reject H0 at 5% significance level.

#Chi Square Test for categorical data
setwd("D:\\Binura\\SLIIT\\3rd year 2nd sem\\Fundamentals of Data Mining\\Lectures")
getwd()
data = read.csv("Results.csv")
head(data)
tab1 = table(data$gender,data$marks)
tab1

chisq.test(tab1)
#p-val>0.05, so do not reject H0 at 5% level of significance

tab2=table(data$gender,data$School)
tab2

chisq.test(tab2)
#p-val>0.05, so do not reject H0 at 5% level of significance
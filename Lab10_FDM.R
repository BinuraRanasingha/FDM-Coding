#Question 1
#Create the dataframe
Name=c("Sam","Kane","Jane","Anne","Sammie")
Age=c(23,21,24,25,20)
Gender=c("Male","Male","Female","Female","Female")
Marks=c(78,58,30,85,90)
df=data.frame(Name,Age,Gender,Marks)
df

#Remove the Primary Key column in the dataset
df$Name=NULL #$ is used to access the dataframe
df

#Change the categorical variables to factors
str(df)
df$Gender=factor(df$Gender)
str(df)

#Find the average mark for a student
meanMark = mean(df$Marks)
meanMark

#Add 5 marks for each student and find the average mark again
df$Marks = df$Marks + 5
df
mean(df$Marks)

#Change the Age of Jane (3rd Row) to 22
df$Age[3] =22
df[2,1]=45 #Row,column
df

#Create a new column for results such that If mark ??? 50 ---> Pass If 
#mark < 50 ---> Fail
df$Results = ifelse(df$Marks >=50, "Pass","Fail")
df

#Get the overall summary of the data frame
summary(df)

#Separate the data frame to two data frames based on Gender (df_Male &df_Female)
df_Male = df[df$Gender == "Male",]
df_Male

df_Female = df[df$Gender == "Female",]
df_Female

#Get statistical summary for each df_Female & df_Male data frames.
summary(df_Male)
summary(df_Female)

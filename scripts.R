#part one:
    
    #Exploratory Data Analysis

#we take a look at the provided data. 

#install.packages(dplyr) 
#install.packages(reader)
library(dplyr)
library(readr)
diabetes <- read_csv("Downloads/diabetes/diabetes.csv")

#first of all we look for missing data in our data-set.
is.na(diabetes)
#all false!
#for better look lets rearrange the data by Age and Glucose level (Ascending)

new <- diabetes %>% arrange(diabetes$Age,
                            diabetes$Glucose)
#mean value:
    
    #we can check the mean value for every factor in each group (diabetic and non_diabetics)

# diabetics

result <- new %>% filter(new$Outcome == 1)
mean_G_result <- mean(result$Glucose)
mean_G_result
mean_Age_result <- mean(result$Age)
mean_Age_result 
mean_Blood_result <- mean(result$BloodPressure)
mean_Blood_result
mean_Bmi_result <- mean(result$BMI)
mean_Bmi_result
mean_SkinThi_result <- mean(result$SkinThickness)
mean_SkinThi_result
mean_Insulin_result <- mean(result$Insulin)
mean_Insulin_result 
mean_Dia_result <- mean(result$DiabetesPedigreeFunction)
mean_Dia_result
mean_Pre_result <- mean(result$Pregnancies)
mean_Pre_result

# <<the out put >>:

#[1] 141.2575
#[1] 37.06716
#[1] 70.82463
#[1] 35.14254
#[1] 22.16418
#[1] 100.3358
#[1] 0.5505
#[1] 4.865672

#non_diabetic

non_diabete <- new %>% filter(new$Outcome== 0)
mean_G_non <- mean(non_diabete$Glucose)
mean_G_non
mean_Age_non<- mean(non_diabete$Age)
mean_Age_non
mean_Blood_non <- mean(non_diabete$BloodPressure)
mean_Blood_non
mean_Bmi_non <-mean(non_diabete$BMI)
mean_Bmi_non
mean_SkinThi_non <- mean(non_diabete$SkinThickness)
mean_SkinThi_non
mean_Insulin_non <-mean(non_diabete$Insulin)
mean_Insulin_non
mean_Dia_non <-mean(non_diabete$DiabetesPedigreeFunction)
mean_Dia_non
mean_Pre_result <-mean(non_diabete$Pregnancies)
mean_Pre_result

# <<out_put>>

#[1] 109.98
#[1] 31.19
#[1] 68.184
#[1] 30.3042
#[1] 19.664
#[1] 68.792
#[1] 0.429734
#[1] 3.298

#mean differences in a graphical attribute!
# - age :

#lets check the age difference in diabetics and non_diabetics by a plot.

#figure1

library(ggplot2)
result <- new %>% filter(new$Outcome == 1)
non_diabete <- new %>% filter(new$Outcome== 0)
bar_dat<- data.frame(titles = c("Mean_Age_nondiabetis","Mean_Age_diabetis"),
                     values = c(mean(non_diabete$Age),mean(result$Age)))
pref <- ggplot(data=bar_dat,aes(x=titles,y=values,fill = titles)) +
    geom_bar(stat="identity")
pref   

#BMI 
#figure2

result <- new %>% filter(new$Outcome == 1)
non_diabete <- new %>% filter(new$Outcome== 0)
bar_dat<- data.frame(titles = c("Mean_BMI_nondiabetis","Mean_BMI_diabetis"),
                     values = c(mean(non_diabete$BMI),mean(result$BMI)))
pref <- ggplot(data=bar_dat,aes(x=titles,y=values,fill = titles)) +
    geom_bar(stat="identity")
pref

#insulin 
#figure3

result <- new %>% filter(new$Outcome == 1)
non_diabete <- new %>% filter(new$Outcome== 0)
bar_dat<- data.frame(titles = c("Mean_Insulin_nondiabetis","Mean_Insulin_diabetis"),
                     values = c(mean(non_diabete$Insulin),mean(result$Insulin)))
pref <- ggplot(data=bar_dat,aes(x=titles,y=values,fill = titles)) +
    geom_bar(stat="identity")
pref

#pregnancy 
#figure4 

result <- new %>% filter(new$Outcome == 1)
non_diabete <- new %>% filter(new$Outcome== 0)
bar_dat<- data.frame(titles = c("Mean_preg_nondiabetis","Mean_preg_diabetis"),
                     values = c(mean(non_diabete$Pregnancies),mean(result$Pregnancies)))
pref <- ggplot(data=bar_dat,aes(x=titles,y=values,fill = titles)) +
    geom_bar(stat="identity")
pref

#skin thickness
#figure5
{r}
result <- new %>% filter(new$Outcome == 1)
non_diabete <- new %>% filter(new$Outcome== 0)
bar_dat<- data.frame(titles = c("Mean_Skinthog_nondiabetis","Mean_Skinthog_diabetis"),
                     values = c(mean(non_diabete$SkinThickness),mean(result$SkinThickness)))
pref <- ggplot(data=bar_dat,aes(x=titles,y=values,fill = titles)) +
    geom_bar(stat="identity")
pref

#Glucose 
#figure6 

result <- new %>% filter(new$Outcome == 1)
non_diabete <- new %>% filter(new$Outcome== 0)
bar_dat<- data.frame(titles = c("Mean_Skinthog_nondiabetis","Mean_Skinthog_diabetis"),
                     values = c(mean(non_diabete$SkinThickness),mean(result$SkinThickness)))
pref <- ggplot(data=bar_dat,aes(x=titles,y=values,fill = titles)) +
    geom_bar(stat="identity")
pref

#DPF
#figure7
{r}
result <- new %>% filter(new$Outcome == 1)
non_diabete <- new %>% filter(new$Outcome== 0)
bar_dat<- data.frame(titles = c("Mean_DPF_nondiabetis","Mean_DPF_diabetis"),
                     values = c(mean(non_diabete$DiabetesPedigreeFunction),mean(result$DiabetesPedigreeFunction)))
pref <- ggplot(data=bar_dat,aes(x=titles,y=values,fill = titles)) +
    geom_bar(stat="identity")
pref

#percentage of diabetic people in different ages.


#we would like to measure the percentage of people who has diabetes in different 
#ages so that we can compare them in a bar-plot!

{r}
library(dplyr)
age_related <- new %>% filter(Age<30,
                              Outcome== 1)
diabet_under_30 <-(count(age_related) / count(filter(new,Age<30)))*100
diabet_under_30
diabet_under_40 <- (count(filter(new,Age<40 & Age>=30,Outcome == 1))/count(filter(new,Age<40 & Age >=30)))*100
diabet_under_40
diabet_under_50 <-(count(filter(new,Age<50 & Age >=40,Outcome == 1))/count(filter(new,Age<50 & Age >=40)))*100
diabet_under_50
diabet_under_60 <- (count(filter(new,Age<60 & Age >=50,Outcome == 1))/count(filter(new,Age<60 & Age >=50)))*100
diabet_under_60
diabet_under_70 <- (count(filter(new,Age<70 & Age >=60,Outcome == 1))/count(filter(new,Age<70 & Age >=60)))*100
diabet_under_70
diabet_under_80 <- (count(filter(new,Age<80 & Age>=70,Outcome == 1)))/(count(filter(new,Age<80 & Age >=70)))*100
diabet_under_80

#lets prepare a bar chart.
#figure8
age_groups <- c("20-30","30-39","40-49","50-59","60-69","70-79")
diabet_precentage <- as.integer(c(diabet_under_30,diabet_under_40,diabet_under_50,diabet_under_60,diabet_under_70,diabet_under_80))
diabet_data <- data.frame(Age= age_groups, Diabet_precentage= diabet_precentage)
library(ggplot2)
ggplot(diabet_data,aes(x=Age,y= Diabet_precentage)) +
    geom_bar(stat = "identity",fill ="steelblue")+
    labs(title="precentage of diabetic people by age",
         x = "age gruop",
         y = "percentage")+
    theme_minimal()   

#checking the normality

#we check if the distribution of our variables are normal.
#this can help us in choosing suitable statistics tests.
#figure9
qqnorm(result$Glucose,main = "normality")
qqline(result$Glucose,col="red")
#Glucose is normally distributed.
#figure10
qqnorm(result$BloodPressure)
qqline(result$BloodPressure,col ="red")
ks.test(result$BloodPressure,"pnorm",mean = mean(result$BloodPressure),sd = sd(result$BloodPressure))
#blood pressure is not normally distributed!
#figure11
qqnorm(result$Insulin)
qqline((result$Insulin),col ="red")
#insulin is not normally distributed!
#figure12
qqnorm(result$Pregnancies)
qqline(result$Pregnancies,col ="red")
#pregnancy is not normally distributed!
#figure13
qqnorm(result$SkinThickness)
qqline(result$SkinThickness,col ="red")
#skin-thickness is not normally distributed!
#figure14
qqnorm(result$BMI)
qqline(result$BMI,col ="red")
#BMI is normally distribution!
#figure15
qqnorm(result$DiabetesPedigreeFunction)
qqline(result$DiabetesPedigreeFunction,col ="red")
#DPF is normally distributed!
#figure16
qqnorm(result$Age)
qqline(result$Age,col ="red")
#age is not normally distributed.
#note : ** in most cases in addition to abnormality, we have out lairs.

#part 2:
    
    #Association of Glucose level and other variables.

#we choose "Spear-man" test for the association of Glucose and variables
#since most f the variables are not normal and more importantly we have out-layer data.

correlation_B<- cor(new$Glucose,new$BMI,method = "spearman")
print(correlation_B)

#0.2311412 is a weak positive relationship!
#figure17
plot(new$Glucose,new$BMI,main ="Scatter plot of Glucose level vs BMI",xlab = "Glocuse level",ylab = "BMI",pch = 19,col = "blue")
abline(lm(new$BMI~ new$Glucose))
text(50,29,paste("r =",round(correlation_B,2)),col = "red")

#figure18
correlation_I<- cor(new$Glucose,new$Insulin,method = "spearman")
print(correlation_I)

plot(new$Glucose,new$Insulin,main ="Scatter plot of Glucose level vs Insulin",xlab = "Glocuse level",ylab = "Insulin",pch = 19,col = "blue")
abline(lm(new$Insulin ~ new$Glucose))
text(50,40,paste("r =",round(correlation_I,2)),col = "red")
#0.2132058 correlation is weak.

correlation_F<- cor(new$Glucose,new$DiabetesPedigreeFunction,method = "spearman")
print(correlation_F)

plot(new$Glucose,new$DiabetesPedigreeFunction,main ="Scatter plot of Glucose level vs DPF",xlab = "Glocuse level",ylab = "DPF",pch = 19,col = "blue")
abline(lm(new$DiabetesPedigreeFunction ~ new$Glucose))
text(50,1.0,paste("r =",round(correlation_F,2)),col = "red")
#figure 19
#there is a weak correlation 0.09129336 between DPF and Glucose level.

correlation_P<- cor(new$Glucose,new$Pregnancies,method = "spearman")
print(correlation_P)

plot(new$Glucose,new$Pregnancies,main ="Scatter plot of Glucose level vs pregnancies",xlab = "Glocuse level",ylab = "DPF",pch = 19,col = "blue")
abline(lm(new$Pregnancies ~ new$Glucose))
text(50,1.0,paste("r =",round(correlation_P,2)),col = "red")
#figure20

correlation_BP<- cor(new$Glucose,new$BloodPressure,method = "spearman")
print(correlation_BP)

plot(new$Glucose,new$BloodPressure,main ="Scatter plot of Glucose level vs blood pressure",xlab = "Glocuse level",ylab = "blood pressure",pch = 19,col = "blue")
abline(lm(new$BloodPressure ~ new$Glucose))
text(30,60,paste("r =",round(correlation_BP,2)),col = "red")
#figure21

correlation_S<- cor(new$Glucose,new$SkinThickness,method = "spearman")
print(correlation_S)

plot(new$Glucose,new$SkinThickness,main ="Scatter plot of Glucose level vs skinthickness",xlab = "Glocuse level",ylab = "skin thickness",pch = 19,col = "blue")
abline(lm(new$SkinThickness ~ new$Glucose))
text(20,20,paste("r =",round(correlation_S,2)),col = "red")
#figure22


correlation_A<- cor(new$Glucose,new$Age,method = "spearman")
print(correlation_A)

plot(new$Glucose,new$Age,main ="Scatter plot of Glucose level vs Age",xlab = "Glocuse level",ylab = "Age",pch = 19,col = "blue")
abline(lm(new$Age ~ new$Glucose))
text(20,25,paste("r =",round(correlation_A,2)),col = "red")
#figure23

library(ggplot2)
data <- data.frame(num = c(correlation_A,correlation_B,correlation_BP,correlation_F,correlation_I,correlation_P,correlation_S),lable = c("age","BMI","blood pressure","dpf","insulin","pregnancy","skinthickness"))
ggplot(data ,aes(x= lable,y = num)) +
    geom_bar(stat = "identity",fill ="steelblue")+
    labs(title="correlaion of varibles with Glucose level",
         x = "varible",
         y = "correlation")+
    theme_minimal()


##The association between Diabetes and variables.

#having diabetic or nor is a binary situation, so the best test/model can be logistic regression !


model <- glm(new$Outcome ~ new$BMI + new$Age + new$BloodPressure + new$Pregnancies + new$SkinThickness + new$Insulin + new$DiabetesPedigreeFunction, data = new, family = binomial)
summary(model)

#before checking the values, we run a test to make sure that we can trust our model/test,

#install.packages("ResourceSelection")
library(ResourceSelection)
hoslem.test(model$y,fitted(model))

#p-value = 0.1456 ,it is greater than 0.05 so it fails to rejects the null hypothesis so model fits the data well, and we can trust it. lets look at the values provided by our test based on log odds for this model.

#the most effective factors on diabetes are:
    
    #DPF = 0.942265, for each 1 unit increase in DPF the log odds(likelihood) of having diabetes increases by 0.942265

#Pregnancies = 0.105468, for each one more pregnancies the log odds(likelihood) of having diabetes increase by 0.105468

#BMI = 0.104137, for each one unit increase in BMI the log odds (likelihood) of having diabetes increase by 0.104137

#Age= 0.033722, for each year the log odds(likelihood) of having diabetes increase by 0.033722

#we can have a plot that shows how prediction fits the module.

model <- glm(new$Outcome ~ BMI + Age + Insulin + Pregnancies + DiabetesPedigreeFunction, 
             data = new, family = binomial)
predicted_probs <- fitted(model)
bins <- cut(predicted_probs, breaks = quantile(predicted_probs, probs = 0:10 / 10), include.lowest = TRUE, labels = FALSE)
observed <- tapply(model$y, bins, mean)
expected <- tapply(predicted_probs, bins, mean)
# Plot observed vs. expected probabilities
plot(expected, observed, 
     xlab = "Expected Probability (Predicted)", 
     ylab = "Observed Proportion (Actual)", 
     main = "Hosmer-Lemeshow Test: Observed vs Expected",
     pch = 19, col = "blue")
abline(a= 0, b = 1,col ="red",lty = 2)
#we are also adding our test result to the plot 
hl_test <- hoslem.test(model$y, fitted(model))
text(0.5, 0.2, paste("p-value = ", round(hl_test$p.value, 4)), col = "red", cex = 1.2)

#lets check the performance of our model! we use ROC curve for module performance:

#install.packages("pROC")
library(pROC)
predicted_probs <- predict(model, type = "response")
roc_curve <- roc(new$Outcome, predicted_probs)
plot(roc_curve,main = "ROC Curve Logistic Regression")
auc_value <-auc(roc_curve)
print(paste("AUC:",auc_value))

#Auc value is close to 1 it is "AUC: 0.757753731343284" which shows the module has a good sensitivity to classification.In essence ,the model can detect the differences between diabetics and non diabetics.

#lets check our model performance on a sample data-set.


new_data <- data.frame(
    BMI = c(40.0,50.2,27.4),
    Age = c(45,50,38),
    Pregnancies = c(3,2,1),
    Insulin = c(85,95,90),
    DiabetesPedigreeFunction = c(0.45,0.55,0.43)
)
new_predicted_probs <- predict(model,newdata = new_data, type = "response")
new_predicted_class <- ifelse(new_predicted_probs > 0.5,1,0)
new_predicted_class
#as we can see people with high BMI are detected as diabetic patients.
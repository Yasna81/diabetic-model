# diabetic-model
A model that can predict the risk of having diabetes based on various health factors.

This repository contains a machine learning model designed to predict whether an individual is at risk of diabetes based on [data](https://github.com/Yasna81/diabetic-model/blob/main/diabetes.csv)  for various health factors.

## Description

This project uses machine learning techniques to predict the likelihood of diabetes based on a set of health-related inputs. The model was trained on diabetic data and can be used to predict the risk of diabetes for new inputs.
[hosmer-tets](plots/hosmer-tets)


![image](https://github.com/user-attachments/assets/d3918bb6-f10d-4317-997d-8532763cdd16)



__1. Defining the Problem and Setting Up the Data:__

We started with the goal of predicting whether there is a correlation between Glucose level and other factors,and if someone has diabetes based on various predictors, including glucose levels, BMI, age, blood pressure, insulin, etc.

__2. Exploratory Data Analysis (EDA):__

Before building the model, we explored the data to understand its structure:

- Check for missing values: Ensured that all necessary columns had valid values.
- Visualized relationships: Created scatter plots, histograms, and other visualizations to explore the relationships between glucose levels and other variables.
- Checking Normality: checking if the distribution is normal

__3.using spearman test for Glocuse level:__ 

- Outcome variable: diabetes 
- Predictor variables: Glucose, BMI, Age, Blood Pressure, Insulin, and Diabetes Pedigree Function.
- The logistic regression model is trained to predict the log odds of having diabetes.

__4. Building the Logistic Regression Model:__

- We then trained the logistic regression model using the glm() function in R
- Outcome variable: diabetes (binary outcome).
- Predictor variables: Glucose, BMI, Age, Blood Pressure, Insulin, and Diabetes Pedigree Function.
The logistic regression model is trained to predict the log odds of having diabetes.

__5. Evaluating Model Performance:__

We used various techniques to evaluate the performance of the logistic regression model:

_5.1 Hosmer-Lemeshow Test:_

We used the Hosmer-Lemeshow test to check how well the predicted probabilities from the model fit the observed data.

Interpretation: A p-value > 0.05 suggested that the model’s predicted probabilities were a good fit for the observed outcomes.
_5.2 ROC Curve & AUC:_

We plotted the ROC curve and calculated the AUC (Area Under the Curve) to assess how well the model distinguishes between diabetes and non-diabetes.

* AUC closer to 1 indicates a good model.
_5.3 Interpretation of Model Coefficients:_

We examined the model’s coefficients to understand the relationships between each predictor and the log odds of diabetes.

For instance, the coefficient for glucose indicated the effect of glucose levels on the likelihood of diabetes.

__6. Making Predictions__

We used the trained model to predict the probability of diabetes for new data or the existing dataset. The predict() function was used to get the predicted probabilities.

__7. Reporting the Results__

In the results section of the report, we would interpret:

Statistical Significance of the predictors (e.g., p-values for glucose, BMI, etc.).

Coefficients to explain the relationship between each predictor and the probability of having diabetes.

__Model Fit__: We discussed the Hosmer-Lemeshow test and AUC to assess the goodness of fit and model performance.

__Conclusions__: We concluded which variables were significant predictors and interpreted their effect (e.g., how an increase in glucose levels might raise the odds of having diabetes).

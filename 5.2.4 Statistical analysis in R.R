###############################################################################
# Project to analyse Insurance-4-You's (I4U) health insurance information for 
# over 1,300 existing clients or policyholders to review the health data

# The project examines the the correlation between the amounts it charges its 
# clients and its clients' health, to potentially rethink its billing system.

#  Objectives are twofold. Use statistical techniques to: 
# - Analyse the BMI of the primary holders, focusing on: 
#    - measures of central tendency
#    - measures of variability
#    - normality.

# - Investigate the correlation between BMI and the amount I4U charges each
#   customer, taking note of whether there is a correlation between these
#   variables, and what other variables I4U might use as a correlation with
#   charges.


# Import necessary libraries 
library(tidyverse)
library(moments)
library('BSDA')

# Import the dataset (insurance.csv)
insurance <- read.csv(file.choose(), header=T)

View(insurance)
head(insurance)
str(insurance)

dim(insurance)

# Explore bmi column
# Descprtive statsitics for the dataframe and bmi column
summary(insurance)
summary(insurance$bmi)

# Measure the central tendencies 
mean(insurance$bmi)
median(insurance$bmi)

# Determine the extreme values
min(insurance$bmi)
max(insurance$bmi)

# Determine the measure statistics of variability (range, Q1, Q3, IQR, var and sd)
# Range = Maximum - Minimum.
max(insurance$bmi)- min(insurance$bmi)  


# Function to calculate Q1.
quantile(insurance$bmi, 0.25)

# Function to calculate Q3
quantile(insurance$bmi, 0.75)

# IQR 
IQR(insurance$bmi)

# Variance
var(insurance$bmi)

# Standard Deviation
sd(insurance$bmi)

## Determine if the data is normally distributed
qqnorm(insurance$bmi)
qqline(insurance$bmi, col='red')

# Conduct a Sharipo-wilk test
shapiro.test((insurance$bmi))

# The P-value is less than 0.05 so we can conclude that the data is not normally
# distributed

# Check for skewness
skewness(insurance$bmi)

# Check for kurtosis
kurtosis(insurance$bmi)
# Our kurtosis value is less than 3, suggesting our data is platykurtic.

# 4. Determine if there are any correlation(s)

# Check correlation between BMI and client age.
# First check for normality in the client age values.
shapiro.test(insurance$age)
# Our output is greater than 0.5, and we can assume normality.

# Check correlation between BMI and age using Pearson's correlation.
cor(insurance$bmi, insurance$age)

# There is a weak positive correlation between variables as the score is 0.11
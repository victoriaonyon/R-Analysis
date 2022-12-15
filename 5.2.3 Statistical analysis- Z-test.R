# Grandfathers Clocks, a small family business, which was founded in 1920. 
# In preparation for the 100-year celebrations, we have been tasked to determine
# whether the then-CEO’s promise to the stakeholders was honoured. 
# The CEO promised that the business would sell on average 250 watches per year.
# This project complies a data set (watches.csv) that consists of two randomly 
# selected stores from different locations, a hundred values per store (), 
# normally distributed data, and a standard deviation of 12.26 and 30.15 for 
# Store_A and Store_B respectively. She decides to perform a one-sample and 
# two-sample -test on annual sales data. 

########################################################

# Import the necessary packagess
library(tidyverse)
library(moments)

install.packages('BSDA')
library('BSDA')

# Select your working directory
# Import the CSV file (watches.csv). The CSV has headers
watches <- read.csv(file.choose(), header=T)

# Explore the data
View(watches)
head(watches)
dim(watches)
summary(watches)

# Visualise the data
# Histogram
hist(watches$Store_B)
boxplot(watches$Store_B)

# Both plots indicate how the data is slightly indicate left-skewed
# Confirm normality of data

# Q-Q plot to determine normality
qqnorm(watches$Store_B)
qqline(watches$Store_B)

# Shapiro-Wilk test to determine normality
shapiro.test(watches$Store_B)

# Compute the skewness and kurtosis
skewness(watches$Store_B)
kurtosis(watches$Store_B)

# Average of 250 watches sold per year
# Note that mu=250 for one-sample z-test
z.test(watches$Store_B,
       mu=250,
       sigma.x=30.15)

# Two sample z-test
# Visualise the data of Store_A
# Histogram
hist(watches$Store_A)

#Boxplot
boxplot(watches$Store_A)

# Both plots indicate that the data of Store_A is less skewed than Store_B
# Q-Q plot to determine normality
qqnorm(watches$Store_A)
qqline(watches$Store_A)

# The Q-Q Plot indicates normal dist. with some values below the line.
# As the Shapiro-Wilk test returned p= 0.1889 which is < than 0.05
# So we can reject the Ho conclude the data

# Shapiro-Wilk test to determine normality
shapiro.test(watches$Store_A)

# Compute skewness and kurtosis
skewness(watches$Store_A)
kurtosis(watches$Store_A)

# Average of 250 watches sold per year at both stores
# Note that mu=0 for two sample z-test
z.test(watches$Store_B,
       watches$Store_A,
       mu=0,
       sigma.x = 30.15,
       sigma.y = 12.126)

# As the p-value is smaller than 0.05 we can reject H0 and conclude that the 
# means are different but both stores sold more than 250 watches


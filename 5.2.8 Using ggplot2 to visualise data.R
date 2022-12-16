# Evaluating the relationship between client age and client fees 
# by incorporating smoker, gender, region and children variables to better
# understand and visualise the data

# Import the ggplot2 library.
library(tidyverse)

# Import the dataset
insurance <- read.csv(file.choose(), header=T)

# View the dataset
head(insurance)
str(insurance)
summary(insurance)

# Create visualisations
# Create a scatterplot to compare age (X-variable) and charges (Y-variable)

ggplot(insurance,
       mapping=aes(x=age, y=charges)) +
  geom_point()

# Remove outliers above 50,000 and create a new dataframe
new_insurance <- filter(insurance, charges<50000)

# Create a scatterplot of the new data
ggplot(new_insurance,
       mapping=aes(x=age, y=charges)) +
  geom_point()

# Scatterplot to compare age and charges based on sex
ggplot(new_insurance,
       mapping=aes(x=age, y=charges)) +
  geom_point(color='purple',
             alpha=0.75,
             size=2.5) +
  # Add labels and change axes marks.
  scale_x_continuous(breaks=seq(0, 70, 5), "Age of the Individual") +
  scale_y_continuous(breaks=seq(0, 55000, 5000), "Monthly charges (in $)") +
  # Add a title and subtitle.
  labs(title="Relationship between age and charges",
       subtitle="A survey from a health insurance provider") +
  # Facet by sex.
  facet_wrap(~sex)


## A scatterplot to compares age and charges based on region
ggplot(new_insurance,
       mapping=aes(x=age, y=charges)) +
  geom_point(color='blue',
             alpha=0.75,
             size=2.5) +
  # Add labels and change axes marks.
  scale_x_continuous(breaks=seq(0, 70, 5), "Age of the Individual") +
  scale_y_continuous(breaks=seq(0, 55000, 5000), "Monthly charges (in $)") +
  # Add a title and subtitle.
  labs(title="Relationship between age and charges",
       subtitle="A survey from a health insurance provider") +
  # Facet by sex.
  facet_wrap(~region)


# Scatterplot to compare age and charges by children
ggplot(new_insurance,
       mapping=aes(x=age, y=charges)) +
  geom_point(color='green',
             alpha=0.75,
             size=2.5) +
  # Add labels and change axes marks.
  scale_x_continuous(breaks=seq(0, 70, 5), "Age of the Individual") +
  scale_y_continuous(breaks=seq(0, 55000, 5000), "Monthly charges (in $)") +
  # Add a title and subtitle.
  labs(title="Relationship between age and charges",
       subtitle="A survey from a health insurance provider") +
  # Facet by sex.
  facet_wrap(~children)

# Scatterplot with smoker as a third variable
# Create a scatterplot to view result.
ggplot(new_insurance, 
       mapping=aes(x=age, y=charges, col=smoker)) +
  geom_point() +
  scale_x_continuous(breaks=seq(0, 70, 5), "Age of member") +
  scale_y_continuous(breaks=seq(0, 55000, 5000), "Monthly charges")

# Situation
# Ryan is still working on the new car insurance product for I4U. To ensure
# members get a well-rounded product with excellent benefits, Callan Lee asked
# Ryan to consider whether a historical police data set might be useful to
# inform the new insurance product.

# In order to complete the tasks Ryan has given you, you decide on the 
# following plan of action: 
# - Import the CSV file (police.csv) into RStudio.
# - Explore and sense-check the data set.
# - Perform data manipulation.
# - Perform string manipulation.
# - Answer the following questions based on the police reports:
#    - How many offences were suspicious compared to traffic?
#    - How many offences were gender based?
#    - How do the neighbourhoods compare?
#    - Is the number of occurrences (problems and traffic) gender based?
#    - What is the total number of occurrences per neighbourhood?.

###############################################################################

# Import the relevant libraries
library(tidyverse)
library(skimr)
library(DataExplorer)

# Import the police.csv dataset
police <- read.csv(file.choose(), header=T)
police

View(police)
as_tibble(police)
dim(police)

# Determine if there are missing values. 
police[is.na(police)] 
sum(is.na(police))

# Create a new dataframe of data ommitting NAs
police2 <- na.omit(police)
police2

head(police2)
tail(police2)
dim(police2)
sum(is.na(police2))

# Summary statistics
summary(police2)
DataExplorer::create_report(police2)

#################### Data manipulation

# Drop unnecessary columns.
police_df <- select(police2, -c('X', 'idNum', 'date', 'MDC', 'preRace',
                                   'race', 'lat', 'long', 'policePrecinct',
                                   'citationIssued', 'personSearch', 
                                   'vehicleSearch'))

# View the result.
colnames(police_df)
dim(police_df)

# Rename the column names
names(police_df) <- str_to_title(names(police_df))
colnames(police_df)

# Determine the distinct values in the columns
unique(police_df$Problem)
unique(police_df$Gender)
unique(police_df$Neighborhood)

# Visualise the the data in the three columns to answer the following questions:
# 1. How many officences were suspsicious compared to traffic?

barplot(table(police_df$Problem),
        main='Police reports',
        xlab='Offense',
        ylab='Count',
        col='red')

# 2. How many offences were gender-based?
barplot(table(police_df$Gender),
        main='Offences by Gender',
        xlab='Gender',
        ylab='Count',
        col='green')

# 3. How do the neighbourhoods compare?
barplot(table(police_df$Neighborhood),
        main='Police reports',
        xlab='Neighborhood',
        ylab='Count',
        col='blue')

# Is the number of occurences (problems and traffic) gender-based?
# Determine the number of occurrences for gender and problems.
table(police_df$Gender)            
table(police_df$Problem)
table(police_df$Neighborhood)

# Number of traffic offences by gender
nrow(subset(police_df, Gender=='Female' & Problem=='traffic'))
nrow(subset(police_df, Gender=='Male' & Problem=='traffic'))

# Number of suspicious offences by gender
nrow(subset(police_df, Gender=='Female' & Problem=='suspicious'))
nrow(subset(police_df, Gender=='Male' & Problem=='suspicious'))

### Number of occurences by neighbourhood
police_df %>% count(Neighborhood, sort=TRUE)


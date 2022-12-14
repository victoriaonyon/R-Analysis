# Can insert "" inside a string a '' and vice versa
# Use stringr

library(stringr)

# Create four strings. Using ""
string1 <- "R is a statistical programming language"
string2 <- "I like to code in R"
string3 <- "Coding in R is fun"
string4 <- "Do you like to code in R"

# Print the strings
string1
string2
string3
string4

# Determine the length of a string
str_length(string1)
str_length(string2)
str_length(string3)
str_length(string4)

# Combine strings together using str_c()
str_c(string1, string2, string3, string4)

# Add a sepearator to make it more readable
str_c(string1, string2, string3, string4, sep= '. ')

string5 <- str_c(string1, string2, string3, string4, sep= '. ')

string5
str_length(string5)

# Create a subset of string5
string6 <- str_sub(string5, 1, 81)
string6

# Create a third new string by subsetting and printing it
string7 <- str_sub(string5, 83, 107)
string7

string8 <- str_sub(string5, 1, 50)

# Truncating a string - number of characters
str_trunc(string5, 10)

# Changing the case of a string
str_to_lower(string5)
str_to_upper(string5)
str_to_title(string5)
str_to_sentence(string5)

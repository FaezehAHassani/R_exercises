# Calculate the number of minutes in a year
minutes_in_a_year <- 365 * 24 * 60
print(minutes_in_a_year)

a <- (20 + 10) / 2
print(a)

number_of_days_in_a_month <- "as I wish"
print(number_of_days_in_a_month)

minutes_in_a_year < a

my_integer  <- 2L
print(my_integer)

my_complex_number <- 2i - 9
print(my_complex_number)

#?sum  or ??sum

example(print)

a <- min(0, 1, 10, -14)
print(a)

min(0, -1, 2 / 3, -10)

sqrt(10)

print("Hello World")

sum(1, 2, 1000)

toupper("i love u")

round(3.1234567, 4)

paste("how", "are", "you")

nchar("what is the date?")

c(1, 2, 3)

seq(-1, 2) 

paste("hi", "mom", sep = "   ")

"+" (2, 3) #means 2+3

install.packages("stringr") 
library("stringr")
str_count("ikjgdjhi", "i")

install.packages("lintr")
library("lintr")
lint("/Users/faezeh/Desktop/project/syntax_test.R")

install.packages("styler")
library("styler")
lint("/Users/faezeh/Desktop/project/syntax_test.R")

#make a new function
make_full_name <- function(surename, family){
  full_name <- paste(surename, family)
  full_name}
make_full_name("Faezeh","Hassani")

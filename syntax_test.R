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
make_full_name <- function(surename, family) {
  full_name <- paste(surename, family)
  full_name  #return full name
}
make_full_name("Faezeh","Hassani") #example

calculate_area <- function(width, height) {
  area <- width * height 
  area #return area
}
calculate_area(10, 1/2) #example

#debug a function by giving value to variables and run line by line
weightlbs <- 20 # first define value
heightinches <- 10 # first define value
#then run function line by line

calculate_bmi <- function(weightlbs, heightinches) {
  weightkg <- weightlbs * 0.453592
  heightm <- heightinches * 0.0254
  bmi <- weightkg / heightm ^ 2
  bmi
}
#then delete pre-defined values
calculate_bmi(20, 5) #example

#function with if loop
condition_soup_temp <- function(soup_temp) {
  if (soup_temp < 40 & soup_temp > 36) {  # (36 < soup_temp < 40) is wrong
    status <- "perfect soup temp"
  } else if (soup_temp > 40) {
    status <- "too hot"
  } else {
    status <- "too cold"
  }
  status
}
condition_soup_temp(50) # exmaple
condition_soup_temp(38) # exmaple
condition_soup_temp(35) # exmaple

add_title <- function(full_name, title) {
  if (startsWith(full_name, title)) {
    return(full_name)
  }
  name_with_title <- paste(title, full_name)
  name_with_title
}

full_name <- "Dr faezeh arab hassani"
title <- "Dr"
add_title(full_name, title) # example

startsWith(full_name, title) #gives True or Fulse 

#vector
people <- c("ana", "ellen", "adam")
print(people)
print(people[1])
print(people[2])
print(people[4]) #returns NA
all_but_adam <- people[-3] # to exclude index 3: adam
print(all_but_adam) # returns "ana"   "ellen"
print(people[2:3])
indices <- c(1,3)
print(people[indices]) # returns "ana"  "adam"


v1 <- c(1, 2, 3, 4)
v2 <- c(-1, 0, 8, -100)
v3 <- v1 + v2
print(v3)

is.data.frame(v3) # define if v3 is data frame which is not so it returns FALSE
as.data.frame(v3) # convert v3 from vector to data frame but temporarily
vector_frame <- data.frame( #convert 
  v1 = c(1, 2, 3, 4),
  v2 = c(-1, 0, 8, -100),
  as.data.frame(v3)
)
is.data.frame(vector_frame) #return TRUE

# un-equal vectors
v1 <- c(1, 2)
v2 <- c(-1, 0, 8, -100)
v3 <- v1 + v2
print(v3)

#add a scalar to a vector
v2 <- c(-1, 0, 8, -100)
v3 <- 5 + v2 #recycling happens
print(v3)

nchar(v3) #lenght of each element in vector v3 and returns 1 1 2 3

name <- "faezeh"
nchar(name) #number of characters in faezeh and returns 6
length(name) #consider faezeh as 1-element vector and returns 1

v1 <- c(1.34, 0.9998, 100.971, -19)
v2 <- round(v1, 2)
v3 <- nchar(v1)
print(v2)
print(v3)

colors <- c("green", "blue")
locations <- c("sky", "grass")
band <- paste(locations, colors, sep = "") #no seperation between words
print(band)

shoe_size <- c(3, 4.5, 6, 9, 2.5)
small_shoe_size <- shoe_size < 4.5
print(shoe_size[small_shoe_size])

prices <- c(20, 30, 40)
length(prices)
new_price <- 45
new_index <- length(prices) + 1
prices[1] <- 20.1 # modify index 1
prices[new_index] <- 45 # add inedex 4
print(prices)
prices[c(1, 2)] <- c(20.2, 30.1)
print(prices)

people[c(2,3)] <- c("emma", "gerald")
people[5] <- "jim" #if no index 4 is available and you are adding index 5, returns NA for index 4
print(people)
more_people <- c(people, "faezeh")
print(more_people)

v4 <- c(0, 10, 5, 220, 1.1, 2, 5, 20, 2.5, 4)
v4[v4 > 10] <- 10
print(v4)

person <- list(
  full_name = "ellen adams",
  job = "engineer",
  salary = 2000,
  permanent = TRUE,
  favourite = list( # if don't space for the next list inside list, it will not return a list under current list but a seperate list
    food = "pizza", 
    music = "jazz"
    )
)
person$job

person_favourite <- person$favourite #how to refer to a list in a list
person_favourite$food

person[[1]]
person[[5]] #returns "jazz"
person[["salary"]] # for list in list e.g. person[["music"]] returns NULL maybe better to use element number instead

person_alternative <- list("bob fallon", "painter", 1000, TRUE)

person$age #returns NULL

person$age <- 40
person$age

person$job <- "senior engineer"
print(person$job)

person$salary <- person$salary * 2
print(person$salary)

person$full_name <- NULL # for security reasons remove full_name
print(person$full_name) #returns NULL

person$full_name <- paste("ellen", "kimmel") # re-add full_name

person[["job"]]
is.list(person[["job"]]) # double bracket reurns vector not a list

job_post <- list(
  qualification = list(
    experience = "5 years",
    bsc_degree = TRUE
  ),
  skills = c("metlab", "r", "tcad")
)

job_qualifications <- job_post$qualification
job_qualifications$bsc_degree

#or
job_post$qualification$bsc_degree #chaining $sign to access elements of a list in a list

job_post$skills[3]

#add a vector function e.g. paste to all the elements of a list 
people_2 <- list("emma", "mat", "jack", "gil")
people_2_upper_case <- lapply(people_2, toupper) #make names upper case
people_2_party <- lapply(people_2, paste, "dances") # in this case no need to call actual paste()

greet <- function(item) {
  paste ("Hello", item) 
}
greetings <- lapply(people_2, greet)

sapply(people, greet) # for apply a function to a vector

# create data frame
people <- data.frame(
  name = c("ebi", "elena", "roy" , "jade", "mark","abba"),
  weight = c(40, 50, 75, 48, 80, 55),
  heigth = c(157, 200, 159, 170, 190, 160),
  sex = c("male", "female", "male", "male", "male", "female"),
  age =c(20, 30, 50 , 80, 10, 37)
) 
people_sex <- people$sex
print(people_sex)
people_heigth <- people[["heigth"]]
print(people_heigth)
nrow(people) # number of rows
ncol(people) # number of columns
dim(people) # dimension of data frame
colnames(people) # column names
rownames(people) # row names
head(people) # return first few rows of data frame as a new data frame
tail(people) # return last few rows of data frame as a new data frame
View(people) # view data frame in a spreedsheet-like viewer
# modify column names
new_col_names <- c("first_name", "person_weight", "person_heigth", "person_sex", "person_age")
colnames(people) <- new_col_names
View(people)

# filtering a data frame
people[2:4, ] # return a data frame of rows 2 to 4 and all columns
people[2:4, "person_sex"] # return a data farme of rows 2 to 4 and column of person_sex

rownames(people) <- people$first_name
print(rownames(people)) # assign a row name to a vector in this case first_name column

people[,c("person_weight", "person_heigth")] # return all rows and columns "person_weight" and "person_heigth"
people[people$person_age > 10, ] #return rows where person_age is above 10 for all columns 

# define if people is a data frame or not
is.data.frame(people)

# Use File/New File/Text File, add your data frame rows and columns separated by comma, save file as .csv and run below to read such file files
my_df <- read.csv("new_data2.csv", stringsAsFactors = FALSE) # use stringsAsFactors to make sure strig data is a vector rather than a factor
View(my_df)
# write to the new data frame
write.csv(my_df, "new_data3.csv", row.names = FALSE) # row.names to remove the row names
View(my_df)

# import added data frame that built in Atom by: File/Import Dataset/From Text (base)" 
print(new_data)

getwd() # to check the working directory, return "/Users/faezeh"

# Use Session/Set Working Directory/Tp Source File Location to change the dirctory above "/Users/faezeh" to the repository

is.factor(my_df$name) # because I used strimgsAsFactors while adding the new created data frame, the column of "name" is not considered a Factor. When the values are in sting format, R automatically dedicate a Lvel to the sting vluses to reduce svaing space

# also by using as.factor we can turn string values to level thus return factor
shirt_size <- c("large", "medium", "small", "large", "small")
shirt_size_factor <- as.factor(shirt_size)
print(shirt_size_factor) # return large  medium small  large  small Levels: large medium small
print(shirt_size) # return "large"  "medium" "small"  "large"  "small" 
length(shirt_size_factor) # still return the number of vector not the levels
is.factor(shirt_size) #return FALSE

num_factors <- as.factor(c(10, 20, 30, 10, 20 ,30, 40, 50)) # return 10 20 30 10 20 30 40 50 Levels: 10 20 30 40 50
print(num_factors)
num_factors * 2 # becuse turned vaector to factor cannot apply operation to all varaiables
num_factors[1] <- 60 # because entered value is above the levels defined it return "invalid factor level, NA generated"

bag <- c("leather", "cotton", "pvc", "cotton", "pvc", "leather")
cost <- c(1000, 200, 300, 250, 350, 1000)
bag_factor <- data.frame(bag, cost)
is.factor(bag_factor$bag) # beacuse didn't use stringsAcFactor = FALSE it returns TRUE
is.factor(bag_factor$cost)
bag_factor[1,2] <- 2000 # change 1000 to 2000
bag_factor[1,1] <- "pf" # as bag is factor it cannot change to a variable rather than its pre-deficed levels, return:10 20 30 10 20 30 40 50 Levels: 10 20 30 40 50
View(bag_factor)
# if change the above command to below it convert bag to vector
bag_factor <- data.frame(bag, cost, stringsAsFactors = FALSE)
is.factor(bag_factor$bag) # return FALSE
View(bag_factor)
bag_factor[1,1] <- "pf" # can change to pf as bag is not factor anymore
View(bag_factor)

# take advantage of factor for splitting
bag <- c("leather", "cotton", "pvc", "cotton", "pvc", "leather")
cost <- c(1000, 200, 300, 250, 350, 1000)
bag_factor <- data.frame(bag, cost)
bag_factor_type <- split(bag_factor, bag_factor$bag)
View(bag_factor_type)
tapply(bag_factor$cost, bag_factor$bag, mean) # first is the variable that mean is applying to

# install dplyr
install.packages("dplyr")
library("dplyr")

install.packages("tidyverse") # this package includes ggplot2 for visualisation
library("tidyverse")

# instal one real data frame example
install.packages("pscl")
library("pscl")
View(presidentialElections)

votes <- select(presidentialElections, year, demVote) # equivalent to below Rsyntax, remember column nale is not character string, it's varaiable!
votes <- presidentialElections[, c("year", "demVote")]
View(votes)
select(presidentialElections, -south) # equivalent to below
select(presidentialElections, state:year)
pull(presidentialElections, state) # extract a column in dplyr, equivalent to R syntax below
presidentialElections$state
votes_colorado_2008 <- filter(presidentialElections, year == 2008, state == "Colorado") # to filter specific rows
print(votes_colorado_2008)
# rename a column
select(presidentialElections,demVote)
presidentialElections2 <- rename(presidentialElections, demvote = demVote)
View(presidentialElections2)

?rename #get help on rename

# to add column
presidentialElections <- mutate(
  presidentialElections,
  other_parties_vote = 100 - demVote,
  abs_vote_difference = abs(demVote - other_parties_vote)
)
View(presidentialElections)

# to arrange column
presidentialElections <- arrange(
  presidentialElections,
  desc(year), # equivalent to - year, arrange "year" column in decreasing order
  demVote # arrange "demVote" order in increasing order
)
View(presidentialElections)


# to summarise a column by using mean, median, or max
average_vote <- summarise(
  presidentialElections,
  mean_demVote = mean(demVote), # equivalent to - year, arrange "year" column in decreasing order
  mean_other_parties_vote = mean(other_parties_vote) # arrange "demVote" order in increasing order
)




# if a data frame has row names (presidentialElections doesn't have row names), you can use bleow line to add rownames as new column 
# df <- mutate(df, row_names = rownames(df))



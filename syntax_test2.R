######### DPLYR & USE REAL DATA SETS ##################
########################################################

# install dplyr
install.packages("dplyr")
library("dplyr")

install.packages("tidyverse") # this package includes ggplot2 for visualisation
library("tidyverse")

# # instal one real data frame example # #
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


K# to summarise a column by using mean, median, or max
average_vote <- summarise(
  presidentialElections,
  mean_demVote = mean(demVote), # equivalent to - year, arrange "year" column in decreasing order
  mean_other_parties_vote = mean(other_parties_vote) # arrange "demVote" order in increasing order
)

# define a function to call a vector, perform a task on that, and use that function in summarise  
furthest_from_50 <- function(vec) {
  adjusted_values <- vec - 50
  vec[abs(adjusted_values) == max(abs(adjusted_values))]
}
summarise(
  presidentialElections,
  biggest_landslide = furthest_from_50(demVote)
)

# call function within function without adding extra variables, start from the most inner function to the outest function
most_demvote_state_2008 <- select(
  filter( 
    filter(
      presidentialElections,
      year == 2008
    ),
    demVote == max(demVote)
  ),
  state
)

# The Pipe operator (%>%): an equivalent for above lines is using "pipe" lines blow, in this case we start from inner function compared to the baove method
most_demvote_state_2008 <- presidentialElections %>%
  filter(year == 2008) %>%
  filter(demVote == max(demVote)) %>%
  select(state)
print(most_demvote_state_2008)

# if a data frame has row names (presidentialElections doesn't have row names), you can use bleow line to add rownames as new column 
# df <- mutate(df, row_names = rownames(df))

# grouping rows
state_vote_summary <- presidentialElections %>%
  group_by(state) %>%
  summarise(
    mean_demVote = mean(demVote),
    mean_demVotedf = as.data.frame(mean_demVote), # return as data frame
    mean_other_parties_vote = mean (other_parties_vote),
    mean_other_parties_votedf = as.data.frame(mean_other_parties_vote) # return as data frame
  )

# joining data frames together, remmber that for each added csv file after saving go: Session/Set Working Directory/To Source File Location
Donations <- read.csv("Donations.csv", stringsAsFactors = FALSE) # use stringsAsFactors to make sure strig data is a vector rather than a factor
View(Donations)

Donors <- read.csv("Donors.csv", stringsAsFactors = FALSE) # use stringsAsFactors to make sure strig data is a vector rather than a factor
View(Donors)

# donations data frame is base, donors is added
combined_data1 <- left_join(Donations, Donors, by = "donor_name")
View(combined_data1)

# donors data frame is base, donations is added
combined_data2 <- right_join(Donations, Donors, by = "donor_name")
View(combined_data2)

# only common data between 2 data frames are created
combined_data3 <- inner_join(Donations, Donors, by = "donor_name")
View(combined_data3)

# all of data in 2 data frames are joined together
combined_data4 <- full_join(Donations, Donors, by = "donor_name")
View(combined_data4)

# # instal second real data frame example ##
install.packages("nycflights13")
library("nycflights13")

??flights # get help on the data frame information
dim(flights) # dimensions of the "flights" data set
colnames(flights) # column names
View(flights)
View(airlines) #another data frame containing the full name for the airlines

has_most_delays <- flights %>%
  group_by(carrier) %>%
  filter(dep_delay > 0) %>%
  summarise(num_delay = n()) %>%
  filter(num_delay == max(num_delay)) %>%
  select(carrier)
print(has_most_delays) # returns UA

# find the full name for the abbriviated UA name returned above
most_delayed_name <- has_most_delays %>%
  left_join(airlines, by = "carrier") %>%
  select(name)
print(most_delayed_name$name) # returns "United Air Lines Inc."

most_early <- flights %>%
  group_by(dest) %>%
  summarise(delay = mean(arr_delay))
View(most_early) # few rows of NA rturned, to remove NA use  summarise(delay = mean(arr_delay, na.rm = TRUE))
  
# repeat above with removed NA 
most_early <- flights %>%
  group_by(dest) %>%
  summarise(delay = mean(arr_delay, na.rm = TRUE))
View(most_early)

View(airports)

most_early <- flights %>%
  group_by(dest) %>%
  summarise(delay = mean(arr_delay, na.rm = TRUE)) %>%
  filter(delay == min(delay, na.rm = TRUE)) %>%
  select(dest, delay) %>%
  left_join(airports, by = c("dest" = "faa")) %>% # the column name in "airports" and "flights" data frames are different for names of destinations
  select(dest, name, delay)
print(most_early)

most_early <- flights %>%
  group_by(month) %>%
  summarise(delay = mean(arr_delay, na.rm = TRUE)) %>%
  filter(delay == max(delay, na.rm = TRUE)) %>%
  select(month) %>%
  print() #print the tibble directly, return: # A tibble: 1 x 1 month <int> 1     7

most_early <- flights %>%
  group_by(month) %>%
  summarise(delay = mean(arr_delay, na.rm = TRUE)) %>%
  filter(delay == max(delay, na.rm = TRUE)) %>%
  select(delay) %>%
  mutate(month = month.name) 












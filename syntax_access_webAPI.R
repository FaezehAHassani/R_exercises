######## ACCESS WEB API ###########

##### Install packages ###########
install.packages("tidyverse") # this package includes ggplot2 for visualisation
library("tidyverse")


install.packages("httr") # load data from your browser to R
library("httr")

install.packages("jsonlite") # convert JSON data to R data
library("jsonlite")

library("dplyr")

install.packages("ggrepel")
library("ggrepel")

install.packages("ggmap")
library("ggmap")

install.packages("devtools")
library("devtools")
library(rjson)
library(digest)
library(glue)

devtools::install_github("dkahle/ggmap", ref = "tidyup", force = TRUE)
library("ggmap")

######## Get data from web API ############

url <- "https://api.github.com/search/repositories?q=dplyr&sort=forks" # the URI to access data, this can be also typed in the web browser to see the data
response <- GET(url) # return data using HTTP GET request

# an equivalent to above with an easier style for reading and updating
base_uri <- "https://api.github.com"
endpoint <- "/search/repositories"
resource_url <- paste0(base_uri, endpoint)
query_params <- list(q = "dplyr", sort = "forks")
response <- GET(resource_url, query = query_params)
print(response) # return Date, Status, Content-Type, and Size that is called "response header"
response_text <- content(response, type = "text") # open requested data without allowing hhtps to midify it
print(response_text)

response_data <- fromJSON(response_text)       # convert JSON string to list
print(response_data) # difficult to read as you should scroll => View() is better
View(response_data) # easier to read
is.data.frame(response_data) # to see if fromJSON data is data frame that returns FALSE
names(response_data) # return the keys of the list, returns: "total_count"        "incomplete_results" "items" therefore use the command below

items <- response_data$items
is.data.frame(items) # rturns TRUE, so this is the data that we can work with in R
View(items)

# make a data farme as a column within a dataframe (BAD IDEA) then flatten it as a single data frame
people <- data.frame(names = c("Ed", "Jessica", "Kegan"))
favourites <- data.frame(
  food = c("Pizza", "Pasta", "Salad"),
  music = c("Bluegrass", "Indie", "Electronic" )
)
people$favourites <- favourites
print(people) # return 3 columns: names, favourites.food, favourites.music
people$favourites.food # but actually the column favourites.food does not exists and returns NULL
people$favourites$food # this exist and return Pasta, Pizza, Salad => therefore we should flatten people data frame

peaople <- flatten(people)
peaople$favourites.food # returns Pasta, Pizza, Salad
  
###### Yelp Fusion API ##########
# to get the path to a file, go to the dirctory holding the file, in terminal use pwd
source("/Users/faezeh/desktop/r_project_private/access_API_keys.R") # in terminal use for renaming a file name: mv old_file_name new_file_name 


base_uri <- "https://api.yelp.com/v3"  
endpoint <- "/businesses/search"
search_uri <- paste0(base_uri, endpoint)
  
query_params <- list(
  term = "restuarant",
  categories = "cuban",
  location = "Seattle, WA",
  sort_by = "rating",
  radius = 8000
)

response <- GET(
  search_uri,
  query = query_params,
  add_headers(Authorization = paste("bearer", yelp_key))
)

response_text<- content(response, type = "text")
response_data <- fromJSON(response_text)
names(response_data) #return "businesses" "total"      "region" 

rest <- flatten(response_data$businesses)

rest2 <- rest %>%
  mutate(rank = row_number()) %>%
  mutate(name_and_rank = paste0(rank, ".", name))

##### google map
source("/Users/faezeh/desktop/r_project_private/access_API_keys.R")
register_google(key = "googlemap_key")

base_map <- ggmap(get_map(location = c(-122.3, 47.60))) # this gives error since now google map requires API key, therefore above lines are added; location = c(-122.3, 47.60) (i.e. center of map) is equivalent to location = "Seattle, WA"

base_map +
  geom_label_repel(
    data = response_data,
    aes(x = coordinates.longitude, y = coordinates.latitude, label = name_and_rank)
  )

##### help commands
? paste0
?register_google
? ggmap
?get_map
?get_googlemap

######## ACCESS WEB API ###########

##### Install packages ###########
install.packages("httr")
library("httr")

######## Get data from web API ############

url <- "https://api.github.com/search/repositories?q=dplyr&sort=forks" # the URI to access data, this can be also typed in the web browser to see the data
response <- GET(url) # return data using HTTP GET request

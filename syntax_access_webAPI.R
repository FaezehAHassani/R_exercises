######## ACCESS WEB API ###########

##### Install packages ###########
install.packages("httr")
library("httr")

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

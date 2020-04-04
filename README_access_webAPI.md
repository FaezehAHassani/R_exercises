# Accessing web API

- Accessing data form a remote server on web (via URL)
- Web services allow computer program like R to access data by offering an application programming interface (API)

 - API is an interface that allows communication between two different systems
 - For example, the functions in `dplyr` package make the API for this package

- Many web services use a particular style for _where_ and _how_ their data be accessed, and that style is REpresentational State Transfer (REST)
- The functions used by web services foe allowing data access to computers are in the form of HTTPS (**H**yper**T**ext **T**ransfer **P**rotocol) requests
- The web service response to the computer is in HTML format
- Companies like **Twitter, iTunes, and Reddit** make their data open to public through an API

# REST
- URI (Uniform Resource Identifier) is a generalised version of URL, commonly considered as **web address**

`https://domain.com:999/example/page/type=husky&name=dub#nose`
 scheme.....domain.......port....path................query...........................fragment
- domain/base URI and path/endpoint and query are the important sections of above URI format
- The JSON (JavaScript Object Notation) format data returned from a web API might be messy but if you install JSONView you get a cleaner version of data
- Example: `https://api.github.com/search/repositories?q=dplyr&sort=forks`, this will return data in JASON format. You can load this data to R by "httr" package
- Many web services issue _access tokens_ also called **API keys** for users access

# HTTP verbs
- GET: return a resource
- POST: insert a record
- PUT: update resource
- DELETE: remove a resource
- OPTIONS: return the methods that can be applied to the resource

# JSON versus R syntax
JSON presents list of rows while data frame presents list of columns

## JSON
{
  "first_name": "Ada",
  "job": "Programmer",
  "pets": ["Magnet", "Mocha", "Anni", "Fifi"] => comment: make a vector within a list
  "salary": 78000,
  "in_union": true,
  "favourites": {
    "music": "jazz",
    "food": "pizza",
  }
}
## R
list(
  first_name = "Ada",
  job = "Programmer",
  pets = c("Magnet", "Mocha", "Anni", "Fifi")
  salary = 78000,
  in_union = TRUE,
  favourites = list(music = "jazz", food = "pizza")
  )

## Array in JSON
["Aardvark", "Baboon", "Camel"]
### Array of lists
[
 {"country": "Brazil", "titles": 5, "total_losses": 17}
 {"country": "Netherland", "titles": 8, "total_losses": 10}
]

## Array in R
list("Aardvark", "Baboon", "Camel")
### Array of lists
list(
  list(country = "Brazil", titles = 5, total_losses = 17),
  list(country = "Netherland", titles = 8, total_losses = 10)
)

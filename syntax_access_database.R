########### ACCESS DATABASE USING R #####################

###### Install packages #############
install.packages("dbplyr")
library("DBI")
library("dplyr")

install.packages("RSQLite")
library("RSQLite")

install.packages("RPostgreSQL")
library("RPostgreSQL")
#################################
#####I don't yet have a database to connect to, therefore, below commands cannot be run yet! ########

# coonect and discinnect from a RDMS (e.g. SQLite) to access a database through it from R
db_connection <- dbConnect(SQLite(), dbname = "path/to/databased.sqlite")

# after finishing using database you should disconnect 
dbDisconnect(db_connection)

# after you connect to a database, you can use below command to make sure you are connected
dbListTables()

# e.g. access to table: songs in a database, an example table is made in README_database
songs_table <- tbl(db_connection, "songs")

# a query from above accessed table, this only show you a portion of the table and do not download it to your machine
queen_songs_query <- songs_table %>%
  filter(artist_id == 11) %>%
  select(title)

# by below R command you can see the equivalent SQL syntax
show_query(queen_songs_query) 
# this command return:
# <SQL>
# SELECT 'title'
# FROM 'songs'
# WHERE ('artist_id" = 11.0)

# to download table from database on the macine as a tibble and convert it to a data frame using as.data.frame ()
queen_songs_query <- collect(queen_songs_query) # return a tibble

# follow below steps each time you are collecting data from a database
db_connection <- dbConnect(SQLite(), dbname = "path/to/database.sqlite")
some_table <- tbl(db_connection, "table name")
db_query <- some_table %>%
  filter(some_column == some_value)
results <- collect(db_query)
dbDisconnect(db_connection)
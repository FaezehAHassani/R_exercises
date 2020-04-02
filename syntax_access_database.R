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

# a query from above accessed table
queen_songs_query <- songs_table %>%
  filter(artist_id == 11) %>%
  select(title)


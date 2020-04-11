########## ggplot2 ##########

install.packages("ggplot2")
library("ggplot2")

install.packages("hexbin")
library("hexbin")

####### plotting midwest built-in data set within ggplot2 #####
View(midwest)

ggplot(midwest) +  # this will plot a blank canvas, the layers on canvas are added with "+"
  geom_point(mapping = aes( # there are a list of geom_functions that can be called by geom_"some function", here geom_point present each data point with a dot
    x = percollege, y = percadultpoverty # aes define x and y axis, if the labels are strings you can use aes_string() instead
  ))

ggplot(midwest) +
  geom_col(mapping = aes(x = state, y = poptotal))

ggplot(data = midwest) +
  geom_hex(mapping = aes(x = percollege, y = percadultpoverty)) # error: Package `hexbin` required for `stat_binhex`, so installed package above

ggplot(data = midwest) +
  geom_point(mapping = aes(x = percollege, y = percadultpoverty)) +
  geom_smooth(mapping = aes(x = percollege, y = percadultpoverty))

#### if we have two or more geom_functions that share the same mapping we can use below
ggplot(data = midwest, mapping = aes(x = percollege, y = percadultpoverty)) +
  geom_point() +
  geom_smooth() +
  geom_point(mapping = aes(y = percchildbelowpovert)) # this geometry uses x from ggploy but uses this y instead hoever the y-axis label is still the original ggploy y-axis name
          
# use aesthetic mapping for coloring some data
ggplot(data = midwest) +
  geom_point(
    mapping = aes(x = percollege, y = percadultpoverty, color = state) # this will dedicate a color for each state name in column "state"
  )

ggplot(data = midwest) +
  geom_point(mapping = aes(x = percollege, y = percadultpoverty), color = "red", size = 0.3) # this will color each data point red with a size of 0.3



####### help commands
? midwest

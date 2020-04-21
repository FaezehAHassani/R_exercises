########## ggplot2 ##########

install.packages("ggplot2")
library("ggplot2")

install.packages("hexbin")
library("hexbin")

library("dplyr")

library("tidyr")

library("ggrepel")

install.packages("maps")
library("maps")

install.packages("mapproj")
library("mapproj")

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

# using dplyr and tidyr commands to wrangle data and prepare the data order required for a specific ggplotting
state_race_long <- midwest %>%
  select(state, popwhite, popblack, popamerindian, popasian, popother) %>%
  gather(key = race, value = population, -state)
View(state_race_long)
# create stacked bar chart
ggplot(state_race_long) +
  geom_col(mapping = aes(x = state, y =population, fill = race)) # fill will collor inside the bar whereas color only color the data point

# the above plot overlap the population for all races in each state but in order to avoid overlap we can use filling to 100% by using position = "fill"
ggplot(state_race_long) +
  geom_col(mapping = aes(x = state, y = population, fill = race), position = "fill")

# comparitively you can seperate the population for each reace in each state seperately besides each other by using position = 
"dodge"
ggplot(state_race_long) +
  geom_col(mapping = aes(x = state, y = population, fill = race), position = "dodge")

# use a specific scale and limit for plots; make two plots with same coloring and scale for an easier comparison
labeled <- midwest %>%
  mutate(location = if_else(inmetro == 0, "Rural", "Urban")) # if inmtero is equal to zero put it as "Rural" in the location new column otherwise put as "Urban"
View(labeled)

wisconsin_data <- labeled %>% filter(state == "WI")
View(wisconsin_data)

michigan_data <- labeled %>% filter(state == "MI")
View(michigan_data)

x_scale <- scale_x_continuous(limits = range(labeled$percollege))
y_scale <- scale_y_continuous(limits = range(labeled$percadultpoverty))
color_scale <- scale_color_discrete(limits = unique(labeled$location)) # define discrete color for a unique set of urban/rural in location column

ggplot(wisconsin_data) +
  geom_point(mapping = aes(x = percollege, y = percadultpoverty, color = location)) +
  x_scale +
  y_scale +
  color_scale

ggplot(michigan_data) +
  geom_point(mapping = aes(x = percollege, y = percadultpoverty, color = location)) +
  x_scale +
  y_scale +
  color_scale

# use ColorBrewer palettes for coloring in your plot
ggplot(midwest) +
  geom_point(
    mapping = aes(x = percollege, y = percadultpoverty, color = state)
  ) +
  scale_color_brewer(palette =  "Set3")  # use Set3 color palette

# create horizontal bar chart
top_10 <- midwest %>%
  top_n(10, wt = poptotal) %>% # use top_n to filter top 10 populous county in poptotal column
  unite(county_state, county, state, sep = ",") %>% # use unite to combine two columns
  arrange(poptotal)%>% # sort data by population
  mutate(location = factor(county_state, county_state)) # to define factor based on cathegory variable of county_state

ggplot(top_10) +
  geom_col(mapping = aes(x = location, y = poptotal)) + # instead of changiing x and y we will use coord_flip to filp x and y-axis
  coord_flip()

View(top_10)

# create facet based on state column as the categorical variable
labeled <- midwest %>%
  mutate(location = if_else(inmetro == 0, "Rural", "Urban"))

ggplot(labeled) +
  geom_point(mapping = aes(x = percollege, y = percadultpoverty, color = location), alpha = 0.6) +
  facet_wrap(~state) # ~"column name" means use this column to make facets based on it
  
# labels and annotations
ggplot(labeled) +
  geom_point(mapping = aes(x = percollege, y = percadultpoverty, color = location), alpha = 0.6) +
  labs(   # to add title and x, and y-axis labels
    title = "Percent College Educated versus Poverty Rates",
    x = "Percentage of collge Educated Adults",
    y = "Percentage of Adults Living in Poverty",
    color = "Urbanity" #rename the legend title from column name "location" to "Urbanity"
    )

most_poverty <- midwest %>%
  group_by(state) %>%
  top_n(1, wt = percadultpoverty) %>%  # select the highest poverty county in each state
  unite(county_state, county, state, sep = ", ")
View(most_poverty)

subtitle <- "(the county with the highest level of poverty in each state is labeled"  # adding subtitle to thr plot title

ggplot(data = labeled, mapping = aes(x = percollege, y = percadultpoverty))  +
  geom_point(mapping = aes(color = location), alpha = 0.6) +
  geom_label_repel(
    data = most_poverty,
    mapping = aes(label = county_state),
    alpha = 0.8
  ) +
  scale_x_continuous(limits = c(0, 55)) +
  labs(
    title = "Percentage of College Educated Adults versus Poverty Rates",
    subtitle = subtitle,  # defined above
    x = "Percentage of College Educated Adults",
    y = "Percentage of Adults Living in Poverty",
    color = "Urbanity"
  )

# maps
state_shape <- map_data("state") # load a shapefile, need to intsall "maps" and "mapproj" packages
View(state_shape)

ggplot(state_shape) + # create a blank map of US states
  geom_polygon(
    mapping = aes(x = long, y = lat, group = group),
    color = "white", # outline color for states
    size = 0.1
  ) + 
  coord_map() # use a map-based coordinate system

# maps by using Evication lab data
# dowload states.csv from https://evictionlab.org, each state has a seperate states.csv file
evictions_alabama <- read.csv("~/Desktop/r_project/data/Alabama.csv", stringsAsFactors = FALSE) 
evictions_arizona <- read.csv("~/Desktop/r_project/data/Arizona.csv", stringsAsFactors = FALSE) 
evictions_delaware <- read.csv("~/Desktop/r_project/data/Delaware.csv", stringsAsFactors = FALSE)
evictions_california <- read.csv("~/Desktop/r_project/data/California.csv", stringsAsFactors = FALSE)
evictions_colorado <- read.csv("~/Desktop/r_project/data/Colorado.csv", stringsAsFactors = FALSE)
evictions_connectticut <- read.csv("~/Desktop/r_project/data/Connecticut.csv", stringsAsFactors = FALSE)
evictions_florida <- read.csv("~/Desktop/r_project/data/Florida.csv", stringsAsFactors = FALSE)
evictions_georgia <- read.csv("~/Desktop/r_project/data/Georgia.csv", stringsAsFactors = FALSE)
evictions_westvirginia <- read.csv("~/Desktop/r_project/data/WestVirginia.csv", stringsAsFactors = FALSE)
evictions_wisconsin <- read.csv("~/Desktop/r_project/data/Wisconsin.csv", stringsAsFactors = FALSE)
evictions <- rbind(evictions_alabama, evictions_arizona, evictions_delaware, evictions_california, evictions_colorado, evictions_connectticut, evictions_florida, evictions_georgia, evictions_westvirginia, evictions_wisconsin) %>% # add several dataset vertically
  filter(year == 2016) %>%
  mutate(name = tolower(name)) %>% #make state names lowercase to match with US shapefile
  rename(state = name)

# join evication data to US shapefile
state_shape <- map_data("state") %>%
  rename(state = region) %>%
  left_join(evictions, by="state")

state_shape$eviction.rate

# define a minimalist theme for maps
blank_theme <- theme_bw() +
  theme(
    axis.line = element_blank(),
    axis.text = element_blank(),
    axis.ticks = element_blank(),
    axis.title = element_blank(),
    plot.background = element_blank(),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    panel.border = element_blank()
  )

ggplot(state_shape) +
  geom_polygon(mapping = aes(x = long, y = lat, group = group, fill = eviction.rate),
               color = "white", # show states outlines
               size = 0.1) + # outline thickness
  coord_map() +
  scale_fill_continuous(low = "#132B43", high = "red") +
  labs(fill = "Evication rate") +
  blank_theme  # by adding this and defined below codes we can remove axis-line

# dot distribution maps
# add dots to specific states
cities <- data.frame(
  city = c("Seattle", "Denver"),
  lat = c(47.6062, 39.7392),
  long = c(-122.3321, -104.9903)
)

# draw state outline, then plot dots
ggplot(state_shape) +
  geom_polygon(mapping = aes(x = long, y = lat, group = group)) +
  geom_point(
    data = cities,
    mapping = aes(x = long, y = lat),
    color ="red"
  ) +
  coord_map()


####### help commands
? midwest
? gather
? factor
? tolower





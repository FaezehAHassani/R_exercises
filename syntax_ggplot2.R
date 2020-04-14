########## ggplot2 ##########

install.packages("ggplot2")
library("ggplot2")

install.packages("hexbin")
library("hexbin")

library("dplyr")

library("tidyr")

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
         
         
  
####### help commands
? midwest
? gather
? factor




########## Reporting with RMarkdown, remember to open and run XQuartz when call this file in .Rmd to be able to open View() function##########
library("dplyr")




####### plotting Worldbank data from https://data.worldbank.org/indicator/SP.DYN.LE00.IN #####
life_exp <- read.csv(
  "data/API_SP.DYN.LE00.IN_DS2_en_csv_v2_1068806.csv",
  skip =4, stringsAsFactors = FALSE # skip first 4 rows
)

View(life_exp)

# find the country with longest life expectancy in 2015
longest_le <- life_exp %>%
  filter(X2015 == max(X2015, na.rm = T)) %>%
  select(Country.Name, X2015) %>%
  mutate(expectancy = round(X2015, 1))

View(longest_le)

# add a table on 10 countries with greatest gain in life expectancy
top_10_gain <- life_exp %>%
  mutate(gain = X2015 - X1960) %>%
  top_n(10, wt = gain) %>% # to filter top 10
  arrange(-gain) %>% # sort gain column from big to small
  mutate(gain_str = paste(format(round(gain, 1), nsmall =1), "years"))
  
View(top_10_gain)


  
  select(Country.Name, gain_formatted)


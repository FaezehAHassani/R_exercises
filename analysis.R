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

########## Reporting with RMarkdown ##########





####### plotting Worldbank data from https://data.worldbank.org/indicator/SP.DYN.LE00.IN #####
life_exp <- read.csv(
  "data/API_SP.DYN.LE00.IN_DS2_en_csv_v2_1068806.csv",
  skip =4, stringsAsFactors = FALSE
)

View(life_exp)

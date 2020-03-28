######### TIDYR ##################
########################################################

# import a built csv
band_data_wide <- read.csv("band_data_wide.csv", stringsAsFactors = FALSE)
View(band_data_wide)

# convert wide format data frame to long format data frame
band_data_long <- gather( # gather cells from band_data_wide data frame
  band_data_wide,
  key = band, # new column
  value = price, # new column
  -city # column that data from band_wide_wide are sorted based on, similar to select() in deplyr package
)
View(band_data_long)

filter(band_data_long, band == "greensky_bluegrass") # to filter cells on greansky_bluegrass from the band_data_long data frame

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

# reshape long data to wide data
price_by_band <- spread(
  band_data_long,
  key = city,
  value = price,
)
View(price_by_band)

band_data_long_v2 <- unite(band_data_long, band, sep = "_", remove = TRUE, na.rm = FALSE) # return e.g. seattle_greensky_bluegrass_40 for each row
View(band_data_long_v2)

? unite # help on command "unite"

band_data_long_v3 <- separate(band_data_long, band, "band_short", sep = "_", remove = TRUE, convert = FALSE) # return shortened band names
View(band_data_long_v3)         

? separate
  
wb_data <- read.csv(
  "world_bank_data.csv",
  stringsAsFactors = F,
  skip = 5 # to skip the first 5 rows of data
  )
View(wb_data)




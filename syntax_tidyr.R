######### TIDYR ##################
########################################################
# install dplyr
install.packages("dplyr")
library("dplyr")

install.packages("tidyverse") # this package includes ggplot2 for visualisation
library("tidyverse")

install.packages("ggrepel") # to define geom_text_repel command
library("ggrepel")

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

#### load new csv file ####
  
wb_data <- read.csv(
  "world_bank_data.csv",
  stringsAsFactors = F
  # skip = 3 to skip the first 5 rows of data
  )
View(wb_data)



indicator_of_interest <- "Government expenditure on education, US$ (millions)"
expenditure_plot_data <- wb_data %>%
  # rename(indicator = Series) %>%
  #rename(X2010 = X2010..YR2010.) %>%
  #rename(X2013 = X2013..YR2013.) %>%
  #rename(X2014 = X2014..YR2014.) %>%
  #rename(X2015 = X2015..YR2015.) %>%
  #rename(X2016 = X2016..YR2016.) %>%
  #rename(X2017 = X2017..YR2017.) %>%
  #rename(X2018 = X2018..YR2018.) %>%
  filter(Series == indicator_of_interest)
View(expenditure_plot_data)

# is.data.frame(expenditure_plot_data) return TRUE



expenditure_chart <- ggplot(data = expenditure_plot_data) +
 geom_text( # add text on data points
 mapping = aes(x = X2010..YR2010. / 100, y = X2018..YR2018. / 100, label = Country.Code)) +
 scale_x_continuous(labels = "_") + # for continuoes values
 scale_y_continuous(labels = "_") +
 labs(title = indicator_of_interest, x = "Expenditure 2010", y = "Expenditure 2018") 
 
 # ? aes #aesthetic mapping
# ? geom_tex
# ? labels
# ? scale_x_continuous
# ? ggproto
 
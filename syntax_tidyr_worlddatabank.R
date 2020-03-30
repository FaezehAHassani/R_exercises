######### TIDYR ##################
########################################################
# install dplyr
install.packages("dplyr")
library("dplyr")

install.packages("tidyverse") # this package includes ggplot2 for visualisation
library("tidyverse")

install.packages("ggrepel") # to define geom_text_repel command
library("ggrepel")

# replace a cell value in df with NA
install.packages("naniar")
library("naniar")

library('scales') # adding this library removed the error: Error in check_breaks_labels(breaks, labels) : object 'percent' not found

############## load new csv file ############################
  
wb_data <- read.csv(
  "world_bank_data.csv",
  stringsAsFactors = F
  # skip = 3 to skip the first 5 rows of data
  )
View(wb_data)

indicator_of_interest <- "Government expenditure on education, US$ (millions)"
expenditure_plot_data <- wb_data %>%
 rename(indicator = Series) %>%
 rename(X2010 = X2010..YR2010.) %>%
 rename(X2013 = X2013..YR2013.) %>%
 rename(X2014 = X2014..YR2014.) %>%
 rename(X2015 = X2015..YR2015.) %>%
 rename(X2016 = X2016..YR2016.) %>%
 rename(X2017 = X2017..YR2017.) %>%
 rename(X2018 = X2018..YR2018.) %>%
 filter(indicator == indicator_of_interest)

# to replce ".." valuses in the data frame to NA
expenditure_plot_data <- expenditure_plot_data %>%  
 replace_with_na(replace = list(X2010 = c(".."))) %>%
 replace_with_na(replace = list(X2013 = c(".."))) %>%
 replace_with_na(replace = list(X2014 = c(".."))) %>%
 replace_with_na(replace = list(X2015 = c(".."))) %>%
 replace_with_na(replace = list(X2016 = c(".."))) %>%
 replace_with_na(replace = list(X2017 = c(".."))) %>%
 replace_with_na(replace = list(X2018 = c("..")))

View(expenditure_plot_data)

# remove NA from data
expenditure_plot_data_noNA <- expenditure_plot_data %>% 
 drop_na(X2010) %>% 
 drop_na(X2013) %>% 
 drop_na(X2014) %>% 
 drop_na(X2015) %>% 
 drop_na(X2016) %>% 
 drop_na(X2017) %>% 
 drop_na(X2018)  
  
View(expenditure_plot_data_noNA)

# plot
expenditure_chart <- ggplot(data = expenditure_plot_data) +
 #geom_point() + # add dots for data points
 geom_text_repel( # add text on data points
  mapping = aes(x = X2010 / 100, y = X2018 / 100, label = Country.Code)
 ) +
 scale_x_continuous(labels = percent) + 
 scale_y_continuous(labels = percent) +
 labs(title = indicator_of_interest, y = "Expenditure 2018", x = "Expenditure 2010")

options(max.print = 99999) # when the number of points are alot it the show() command return the error of reaching mx.print, this command increase the maximum number
show(expenditure_plot_data)


# is.data.frame(expenditure_plot_data) return TRUE
# ? aes #aesthetic mapping
# ? geom_tex
# ? labels
# ? scale_x_continuous
# ? ggproto



 
# Sourcing data from TidyTuesday Github
# https://github.com/rfordatascience/tidytuesday/blob/main/data/2024/2024-12-03/readme.md

install.packages("tidytuesdayR")
install.packages("lubridate")
install.packages("dplyr")

library(dplyr)
library(lubridate)

tuesdata <- tidytuesdayR::tt_load('2024-12-03')
A64_traffic <- tuesdata$A64_traffic
View(A64_traffic)

#Filtering
# Extract all observations from A64_traffic where traffic_volume is greater than 1000.
A64_traffic |>
  filter('Total Volume'>1000)

#Arranging
# Order the A64_traffic dataset by time in ascending order.
# Since the data in the feature 'Time Period Ending' is in HH:MM:SS format, we use Posixct format
A64_traffic |>
  mutate(seconds = hour(hms(`Time Period Ending`)) * 3600 + minute(hms(`Time Period Ending`)) * 60 + second(hms(`Time Period Ending`)))

#Selecting
# Select only the date, time, and speed columns.
A64_traffic |>
  select(`Report Date`,`Time Period Ending`, `Avg mph`)

#Renaming
# Rename the traffic_volume column to vehicle_count
A64_traffic |>
  rename(vehicle_count= `Total Volume`) |>
  select(vehicle_count)

#Creating a new column
# Create a new column called is_day that is TRUE if the hour_of_day is between 6 and 18, and FALSE otherwise.
A64_hours <- lubridate::hour(A64_traffic$`Time Period Ending`)

A64_traffic |>
  mutate(hourofday = hour(hms(`Time Period Ending`))) |>
  mutate(is_day= between(hourofday,6,18), .before=1)

A64_traffic

#Filtering with %in%:
# Extract observations where the month is "January", "June", and "December". 
A64_traffic <- A64_traffic |>
  mutate(month = month(`Report Date`)) |>
  mutate(month_name = month.name[month])
A64_traffic$month_name
A64_traffic |>
  count(month_name)
A64_traffic |>
  filter(month_name %in% c('May'))

#Rearranging Columns:
# Move the speed column to the end of the data frame.
A64_traffic <- A64_traffic |>
  relocate(`Avg mph`, .after = last_col())

#Finding Unique Combinations:
#  Find all unique values in the SiteId column.
A64_traffic |>
  count(SiteId)

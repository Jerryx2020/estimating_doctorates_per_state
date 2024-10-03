#### Preamble ####
# Purpose: Processes IPUMS 2022 ACS data to count the number of doctoral degree holders per state from a CSV file
# Author: Jerry Xia
# Date: 3 October 2024
# Contact: Jerry.xia@mail.utoronto.ca
# License: MIT
# Pre-requisites: IPUMS 2022 ACS data in CSV format saved as 'usa_00001.csv' in the 'data/raw_data' folder
# Any other information needed? Ensure that the necessary packages are installed, such as 'dplyr'# Check unique values in the 'EDUCD' column

#### Workspace setup ####
# Load required libraries
# install.packages("dplyr")
library(dplyr)
library(readr)

#### Load data ####
# Load the IPUMS data from the 'data/raw_data' folder
data <- read_csv("data/raw_data/usa_00001.csv", show_col_types = FALSE)

#### Process data ####
# Filter the data for respondents with a doctoral degree using the 'EDUCD' column
doctoral_data <- data %>%
  filter(EDUCD == 116) %>%
  group_by(STATEICP) %>%
  summarise(doctoral_count = n())

#### Save processed data ####
# Save the processed data to a CSV file in the 'data/analysis_data' folder
write_csv(doctoral_data, "data/analysis_data/doctoral_count_by_state.csv")
#### Preamble ####
# Purpose: Uses the ratio estimators approach to estimate the total number of respondents per state based on the number of doctoral degree holders
# Author: Jerry Xia
# Date: 3 October 2024
# Contact: Jerry.xia@mail.utoronto.ca
# License: MIT
# Pre-requisites: Processed data of doctoral degree holders per state saved as 'doctoral_count_by_state.csv'
# Any other information needed? Known total number of respondents in California (391,171)

#### Workspace setup ####
# Load required libraries
library(dplyr)
library(readr)

#### Load processed data ####
# Load the previously processed data of doctoral degree holders per state
doctoral_data <- read_csv("data/analysis_data/doctoral_count_by_state.csv")

#### Load the full dataset to calculate the actual total respondents per state ####
# Assuming the full dataset is stored as 'data/raw_data/usa_00001.csv'
full_data <- read_csv("data/raw_data/usa_00001.csv")

#### Calculate actual totals for each state based on PERWT ####
# Group by STATEICP and sum the PERWT values (adjusted for implied decimals) to get the actual total per state
actual_totals <- full_data %>%
  group_by(STATEICP) %>%
  summarise(actual_total = sum(PERWT) / 100)  # Adjust for two implied decimal places

#### Known total for California ####
california_total <- 391171

#### Apply ratio estimators approach ####
# Filter out non-state codes (83, 96, 97, 98, 99)
doctoral_data <- doctoral_data %>%
  filter(!(STATEICP %in% c(83, 96, 97, 98, 99)))

# Extract the number of doctoral degree holders in California
california_doctoral <- doctoral_data %>% 
  filter(STATEICP == 71) %>%  # California state code is 71
  pull(doctoral_count)

#### Combine actual totals with doctoral data ####
# Join the actual total respondents to the doctoral data
doctoral_data <- doctoral_data %>%
  left_join(actual_totals, by = "STATEICP") %>%
  mutate(estimated_total = doctoral_count / california_doctoral * california_total)

#### Save estimated totals ####
write_csv(doctoral_data, "data/analysis_data/estimated_total_by_state.csv")

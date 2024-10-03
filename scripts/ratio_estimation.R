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

#### Set known total for California ####
# Known total number of respondents across all education levels in California
california_total <- 391171

#### Calculate ratio for California ####
# Filter out non-state codes (83, 96, 97, 98, 99)
doctoral_data <- doctoral_data %>%
  filter(!(STATEICP %in% c(83, 96, 97, 98, 99)))

# Extract the number of doctoral degree holders in California (Code: 71)
california_doctoral <- doctoral_data %>% 
  filter(STATEICP == 71) %>%  # Use code 71 for California
  pull(doctoral_count)

# Check if the value is correct
print(california_doctoral)

#### Apply the ratio estimators approach ####
# Use the ratio between the number of doctoral degree holders and the total respondents in California
doctoral_data <- doctoral_data %>%
  mutate(estimated_total = doctoral_count / california_doctoral * california_total)

#### Save estimated totals ####
write_csv(doctoral_data, "data/analysis_data/estimated_total_by_state.csv")
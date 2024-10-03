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
# install.packages("dplyr")
library(dplyr)

#### Load processed data ####
# Load the previously processed data of doctoral degree holders per state
doctoral_data <- read.csv("data/analysis_data/doctoral_count_by_state.csv")

#### Set known total for California ####
# Known total number of respondents across all education levels in California
california_total <- 391171

#### Calculate ratio for California ####
# Extract the number of doctoral degree holders in California from the data
california_doctoral <- doctoral_data %>% 
  filter(STATEICP == "california") %>% 
  pull(doctoral_count)

# Check if the value is correct
print(california_doctoral)

#### Apply the ratio estimators approach ####
# Use the ratio between the number of doctoral degree holders and the total respondents in California
# Apply this ratio to estimate the total respondents in each state
doctoral_data <- doctoral_data %>%
  mutate(estimated_total = doctoral_count / california_doctoral * california_total)

#### Save estimated totals ####
# Save the results with the estimated total number of respondents per state to a CSV file
write.csv(doctoral_data, "data/analysis_data/estimated_total_by_state.csv")

#!/usr/bin/env Rscript
# clean.R - Clean the iris dataset

suppressPackageStartupMessages(library(dplyr))
library(readr)

# Read raw data
iris_data <- read_csv("data/iris.csv", show_col_types = FALSE)

# Clean the data
iris_clean <- iris_data %>%
  tidyr::drop_na() %>%                     # Remove rows with missing values
  rename_with(tolower) %>%          # Standardize column names to lowercase
  mutate(id = row_number())         # Add a unique ID column

# Write cleaned data
write_csv(iris_clean, "data/iris_clean.csv")

cat("Data cleaning complete!\n")
cat(sprintf("  Original rows: %d\n", nrow(iris_data)))
cat(sprintf("  Cleaned rows: %d\n", nrow(iris_clean)))

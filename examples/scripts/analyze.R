#!/usr/bin/env Rscript
# analyze.R - Perform statistical analysis on iris dataset (tidyverse style)

suppressPackageStartupMessages(library(dplyr))
library(readr)
library(broom)

# Read cleaned data
iris_data <- read_csv("data/iris_clean.csv")

# 1. Summary statistics by species
summary_stats <- iris_data %>%
  group_by(species) %>%
  summarise(
    across(c(sepal_length, sepal_width, petal_length, petal_width),
           list(mean = mean, sd = sd),
           .names = "{.col}_{.fn}")
  )

# 2. Fit a simple linear model
model <- lm(sepal_length ~ petal_length + species, data = iris_data)
model_tidy <- tidy(model)
model_glance <- glance(model)

# Create output file
sink("results/model_summary.txt")

cat(strrep("=", 60), "\n")
cat("IRIS DATASET ANALYSIS\n")
cat(strrep("=", 60), "\n\n")

cat("Summary Statistics by Species:\n")
cat(strrep("-", 60), "\n")
print(summary_stats)

cat("\n\nLinear Model Results:\n")
cat(strrep("-", 60), "\n")
cat("Model: sepal_length ~ petal_length + species\n\n")
print(model_tidy)

cat("\nModel Fit Statistics:\n")
print(model_glance)

cat("\n", strrep("=", 60), "\n")
cat("Analysis complete!\n")

sink()

cat("Analysis results saved to results/model_summary.txt\n")

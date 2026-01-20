#!/usr/bin/env Rscript
# analyze.R - Perform statistical analysis on iris dataset

# Read cleaned data
iris_data <- read.csv("data/iris_clean.csv", stringsAsFactors = FALSE)

# Perform analysis
# 1. Summary statistics by species
summary_stats <- aggregate(
  cbind(sepal_length, sepal_width, petal_length, petal_width) ~ species,
  data = iris_data,
  FUN = function(x) c(mean = mean(x), sd = sd(x))
)

# 2. Fit a simple linear model
model <- lm(sepal_length ~ petal_length + species, data = iris_data)

# Create output file
sink("results/model_summary.txt")

cat(paste(rep("=", 60), collapse = ""), "\n")
cat("IRIS DATASET ANALYSIS\n")
cat(paste(rep("=", 60), collapse = ""), "\n\n")

cat("Summary Statistics by Species:\n")
cat(paste(rep("-", 60), collapse = ""), "\n")
print(summary_stats)

cat("\n\nLinear Model Results:\n")
cat(paste(rep("-", 60), collapse = ""), "\n")
cat("Model: sepal_length ~ petal_length + species\n\n")
print(summary(model))

cat("\n", paste(rep("=", 60), collapse = ""), "\n")
cat("Analysis complete!\n")

sink()

cat("Analysis results saved to results/model_summary.txt\n")

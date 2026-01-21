#!/usr/bin/env Rscript
# clean.R - Clean the iris dataset

# Read raw data
iris_data <- read.csv("data/iris.csv", stringsAsFactors = FALSE)

# Simple cleaning operations
# 1. Remove any rows with missing values
iris_clean <- na.omit(iris_data)

# 2. Standardize column names to lowercase
colnames(iris_clean) <- tolower(colnames(iris_clean))

# 3. Add a unique ID column
iris_clean$id <- seq_len(nrow(iris_clean))

# Write cleaned data
write.csv(iris_clean, "data/iris_clean.csv", row.names = FALSE)

cat("Data cleaning complete!\n")
cat(sprintf("  Original rows: %d\n", nrow(iris_data)))
cat(sprintf("  Cleaned rows: %d\n", nrow(iris_clean)))

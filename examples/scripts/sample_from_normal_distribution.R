#!/usr/bin/env Rscript
# sample_from_normal_distribution.R

# Set seed for reproducibility
set.seed(123)
# Parameters
# Mean and standard deviation
mu <- 10
sd <- 2

# Sample size
n <- 1000

# Generate random samples from normal distribution
samples <- rnorm(n, mean = mu, sd = sd)
# Save samples to a text file
sample_mean <- mean(samples)
write.table(sample_mean, file = "mean_normal_distribution.txt", row.names = FALSE, col.names = "Sample_Mean")
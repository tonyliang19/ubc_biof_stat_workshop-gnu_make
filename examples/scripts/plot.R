#!/usr/bin/env Rscript
# plot.R - Create visualizations from iris analysis (tidyverse style)

library(ggplot2)
library(patchwork)
library(readr)
library(magrittr)

# Read cleaned data
iris_data <- read_csv("data/iris_clean.csv", show_col_types = FALSE)



# Plot 1: Sepal Length vs Petal Length
p1 <- ggplot(iris_data, aes(x = petal_length, y = sepal_length, color = species)) +
  geom_point(size = 3) +
  labs(
    x = "Petal Length (cm)",
    y = "Sepal Length (cm)",
    title = "Sepal vs Petal Length"
  ) +
  theme_minimal()

# Plot 2: Sepal Width vs Petal Width
p2 <- ggplot(iris_data, aes(x = petal_width, y = sepal_width, color = species)) +
  geom_point(size = 3) +
  labs(
    x = "Petal Width (cm)",
    y = "Sepal Width (cm)",
    title = "Sepal vs Petal Width"
  ) +
  theme_minimal()

# Plot 3: Distribution of Sepal Length by Species
p3 <- ggplot(iris_data, aes(x = species, y = sepal_length, fill = species)) +
  geom_boxplot() +
  labs(
    x = "Species",
    y = "Sepal Length (cm)",
    title = "Sepal Length by Species"
  ) +
  scale_fill_manual(values = c("lightblue", "lightgreen", "lightcoral")) +
  theme_minimal() +
  theme(legend.position = "none")

# Plot 4: Distribution of Petal Length by Species
p4 <- ggplot(iris_data, aes(x = species, y = petal_length, fill = species)) +
  geom_boxplot() +
  labs(
    x = "Species",
    y = "Petal Length (cm)",
    title = "Petal Length by Species"
  ) +
  scale_fill_manual(values = c("lightblue", "lightgreen", "lightcoral")) +
  theme_minimal() +
  theme(legend.position = "none")

# Save all plots in a 2x2 grid
joined_plot <- (p1 | p2) / (p3 | p4) +
  plot_layout(guides = "collect")  # Collect all legends into one


ggsave("figures/iris_plot.png", joined_plot, width = 12, height = 8, dpi = 150)

cat("Plot saved to figures/iris_plot.png\n")


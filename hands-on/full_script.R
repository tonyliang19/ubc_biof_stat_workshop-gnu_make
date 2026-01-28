suppressPackageStartupMessages(library(dplyr))
library(readr)
library(broom)
library(ggplot2)
library(patchwork)

# Download data from internet
dest <- "data/iris.csv"
url <- "https://raw.githubusercontent.com/mwaskom/seaborn-data/master/iris.csv"
download.file(url, dest, quiet = FALSE)

# Read raw data
iris_clean <- read_csv("data/iris.csv", show_col_types = FALSE)

# Clean the data
iris_clean <- iris_clean %>%
  tidyr::drop_na() %>%                     # Remove rows with missing values
  rename_with(tolower) %>%          # Standardize column names to lowercase
  mutate(id = row_number())         # Add a unique ID column

# Write cleaned data
#write_csv(iris_clean, "data/iris_clean.csv")

cat("Data cleaning complete!\n")
cat(sprintf("  Original rows: %d\n", nrow(iris_clean)))
cat(sprintf("  Cleaned rows: %d\n", nrow(iris_clean)))


# Read cleaned data
#iris_clean <- read_csv("data/iris_clean.csv")

# 1. Summary statistics by species
summary_stats <- iris_clean %>%
  group_by(species) %>%
  summarise(
    across(c(sepal_length, sepal_width, petal_length, petal_width),
           list(mean = mean, sd = sd),
           .names = "{.col}_{.fn}")
  )

# 2. Fit a simple linear model
model <- lm(sepal_length ~ petal_length + species, data = iris_clean)
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

# Read cleaned data
#iris_clean <- read_csv("data/iris_clean.csv", show_col_types = FALSE)



# Plot 1: Sepal Length vs Petal Length
p1 <- ggplot(iris_clean, aes(x = petal_length, y = sepal_length, color = species)) +
  geom_point(size = 3) +
  labs(
    x = "Petal Length (cm)",
    y = "Sepal Length (cm)",
    title = "Sepal vs Petal Length"
  ) +
  theme_minimal()

# Plot 2: Sepal Width vs Petal Width
p2 <- ggplot(iris_clean, aes(x = petal_width, y = sepal_width, color = species)) +
  geom_point(size = 3) +
  labs(
    x = "Petal Width (cm)",
    y = "Sepal Width (cm)",
    title = "Sepal vs Petal Width"
  ) +
  theme_minimal()

# Plot 3: Distribution of Sepal Length by Species
p3 <- ggplot(iris_clean, aes(x = species, y = sepal_length, fill = species)) +
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
p4 <- ggplot(iris_clean, aes(x = species, y = petal_length, fill = species)) +
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


#!/usr/bin/env Rscript
# plot.R - Create visualizations from iris analysis

# Read cleaned data
iris_data <- read.csv("data/iris_clean.csv", stringsAsFactors = FALSE)

# Create a nice plot
png("figures/iris_plot.png", width = 800, height = 600, res = 100)

# Set up plotting parameters
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))

# Plot 1: Sepal Length vs Petal Length
plot(iris_data$petal_length, iris_data$sepal_length,
     col = as.factor(iris_data$species),
     pch = 19,
     xlab = "Petal Length (cm)",
     ylab = "Sepal Length (cm)",
     main = "Sepal vs Petal Length")
legend("topleft", legend = unique(iris_data$species),
       col = 1:3, pch = 19, cex = 0.8)

# Plot 2: Sepal Width vs Petal Width
plot(iris_data$petal_width, iris_data$sepal_width,
     col = as.factor(iris_data$species),
     pch = 19,
     xlab = "Petal Width (cm)",
     ylab = "Sepal Width (cm)",
     main = "Sepal vs Petal Width")

# Plot 3: Distribution of Sepal Length by Species
boxplot(sepal_length ~ species, data = iris_data,
        col = c("lightblue", "lightgreen", "lightcoral"),
        main = "Sepal Length by Species",
        ylab = "Sepal Length (cm)")

# Plot 4: Distribution of Petal Length by Species
boxplot(petal_length ~ species, data = iris_data,
        col = c("lightblue", "lightgreen", "lightcoral"),
        main = "Petal Length by Species",
        ylab = "Petal Length (cm)")

dev.off()

cat("Plot saved to figures/iris_plot.png\n")

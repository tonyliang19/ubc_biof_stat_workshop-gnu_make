# Example Makefile for GNU Make Workshop
# A simple data analysis pipeline

# Variables
R = Rscript
DATA_DIR = data
RESULTS_DIR = results
FIGURES_DIR = figures

# Targets
.PHONY: all clean help

# Help message (default target)
help:
	@echo "Available targets:"
	@echo "  all     - Build the complete pipeline"
	@echo "  clean   - Remove all generated files"
	@echo "  help    - Show this help message"

all: $(FIGURES_DIR)/iris_plot.png
# Download raw data
$(DATA_DIR)/iris.csv:
	@echo "Downloading data..."
	@mkdir -p $(DATA_DIR)
	curl -q -o $(DATA_DIR)/iris.csv \
	  https://raw.githubusercontent.com/mwaskom/seaborn-data/master/iris.csv

# Clean data
$(DATA_DIR)/iris_clean.csv: $(DATA_DIR)/iris.csv scripts/clean.R
	@echo "Cleaning data..."
	$(R) scripts/clean.R

# Analyze data
$(RESULTS_DIR)/model_summary.txt: $(DATA_DIR)/iris_clean.csv scripts/analyze.R
	@echo "Running analysis..."
	@mkdir -p $(RESULTS_DIR)
	$(R) scripts/analyze.R

# Create visualizations
$(FIGURES_DIR)/iris_plot.png: $(RESULTS_DIR)/model_summary.txt scripts/plot.R
	@echo "Creating plots..."
	@mkdir -p $(FIGURES_DIR)
	$(R) scripts/plot.R
	

# Clean up generated files
clean:
	@echo "Cleaning up..."
	rm -rf $(DATA_DIR)/iris_clean.csv
	rm -rf $(RESULTS_DIR)
	rm -rf $(FIGURES_DIR)

#!/bin/bash
# run_all.sh - Traditional shell script approach
# Problem: Always runs everything, even if nothing changed!

echo "Running complete analysis pipeline..."

# Download data
echo "Step 1: Downloading data..."
mkdir -p data
wget -q -O data/iris.csv \
  https://raw.githubusercontent.com/mwaskom/seaborn-data/master/iris.csv

# Clean data
echo "Step 2: Cleaning data..."
Rscript scripts/clean.R

# Analyze
echo "Step 3: Running analysis..."
mkdir -p results
Rscript scripts/analyze.R

# Plot
echo "Step 4: Creating plots..."
mkdir -p figures
Rscript scripts/plot.R

echo "Pipeline complete!"

# PROBLEMS WITH THIS APPROACH:
# 1. Always runs ALL steps, even if nothing changed
# 2. If step 3 fails, you have to manually restart from there
# 3. No automatic dependency tracking
# 4. Wastes time re-running expensive computations
# 5. Can't run steps in parallel
# 6. Hard to know what's out of date

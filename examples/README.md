# Example: Data Analysis Pipeline with GNU Make

This example demonstrates a complete data analysis pipeline using GNU Make.

## Pipeline Overview

```
iris.csv (download)
    ↓
iris_clean.csv (clean data)
    ↓
model_summary.txt (statistical analysis)
    ↓
iris_plot.png (visualization)
```

## Files

- `Makefile` - The main automation file
- `scripts/clean.R` - Data cleaning script
- `scripts/analyze.R` - Statistical analysis script
- `scripts/plot.R` - Visualization script

## Prerequisites

- GNU Make (usually pre-installed on Linux/macOS)
- R (version 3.6 or later)
- wget (for downloading data)

## Running the Example

### 1. Run the Complete Pipeline

```bash
cd examples
make all
```

This will:
1. Download the iris dataset
2. Clean the data
3. Run statistical analysis
4. Generate plots

### 2. Explore Make's Intelligence

**See what commands would run:**
```bash
make -n all
```

**Check if everything is up-to-date:**
```bash
make all
# Output: make: Nothing to be done for 'all'.
```

**Modify a script and see what rebuilds:**
```bash
# Edit plot.R
touch scripts/plot.R

# Only plotting step will re-run!
make all
```

### 3. Clean Up

```bash
make clean
```

This removes all generated files (cleaned data, results, figures).

## Understanding the Makefile

### Dependency Chain

```makefile
iris_plot.png: model_summary.txt scripts/plot.R
model_summary.txt: iris_clean.csv scripts/analyze.R
iris_clean.csv: iris.csv scripts/clean.R
```

When you run `make iris_plot.png`, Make:
1. Checks if `model_summary.txt` exists and is up-to-date
2. To check that, it verifies `iris_clean.csv` is up-to-date
3. To check that, it verifies `iris.csv` exists
4. Only rebuilds what's necessary based on file timestamps

### Variables

```makefile
R = Rscript
DATA_DIR = data
```

Variables make it easy to change settings in one place.

### Phony Targets

```makefile
.PHONY: all clean help
```

These targets don't create files - they're commands to run.

## Exercises

### Exercise 1: Modify the Pipeline

Try editing `scripts/plot.R` to change the plot colors, then run:
```bash
make all
```

Notice that only the plotting step re-runs!

### Exercise 2: Add a New Target

Add a new target that creates a summary report:

```makefile
$(RESULTS_DIR)/report.txt: $(RESULTS_DIR)/model_summary.txt
	echo "Report generated on:" > $@
	date >> $@
	cat $(RESULTS_DIR)/model_summary.txt >> $@
```

### Exercise 3: Force Rebuild

Force Make to rebuild everything:
```bash
make clean
make all
```

Or use the `-B` flag:
```bash
make -B all
```

### Exercise 4: Parallel Execution

If you had multiple independent plots, you could run them in parallel:

```bash
make -j 4 all  # Run up to 4 jobs simultaneously
```

## Common Issues

### "missing separator" Error

Make sure you use **TAB** characters, not spaces, before commands in the Makefile.

### wget Not Found

On macOS, install with Homebrew:
```bash
brew install wget
```

Or replace `wget` with `curl` in the Makefile:
```makefile
curl -o $(DATA_DIR)/iris.csv \
  https://raw.githubusercontent.com/mwaskom/seaborn-data/master/iris.csv
```

### R Not Found

Install R from: https://www.r-project.org/

## Next Steps

- Try creating your own Makefile for a real project
- Explore pattern rules for repetitive tasks
- Learn about automatic variables (`$@`, `$<`, `$^`)
- Integrate Make with version control (Git)

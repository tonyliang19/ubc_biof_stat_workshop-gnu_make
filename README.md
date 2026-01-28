# UBC BIOF Statistics Workshop: GNU Make for Reproducible Research

This repository contains slides for a 30-45 minute workshop on using GNU Make for automating and documenting data analysis pipelines in reproducible research.

## Workshop Overview

**Target Audience:** Graduate students and researchers with little programming experience

**Duration:** 30-45 minutes

**Learning Objectives:**
- Understand why GNU Make is superior to manual scripts for data pipelines
- Learn basic Makefile syntax and structure
- Create a simple data analysis pipeline with Make
- Understand dependency tracking and automatic rebuilding

## Viewing the Slides

### Prerequisites

You need [Quarto](https://quarto.org/) installed on your system.

**Install Quarto:**
- Download from: https://quarto.org/docs/get-started/
- Or use package manager:
  ```bash
  # macOS
  brew install quarto
  
  # Ubuntu/Debian
  sudo apt-get install quarto-cli
  ```

### Building the Slides

1. Clone this repository:
   ```bash
   git clone https://github.com/tonyliang19/ubc_biof_stat_workshop-gnu_make.git
   cd ubc_biof_stat_workshop-gnu_make
   ```

2. Render the slides:
   ```bash
   quarto render index.qmd
   ```

3. Open the generated HTML file:
   ```bash
   # The slides will be generated as index.html
   open index.html  # macOS
   xdg-open index.html  # Linux
   start index.html  # Windows
   ```

### Preview Mode

For live preview while editing:

```bash
quarto preview index.qmd
```

This will open a browser and auto-reload when you save changes.

## Slide Contents

The slides follow a narrative arc that builds from problem to solution:

1. **Introduction** - Workshop goals and target audience
2. **The Problem** - Manual workflow pain points with interactive quiz
3. **What is GNU Make?** - Core concepts and why it matters
4. **Why Make for Data Analysis** - Direct comparison with shell scripts
5. **Basic Syntax** - Targets, dependencies, commands explained step-by-step
6. **How Make Decides** - The "magic" of timestamp-based dependency tracking
7. **Building a Pipeline** - Incremental 4-step data analysis example
8. **Phony Targets** - Special non-file targets
9. **Variables** - Making Makefiles maintainable
10. **Pattern Rules** - DRY principle with wildcards
11. **Best Practices & Common Pitfalls** - Tips for success
12. **Debugging** - Tools to troubleshoot Makefiles
13. **Resources** - References including STAT 545 and Software Carpentry

**Note:** Content is intentionally limited to pattern rules level (no advanced features) to keep the workshop accessible and within the 30-45 minute timeframe.

## Workshop Structure (30-45 minutes)

- **Introduction (5 min)** - Set context and goals
- **Motivation (5 min)** - Problems with manual workflows
- **Make Basics (10 min)** - Syntax and core concepts
- **Real Example (15 min)** - Build a pipeline step-by-step
- **Best Practices (5 min)** - Tips and common pitfalls
- **Q&A (5 min)** - Questions and wrap-up

## For Instructors

### Tips for Delivery

1. **Live Coding:** Consider demonstrating the examples live rather than just showing slides
2. **Hands-On:** If time permits, have participants create a simple Makefile
3. **Real Data:** Use actual research data examples relevant to your audience
4. **Pace:** Adjust based on audience familiarity with command line

### Key Points to Emphasize

- **TAB vs Spaces:** This is the #1 beginner mistake
- **Dependency Tracking:** The main advantage of Make
- **Incremental Builds:** Only rebuilding what's needed saves time
- **Documentation:** Makefile as workflow documentation

## Customization

The slides are written in Quarto markdown (`.qmd`). You can easily customize:

- Edit `index.qmd` to modify content
- Change theme in the YAML header (`theme: simple`)
- Add your own examples
- Adjust slide transitions and navigation

## Acknowledgments

This workshop is based on materials from:

- [STAT 545 Automating Data-analysis Pipelines](https://github.com/STAT545-UBC/STAT545-UBC-original-website/blob/master/automation01_slides/slides.md) by Shaun Jackman & Jenny Bryan
- [Software Carpentry: Automation and Make](https://swcarpentry.github.io/make-novice/)
- [Minimal Make](https://kbroman.org/minimal_make/) by Karl Broman

## License

This workshop material is available for educational use.

## Contributing

Suggestions and improvements welcome! Please open an issue or pull request.
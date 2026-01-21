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
   quarto render slides.qmd
   ```

3. Open the generated HTML file:
   ```bash
   # The slides will be generated as slides.html
   open slides.html  # macOS
   xdg-open slides.html  # Linux
   start slides.html  # Windows
   ```

### Preview Mode

For live preview while editing:

```bash
quarto preview slides.qmd
```

This will open a browser and auto-reload when you save changes.

## Slide Contents

1. **Introduction** - Workshop goals and audience
2. **The Problem** - Issues with manual workflows
3. **What is GNU Make?** - Core concepts and benefits
4. **Make vs Shell Scripts** - Direct comparison
5. **Basic Syntax** - Targets, dependencies, commands
6. **Real Example** - Complete data analysis pipeline
7. **Advanced Features** - Variables, pattern rules, parallel execution
8. **Best Practices** - Tips for using Make effectively
9. **Resources** - Where to learn more

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

- Edit `slides.qmd` to modify content
- Change theme in the YAML header (line 6: `theme: dark`)
- Add your own examples
- Adjust slide transitions and navigation

## License

This workshop material is available for educational use.

## Contributing

Suggestions and improvements welcome! Please open an issue or pull request.
# Quick Start Guide

Get started with the GNU Make workshop in 2 minutes!

## For Workshop Presenters

### 1. Render the Slides

```bash
# Install Quarto if not already installed
# Visit: https://quarto.org/docs/get-started/

# Render the presentation
quarto render slides.qmd

# Open in browser
open slides.html  # macOS
xdg-open slides.html  # Linux
start slides.html  # Windows
```

### 2. Present

- Press **F** for fullscreen
- Press **S** for speaker notes
- Use arrow keys to navigate
- Press **ESC** for overview

### 3. Customize (Optional)

Edit `slides.qmd` to customize content, then re-render.

---

## For Workshop Participants

### Try the Example

```bash
cd examples

# See what the Makefile does
make help

# Run the pipeline (requires R and wget)
make all

# Clean up
make clean
```

### Learn More

- Read `examples/README.md` for detailed walkthrough
- Compare `Makefile` vs `run_all.sh` to see the difference
- Try modifying the R scripts and re-running `make`

---

## Need Help?

- **Slides won't render?** Check Quarto is installed: `quarto --version`
- **Make errors?** Ensure you're using TAB characters, not spaces
- **Missing dependencies?** See main `README.md` for installation instructions

---

## What's Included

```
.
├── slides.qmd              # Main presentation source
├── README.md               # Full documentation
├── INSTRUCTOR_GUIDE.md     # Detailed teaching guide
├── QUICKSTART.md          # This file
└── examples/               # Hands-on example
    ├── Makefile           # Example pipeline with Make
    ├── run_all.sh         # Shell script comparison
    ├── README.md          # Example documentation
    └── scripts/           # R analysis scripts
        ├── clean.R
        ├── analyze.R
        └── plot.R
```

---

## Quick Tips

✅ **For a 30-minute workshop:** Focus on slides 1-20, skip advanced topics

✅ **For a 45-minute workshop:** Include all slides, add live coding

✅ **Make it interactive:** Do live coding instead of just showing slides

✅ **Common pitfall:** Remind participants about TAB vs SPACES in Makefiles!

---

**Ready to go! 🚀**

For detailed information, see `README.md` and `INSTRUCTOR_GUIDE.md`.

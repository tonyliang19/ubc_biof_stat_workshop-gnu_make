# Workshop Instructor Guide

## GNU Make for Reproducible Research Workshop

**Duration:** 30-45 minutes  
**Target Audience:** Graduate students with little programming knowledge  
**Format:** Quarto RevealJS presentation

---

## Pre-Workshop Setup

### For Instructors

1. **Install Quarto** on your presentation machine
   - Download from: https://quarto.org/docs/get-started/
   - Or use package manager (brew, apt-get, etc.)

2. **Render the slides:**
   ```bash
   quarto render slides.qmd
   ```

3. **Test the presentation:**
   ```bash
   open slides.html  # Opens in default browser
   ```

4. **Optional: Test the example pipeline**
   - Requires: R, wget, and GNU Make
   - See `examples/README.md` for details

### For Participants

Participants should have:
- A computer with command line access
- GNU Make installed (pre-installed on Linux/macOS, Windows users need WSL or make.exe)
- (Optional) R installed if they want to follow along with examples
- Text editor (VSCode, Sublime, or even nano/vim)

---

## Workshop Delivery Plan (30-45 minutes)

### Introduction (5 minutes)
**Slides 1-3**

- Welcome and introductions
- Set expectations: beginner-friendly, hands-on focused
- Poll audience: "Who has used Make before?"
- Explain workshop goals

**Key Points:**
- Emphasize reproducibility in research
- Make is a tool, not a programming language
- Focus on practical application

---

### The Problem: Manual Workflows (5 minutes)
**Slides 4-6**

- Describe the pain of manual script execution
- Ask audience: "How do you currently run your analysis?"
- Present common problems they likely face

**Interactive Tip:**
- Share a relatable story about forgetting which scripts to run
- Ask if anyone has re-run everything just to be safe

---

### What is GNU Make? (5 minutes)
**Slides 7-9**

- Introduce Make as a build automation tool
- Compare with shell scripts (show concrete examples)
- Explain the concept of dependency tracking

**Teaching Tip:**
- Use the analogy: "Make is like a smart assistant that remembers what needs updating"
- Draw the dependency graph on a whiteboard if available

---

### Basic Makefile Syntax (10 minutes)
**Slides 10-13**

- Teach the basic syntax: target, dependencies, commands
- **CRITICAL:** Emphasize TAB vs SPACES (this is the #1 beginner mistake!)
- Show how Make determines what to rebuild

**Live Coding Suggestion:**
Create a simple Makefile in real-time:

```makefile
# Start simple
hello.txt:
	echo "Hello, Make!" > hello.txt

# Add dependency
goodbye.txt: hello.txt
	cat hello.txt | sed 's/Hello/Goodbye/' > goodbye.txt
```

Run it, modify hello.txt, run again to show dependency tracking.

---

### Real Example: Data Pipeline (15 minutes)
**Slides 14-21**

This is the heart of the workshop!

- Walk through building the pipeline step by step
- Show each addition to the Makefile
- Demonstrate running and re-running

**Interactive Demonstration:**

1. Show `examples/run_all.sh` - the shell script approach
2. Build `examples/Makefile` incrementally
3. Demonstrate:
   - First run (everything builds)
   - Second run (nothing to do)
   - Touch a file (only downstream rebuilds)

**Time Management:**
- If running short on time: Skip some slides and jump to the complete example
- If you have extra time: Live code the example from scratch

---

### Best Practices & Wrap-up (5 minutes)
**Slides 22-30**

- Cover common pitfalls (especially TAB vs SPACES!)
- Show debugging tips
- Provide resources for further learning
- Q&A

**Final Message:**
- Start small with your own projects
- Make is a skill that improves with practice
- Share your Makefiles with collaborators

---

## Presentation Tips

### Navigation

- **Arrow keys:** Navigate slides
- **F:** Fullscreen mode
- **S:** Speaker view (shows notes)
- **ESC:** Slide overview
- **?:** Show keyboard shortcuts

### Pacing

**For 30 minutes:**
- Skip slides 22-25 (advanced topics)
- Reduce live coding time
- Focus on core concepts

**For 45 minutes:**
- Include all slides
- More time for live coding
- Allow more Q&A time

### Interactive Elements

The slides use reveal.js fragments (progressive reveals with `. . .`).

**When presenting:**
- Press space/arrow to reveal bullet points progressively
- This keeps audience attention and prevents information overload
- Use pauses to let concepts sink in

---

## Live Coding vs Slides

You have two options:

### Option 1: Slides Only (Safer, Faster)
- Show all examples in slides
- Quick to deliver
- Less risk of technical issues
- Better for strict 30-minute time limit

### Option 2: Live Coding (More Engaging)
- Use slides for concepts
- Code examples live in terminal
- More engaging but requires practice
- Better for 45-minute format
- Have backup slides ready if live demo fails

**Recommended Hybrid Approach:**
- Use slides for introduction and concepts (slides 1-11)
- Live code the pipeline example (slides 14-21)
- Use slides for wrap-up (slides 22-30)

---

## Common Questions & Answers

### Q: "Can I use Make with Python instead of R?"
**A:** Absolutely! Just change `Rscript` to `python` in your Makefile.

### Q: "What if I'm on Windows?"
**A:** Use WSL (Windows Subsystem for Linux) or install GNU Make for Windows. Alternatively, use modern tools like `just` or `task` which are Make alternatives.

### Q: "How is this different from workflow tools like Snakemake or Nextflow?"
**A:** Those are specialized for bioinformatics pipelines and add features like cluster support. Make is simpler and more universal. Start with Make, graduate to specialized tools if needed.

### Q: "Can Make run steps in parallel?"
**A:** Yes! Use `make -j N` where N is the number of parallel jobs. Make will automatically determine which tasks can run simultaneously.

### Q: "What if my dependencies are complex?"
**A:** Start simple. You can always add complexity later. Most research workflows have linear dependencies that Make handles easily.

### Q: "Should I commit the generated files (results, plots) to Git?"
**A:** Generally no - commit your code (Makefile, scripts) and let Make regenerate outputs. This keeps your repository clean. Exception: Final publication figures might be committed.

---

## Troubleshooting

### Issue: Quarto won't render slides
**Solution:** Check Quarto version (`quarto --version`). Requires 1.2+.

### Issue: Slides show raw markdown
**Solution:** Open `slides.html`, not `slides.qmd` in browser.

### Issue: Fonts or styles look wrong
**Solution:** Ensure you have internet connection (RevealJS loads some resources from CDN).

### Issue: Can't see speaker notes
**Solution:** Press 'S' key during presentation to open speaker view.

---

## Customization Ideas

### Adapt to Your Audience

**For Bioinformaticians:**
- Use genomics pipeline examples (FASTQ → BAM → VCF)
- Mention integration with Nextflow/Snakemake

**For Data Scientists:**
- Emphasize ML pipeline automation
- Show integration with Python/Jupyter

**For Statisticians:**
- Focus on R integration
- Show how Make complements RMarkdown/Quarto

### Modify the Slides

The `slides.qmd` file is easy to edit:

```yaml
---
title: "Your Custom Title"
theme: dark  # Try: moon, sky, serif, simple
---
```

Add your own examples by editing the markdown.

---

## Follow-Up Resources

Share these with participants after the workshop:

1. **Official GNU Make Manual**
   - https://www.gnu.org/software/make/manual/

2. **Minimal Make Tutorial**
   - https://makefiletutorial.com/

3. **Make for Data Analysis (Software Carpentry)**
   - https://swcarpentry.github.io/make-novice/

4. **Example Repository**
   - This repository with working examples

5. **Karl Broman's "Minimal Make"**
   - https://kbroman.org/minimal_make/

---

## Post-Workshop Survey (Optional)

Consider asking participants:

1. Will you use Make in your research? (Yes/No/Maybe)
2. What was the most valuable part of the workshop?
3. What was most confusing?
4. What topics would you like covered in a follow-up session?
5. How would you rate the pace? (Too fast/Just right/Too slow)

This feedback helps improve future workshops.

---

## Advanced Workshop Ideas

If this workshop is successful, consider follow-ups:

**Workshop 2: Advanced Make**
- Automatic variables
- Pattern rules and wildcards
- Functions and conditional logic
- Integration with containers (Docker)

**Workshop 3: Reproducible Research Workflows**
- Make + Git + Quarto/RMarkdown
- Containerization with Docker
- Continuous Integration (GitHub Actions)
- Publishing reproducible papers

---

## Contact & Contributions

This workshop material is open for reuse and modification.

**To contribute improvements:**
1. Fork the repository
2. Make your changes
3. Submit a pull request

**Questions or suggestions:**
- Open an issue on GitHub
- Contact the workshop organizers

---

## Final Checklist

Before the workshop:

- [ ] Quarto installed and tested
- [ ] Slides render correctly (`quarto render slides.qmd`)
- [ ] Reviewed all slides
- [ ] Tested presentation mode (press 'S' for speaker view)
- [ ] Prepared examples directory
- [ ] Tested any live coding examples
- [ ] Room has projector/screen
- [ ] Participants have Make installed (if hands-on)
- [ ] Backup plan if internet fails
- [ ] Water/coffee available (speaking for 45 min!)

**Good luck with your workshop! 🎉**

# FLOW Lab Undergraduate Onboarding: Introductory Project

This is an introductory mini-project (like a longer homework problem) designed to introduce you to some of the [fundamental](#user-content-what-are-these-basic-skills) skills required to do research in the FLOW Lab.  A student with prior experience in programming and technical writing can likely complete this task in a couple weeks, whereas a freshmen may need a semester or two to learn some or all of these skills.

In order to provide an opportunity to develop these skills. We have pulled a portion of a graduate level homework problem that should be accessible to any student.  The selected problem (for which you can find a PDF description [here](leapfrog/leapfrog.pdf)) involves simulating vortex leapfrogging (note that you'll need to download the file to your computer for the links in the document to work). A more detailed version by [Eduardo Alvarez](https://edoalvarezr.github.io/) is animated below.  Eduardo modeled the vortex leapfrogging phenomenon in order to help verify some of his research tools, indicating that this problem does have real life value, even if we're using it here simply for learning engineering skills.

![](https://github.com/byuflowlab/undergrad-onboarding/blob/master/leapfrog.gif)

## Project Motivation

This project provides an orientation to the bare minimum skills needed to begin participating as an undergraduate researcher in our lab.  While you could potentially learn these on the job, we find that a starter project provides several benefits:
1. The focus enables you to learn these basic skills much more quickly.
2. It allows both you and us to assess fit for research in the lab.
3. A starter project allows those with less experience to start participating in our lab without waiting to take ME EN [273](https://catalog.byu.edu/engineering/mechanical-engineering/introduction-scientific-computing-and-computer-aided-engineering), [312](https://catalog.byu.edu/engineering/mechanical-engineering/fluid-mechanics), [etc.](https://www.me.byu.edu/aerospace)

## What are these basic skills

The basic skills referenced repeatedly above include:

- Code development in the [Julia Language](https://julialang.org/).
- Version control using [Git](https://git-scm.com/).
- Document preparation using [LaTeX](https://www.latex-project.org/about/).
- General self-learning skills.

Auxiliary skills that might be very helpful include, but are not limited to:

- [Command line interface](https://www.codecademy.com/article/command-line-commands).


## What do I have to do

This project is intentionally open ended.  We provide a question as well as some links to helpful tutorials, but other than that, you'll have to use and/or develop some self-learning skills.  That being said, if you've taken our [interest survey](https://forms.gle/Aw1JA9dRKWNbuyDR8), then you will be assigned a graduate mentor that you can ask questions when you get stuck (most everyone gets stuck at some point).

At the end of the project, you should have the following deliverables to submit to your assigned graduate student mentor for review:

1. **CODE:** Implement the leapfrogging vortices and plot the resulting trajectories. Make sure your plots are clear and easily understood.  You are welcome to prototype in any programming language you want, but your final submission needs to be in Julia. If you are unfamiliar with Julia, we've put together some [beginner coding activites](JuliaCodingActivities/julia.md) that should be helpful.
2. **VERSION CONTROL:** Use git for version control as you develop your code (the beginner activities mentioned above would be a great place to practice!).  If you are unfamiliar with git, check out this [basic overview](https://guides.github.com/introduction/git-handbook/).  Create a free account on [GitHub](https://github.com) so that you can create your own repositories.  You'll need to send the link to your repository (with the code) as part of your submission.
3. **REPORT:** Write a short scientific report with an introduction, methodology, and results.  See [BYU ME Writing Materials on the IMRaD genre](https://me.byu.edu/resources) for some guidance and examples on scientific writing if this style of writing is new to you.  You will need to use LaTeX.  If you are unfamiliar with LaTeX, go through this [30 minute tutorial](https://www.overleaf.com/learn/latex/Learn_LaTeX_in_30_minutes).
4. **BONUS (not required):** A static image of leapfrogging vortices isn't as fun.  See if you can create an animation so that you can actually watch the movement in time.  You might also like to draw a line between the vortex pairs to better visualize them as a connected ring.
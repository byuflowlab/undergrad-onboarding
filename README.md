# FLOW Lab Undergraduate Onboarding

Most research groups, like the FLOW Lab, require a base set of skills that undergrads typically don't begin learning until late in their sophomore, or even into their junior year. Additionally, some skills needed for research in this lab aren't learned anywhere in the ME curriculum.  The goal of this onboarding process is to help undergrads (from freshmen to seniors) develop skills to help then transition to research in the lab.  The motivated freshman, putting forth consistent effort, can reasonably expect to be co-authoring with graduate students (or independently if especially committed) on peer reviewed research publications by her/his senior year. A more experienced undergrad will able to skip or quickly pass through some of these steps.

This is an introductory set of homework-like assignments that will give you the fundamental skills required to do research in the FLOW Lab. You'll learn, among other things, how to navigate computers via the command line, write basic computer scripts and programs, critically review technical writing, and do some technical writing of your own. You can complete these assignments as quickly or slowly as you want, be we strongly suggest forming a group with other students starting out just like you so you can work together, ask and answer questions, and figure as much out together as you can, since that will accelerate your learning.

<!-- Along with the deliverables listed in the descriptions below, each activity should include a memo/report written in LaTeX (after you've completed the LaTeX activity).  In the coding activities, unless otherwise stated, the Julia or Python language should be used (Julia if you are on an aircraft track, Python if on a wind energy track), and version control (Git) should be used as you go. -->

### Activity 1: Write like a Researcher

In the FLOW Lab, we write technical papers (and for many of us proposals, homework, reports, todo lists, study journals, daily planners, etc.) using LaTeX, which is a typesetting language. An overview of LaTeX, editors, and basic syntax is available in our [lab notebook](https://github.com/byuflowlab/flowlab-notebook/blob/master/tutorials/latex.md).  As a beginner, we recommend using Overleaf.

Completing Activity 1 requires the following sub-activities (you may find [this documentation](https://www.overleaf.com/learn) helpful):
1. Complete [this tutorial](https://www.overleaf.com/learn/latex/Learn_LaTeX_in_30_minutes), it will give you all of the fundamentals you need to know.
2. Write an AIAA Conference Paper (well, not really): download the [AIAA Template](https://www.overleaf.com/latex/templates/latex-template-for-the-preparation-of-papers-for-aiaa-technical-conferences/rsssbwthkptn#.WbgUXMiGNPZ) and explore how to change the title, authors, abstract, nomenclature, etc.
3. Do your homework: Create a .tex file from scratch that includes the following elements:
   - A header that includes the class name (e.g. MATH 334), your name, the date, and the assignment (e.g. Homework 3), and a horizontal rule (big horizontal line) speparating it from the body of the paper.
   - A footer that has the page number at the bottom right (or wherever you want to put it).
   - Sections for each homework problem with
   - Subsections for:
     - Problem descriptions (in italics)
     - Assumptions
     - Your work (maths, plots/figures, etc.)
     - Results
     - Conclusions
4. If possible, actually submit a homework assignment that you've written up in LaTeX.

### Activity 2: Read Like a Researcher

Searching for, critically skimming, reading, reviewing, and keeping track of relevant research articles is a necessity as a researcher. Starting with these simple things now will eliminate potential headaches later. You'll want to develop a system for keeping papers organized so that when it comes time to cite them, or do a literature review, you have everything ready to go.

1. Get a reference manager.  The previous link to LaTeX also discussed [BibDesk](https://github.com/byuflowlab/flowlab-notebook/blob/master/tutorials/latex.md), which is the recommended option in our lab.  However, you are welcome to use other options like Mendeley.
2. Create a directory to keep a master reference list.
3. Review 5 papers in an area relevant to the FLOW Lab and write a 1--2 paragraph summary (miniature literature review) of the work with proper citations/bibliography.
<!-- 4. Continue reading/reviewing one paper per week. -->

### Activity 3: Master the Command Line

What's the Command Line, you ask? It's the text-based interface to your computer. Depending on your operating system, the Command Line Interface application will have a different name, but they all do the same thing.  In our lab we use Mac OS or Linux and the command line will be found under the name Terminal.  If you are on Windows you can either 1) install [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/about), 2) install a full linux distribution (either as a virtual machine or as a separate boot drive), or 3) use one of the Mac computers in our lab set aside for undergrads.

Your first activity is to master navigating the command line. You'll find [Code Academy's Tutorial](https://www.codecademy.com/learn/learn-the-command-line) useful in this endeavor, but you may find yourself needing to look up some details elsewhere (*cough Google *cough).

To complete this activity, you'll need to be able to do at least the following:

1. Open the Command Line Interface application on your computer
2. Identify the working directory
3. List the contents of a directory
4. List the detailed contents of a directory
5. Show the hidden files in a directory
6. Change to another directory
7. Copy single files from one location to another
8. Copy a directory from one location to another
9. Move single files from one location to another
10. Move a directory from one location to another
11. Rename files
12. Make a new directory
13. Remove single files
14. Remove directories and their contents

Extra Credit: If you want to learn a few more things beyond the basics, you can look into the following topics.

1. echo
2. cat
3. using ~/.bash_profile (mac) or ~/.bashrc (linux)
4. \>
5. \>>
6. |
7. top
8. vim (or nano or emacs)
9. sort
10. touch
11. chmod
12. [anything else that looks interesting](https://www.codecademy.com/articles/command-line-commands)
13. [Ninja skillz](https://lifehacker.com/become-a-command-line-ninja-with-these-time-saving-shor-5743814)

### Activity 4: Get Git

Git (feel free to read the [Wikipedia page on why it's named that](https://en.wikipedia.org/wiki/Git#Naming)) is a widely used method for version control.  Version control is essential to code development as it tracks changes, allows you to work collaboratively, and allows you to roll back changes (amongst many other features).  Now that you've mastered the command line, this should be relatively straightforward and will set you up for success in the upcoming coding activity.

You will need to do the following to complete this activity.

1. Complete [this tutorial](https://www.codecademy.com/learn/learn-git).
2. Sign up for the [student developer pack](https://education.github.com/pack) on github so you can create your own private repositories.
3. Create a repository for yourself.
4. Use it.

### Activity 5: Write. Some. Code.

Almost everything done in the FLOW Lab revolves around writing code. In the FLOW Lab, most students end up using several different languages at some point. The most common languages we use are Julia and Python, but several of us dabble in Matlab, Fortran, C/C++, Java, as well as other things like Bash and Regular Expressions. For this activity, we'll have you start with Julia (unless you've been specifically told to do this part in Python). This activity is actually a series of activities, since, unlike the previous activities, it will take a bit more work to become oriented to programming (especially if you've never done it before).

#### Airfoils

First things first. You need to get Julia. You can get the current version from [https://julialang.org/](https://julialang.org/). Once you've got it downloaded, you're ready to go (see this [getting started page](https://en.wikibooks.org/wiki/Introducing_Julia/Getting_started)).  You'll be able to run julia directly from the command line via the Julia [REPL](https://en.wikibooks.org/wiki/Introducing_Julia/The_REPL), but you may (most definitely will) find that you want to use some kind of text editor. Choosing a text editor is a personal choice, but some popular ones in our lab are [Atom](https://atom.io/) (with the [Julia IDE](http://junolab.org/)), [Visual Studio Code](https://code.visualstudio.com/) (with the [Julia extension](https://marketplace.visualstudio.com/items?itemName=julialang.language-julia)), and [Sublime](https://github.com/PetrKryslUCSD/HowToUseJuliaWithSublimeText3/blob/master/How-to-use-Julia-with-Sublime-Text-3.md).

For the following tutorials, we will primarily be using the [Julia Documentation](https://docs.julialang.org/en/v1/) and [Introducing Julia](https://en.wikibooks.org/wiki/Introducing_Julia). Some other quick references for Julia syntax are [Learn X in Y, where X=Julia](https://learnxinyminutes.com/docs/julia/), and [Julia by Example](https://juliabyexample.helpmanual.io/).

To help introduce the Julia language, we are going to do some basic airfoil generation and plotting.  
<!-- , very similar to a homework problem from the aerodynamics class, ME EN 515. The activities here will help you develop the necessary skills to complete your own [Panel Method](JuliaCodingActivities/latex/panelmethod.pdf). -->

(Note: The activities are .pdf files that can be downloaded so you don't have to be online to access them. Also note that the hyperlinks do _not_ work in the github preview, so you will need to download them if you want the hyper links to function properly.)

1. [Julia Basics](JuliaCodingActivities/latex/basics.pdf)

2. [Functions](JuliaCodingActivities/latex/functions.pdf)

3. [Control Flow](JuliaCodingActivities/latex/controlflow.pdf)

4. [Arrays](JuliaCodingActivities/latex/arrays.pdf)

5. [Packages](JuliaCodingActivities/latex/packages.pdf)

6. [Plotting](JuliaCodingActivities/latex/plotting.pdf)


### Activity 6: Application Activity

You are now ready to apply what you've learned on a miniature project.  At this point you need to choose whether you want to an aircraft project or a wind energy project.  This project will require you to put all of the above skills together.  You'll also learn a little bit of aerodynamics along the way.  Your final deliverables should include:
1) A written report (in LaTeX)
2) A link to a git repo with the final code that completes the tasks.

Work with others and seek help from the graduate students as needed.

#### Aircraft Option: Vortex Lattice Method

Implement a basic vortex lattice method.

1. Solve for the circulation distribution of a hershey bar wing (constant chord, no twist, no sweep).  Compare your results with just four panels to those worked out by hand in Bertin/Smith.
2. Compute lift, pitching moment, and induced drag.  I recommend trying to do this in a general way so it still works with more complex wings (later steps).
3. Allow for changes in chord, twist, and sweep.
4. Allow for winglets.
5. Compute induced drag in the Trefftz plane.


#### Wind Energy Option: Jensen Wake

Wind turbines remove momentum from the air and convert it to electricity. This results in an area of slow moving wind behind turbines called a "wake". Engineering wake models are used to quickly approximate wind speeds in turbine wakes.  We use these simplified models for wind farm layout optimization, in which turbines are placed in the best locations to generate the most energy. The Jensen wake model is one of the simplest models, that uses conservation of mass and momentum to calculate the wind speeds in a wake. 

Understand and implement the [Jensen wake model](http://orbit.dtu.dk/files/55857682/ris_m_2411.pdf).

1. Assuming that wind is coming from left to right, write a function that returns the radius of a wake given a rotor diameter and a distance downstream.  
2.  Assuming that wind is coming from left to right, write a function that returns the wind speed in a wake given a freestream wind speed, a rotor diameter, and a distance downstream.  Check your results against that published in the above paper.
3. Given a set of wind turbines, write a function that can define the wind speed at any coordinate. To combine wakes, use the square root of the sum of the squares (of the losses).
4. Now, assume wind can come from any direction. Modify your code in item 3 such that you can compute the wind speed at any coordinate, with an arbitrary wind direction. Define your incoming wind such that zero degrees is from the North, and clockwise is positive.  Plot the wake using a contour plot to make sure it is working appropriately.
5. 

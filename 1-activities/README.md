# Activities

These application activities are desgined to help students apply the [basic skills](../0-resources/README.md) needed to work on [projects](../2-projects/README.md) in the future.  Along with the deliverables listed in the descriptions below, each activity should include a memo/report written in ![equation](latex.gif) (after you've completed the ![equation](latex.gif) activity).  In the coding activities, unless otherwise stated, the Julia or Python language should be used (Julia if you are on an aircraft track, python if on a wind energy track), and version control (Git) should be used as you go.

## The First Semester: (Everyone)

So you've decided to check out the FLOW Lab's Long-Term Research Assistant Development (LTRAD) program. You've talked to Dr. Ning, and/or one of his graduate students and they instructed you to get a github account and then sent you the link to this page. Now you're wondering what's next. Well, let's just jump right in to "The First Semester." This is an introductory set of homework-like assignments that will give you the fundamental skills required to do research in the FLOW Lab. You'll learn, among other things, how to navigate computers via the command line, write basic computer scripts and programs, critically review technical writing, and do some technical writing of your own. You can complete these assignments as quickly or slowly as you want, be we strongly suggest forming a group with other students starting out just like you so you can work together, ask and answer questions, and figure as much out together as you can, since that will accelerate your learning.

### Activity 1: Write like a Researcher
In the FLOW Lab, we write technical papers (and for many of us proposals, homework, reports, todo lists, study journals, daily planners, etc.) using ![equation](latex.gif), which is a typesetting language. An overview of ![equation](latex.gif), editors, and basic syntax is available in our [lab notebook](https://github.com/byuflowlab/flowlab-notebook/blob/master/tutorials/latex.md).  As a beginner, we recommend using Overleaf.

Completing Activity 2 requires the following sub-activities (you may find [this documentation](https://www.overleaf.com/learn) helpful):
1. Complete [this tutorial](https://www.overleaf.com/learn/latex/Learn_LaTeX_in_30_minutes), it will give you all of the fundamentals you need to know.
2. Write an AIAA Conference Paper (well, not really): download the [AIAA Template](https://www.overleaf.com/latex/templates/latex-template-for-the-preparation-of-papers-for-aiaa-technical-conferences/rsssbwthkptn#.WbgUXMiGNPZ) and explore how to change the title, authors, abstract, nomenclature, etc.
3. Do your homework: Create a .tex file from scratch that includes the following elements:
   - A Header that includes the class name (e.g. MATH 334), your name, the date, and the assignment (e.g. Homework 3), and a horizontal rule (big horizontal line) speparating it from the body of the paper.
   - A footer that has the page number at the bottom right (or wherever you want to put it).
   - Sections for each homework problem with
   - Subsections for:
     - Problem descriptions (in italics)
     - Assumptions
     - Your work (maths, plots/figures, etc.)
     - Results
     - Conclusions
4. If possible, actually submit a homework assignment that you've written up in ![equation](latex.gif).

### Activity 2: Read Like a Researcher
Searching for, critically skimming, reading, reviewing, and keeping track of relevant research articles is a necessity as a researcher. Starting with these simple things now will eliminate potential headaches later. You'll want to develop a system for keeping papers organized so that when it comes time to cite them, or do a literature review, you have everything ready to go.

1. Get a reference mananger.  The previous link to ![equation](latex.gif) also discussed [BibDesk](https://github.com/byuflowlab/flowlab-notebook/blob/master/tutorials/latex.md), which is the recommended option in our lab.  However, you are welcome to use other options like Mendeley.
2. Create a directory to keep a master reference list.
3. Review 5 papers, write notes in a ![equation](latex.gif) docuement with proper citations/bibliography
4. Continue reading/reviewing one paper per week.

### Activity 3: Master the Command Line
What's the Command Line, you ask? It's the text-based interface to your computer. Depending on your operating system, the Command Line Interface application will have a different name, but they all do the same thing.

- Mac/Linux : Terminal
- Windows : Command Prompt

> Note that commands in Windows are different than Mac/Linux and you will need to know the latter. If you are on a Windows you can either 1) install [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/about), 2) install a full linux distribution (either as a virtual machine or as a separate boot drive), 3) or use of the Mac Minis in the lab.

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

### Activity 4: Get Git
Git (feel free to read the [Wikipedia page on why it's named that](https://en.wikipedia.org/wiki/Git#Naming)) is a widely used method for version control.  Version control is essential to code development as it tracks changes, allows you to work collaboratively, and allows you to roll back changes (amongst many other features).  Now that you've mastered the command line, this should be relatively straightforward and will set you up for success in the upcoming coding activity.

You will need to do the following to complete this activity.

1. Complete [this tutorial](https://www.codecademy.com/learn/learn-git).
2. Sign up for the [student developer pack](https://education.github.com/pack) on github so you can create your own private repositories.
3. Create a repository for yourself.
4. Use it.

### Activity 5: Write. Some. Code.
Almost everything done in the FLOW Lab revolves around writing code. In the FLOW Lab, most students end up using several different languages at some point. The most common languages we use are Julia and Python, but several of us dabble in Matlab, Fortran, C/C++, Java, as well as other things like Bash and Regular Expressions. For this activity, we'll have you start with Julia (unless you've been specifically told to do this part in Python). This activity is actually a series of activities, since, unlike the previous activities, it will take a bit more work to become oriented to programming (especially if you've never done it before).

#### Aerodynamics

First things first. You need to get Julia. You can get the current version from [https://julialang.org/](https://julialang.org/). Once you've got it downloaded, you're ready to go (see this [getting started page](https://en.wikibooks.org/wiki/Introducing_Julia/Getting_started)).  You'll be able to run julia directly from the command line via the Julia [REPL](https://en.wikibooks.org/wiki/Introducing_Julia/The_REPL), but you may (most definitely will) find that you want to use some kind of text editor. Choosing a text editor is a personal choice, but some popular ones in our lab are [Atom](https://atom.io/) (with the [Julia IDE](http://junolab.org/)), [Visual Studio Code](https://code.visualstudio.com/) (with the [Julia extension](https://marketplace.visualstudio.com/items?itemName=julialang.language-julia)), and [Sublime](https://github.com/PetrKryslUCSD/HowToUseJuliaWithSublimeText3/blob/master/How-to-use-Julia-with-Sublime-Text-3.md).

For the following tutorials, we will primarily be using the [Julia Documentation](https://docs.julialang.org/en/v1/) and [Introducing Julia](https://en.wikibooks.org/wiki/Introducing_Julia). Some other quick references for Julia syntax are [Learn X in Y, where X=Julia](https://learnxinyminutes.com/docs/julia/), and [Julia by Example](https://juliabyexample.helpmanual.io/).

To help introduce the Julia language, we are going to do a practical aerodynamics problem, very similar to a homework problem from the aerodynamics class, ME EN 515. The activities here will help you develop the necessary skills to complete your own [Panel Method](JuliaCodingActivities/latex/panelmethod.pdf).

(Note: The activities are .pdf files that can be downloaded so you don't have to be online to access them. Also note that the hyperlinks do _not_ work in the github preview, so you will need to download them if you want the hyper links to function properly.)

##### Julia Coding Activities:
1. [Julia Basics](JuliaCodingActivities/latex/basics.pdf)

2. [Functions](JuliaCodingActivities/latex/functions.pdf)

3. [Control Flow](JuliaCodingActivities/latex/controlflow.pdf)

4. [Arrays](JuliaCodingActivities/latex/arrays.pdf)

5. [Packages](JuliaCodingActivities/latex/packages.pdf)

6. [Plotting](JuliaCodingActivities/latex/plotting.pdf)

7. [Application Activity: Panel Method](JuliaCodingActivities/latex/panelmethod.pdf)

#### Wind Energy

##### Python Coding Activities

[Application Activity: Jensen Wake](jensen-wake.md)


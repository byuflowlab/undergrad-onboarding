# The First Semester

So you've decided to check out the FLOW Lab's Long-Term Research Assistant Development (LTRAD) program. You've talked to Dr. Ning, and/or one of his graduate students and they instructed you to get a github account and then sent you the link to this page. Now you're wondering what's next. Well, let's just jump right in to "The First Semester." This is an introductory set of homework-like assignments that will give you the fundamental skills required to do research in the FLOW Lab. You'll learn, among other things, how to navigate computers via the command line, write basic computer scripts and programs, critically review technical writing, and do some technical writing of your own. You can complete these assignments as quickly or slowly as you want, be we strongly suggest forming a group with other students starting out just like you so you can work together, ask and answer questions, and figure as much out together as you can, since that will accelerate your learning.

## Task 1: Master the Command Line
What's the Command Line, you ask? It's the text-based interface to your computer. Depending on your operating system, the Command Line Interface application will have a different name, but they all do the same thing.

- Mac/Linux : Terminal
- Windows : Command Prompt

Your first task is to master navigating the command line. You'll find [Code Academy's Tutorial](https://www.codecademy.com/learn/learn-the-command-line) useful in this endeavor, but you may find yourself needing to look up some details elsewhere (*cough Google *cough).

To complete this task, you'll need to be able to do at least the following:

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
3. \>
4. \>>
5. |
6. top
7. vim (or nano or emacs)
8. sort
9. touch
10. chmod
11. [anything else that looks interesting](https://www.codecademy.com/articles/command-line-commands)

## Task 2: Write like a Researcher
In the FLOW Lab, we write technical papers (and proposals, homework, reports, todo lists, study journals, daily planners, etc. for many of us) using ![equation](latex.gif), which is a typesetting language. It's a bit like Microsoft Word or Libre Office, but with direct control over formatting.  Some of the things that make it attractive are its ability to typset mathematics, format figures, and automatically format text sections based on a user-defined document types and styles. The result of a compiled ![equation](latex.gif) file is a .pdf file.

Completing Task 2 requires the following sub-tasks (you may find [this documentation](https://www.overleaf.com/learn) helpful):

1. You need a ![equation](latex.gif) editor. [Overleaf](https://www.overleaf.com/) is an online application that makes things really easy if you're new. If you want a bit of a challenge, or want to work offline, [TeXStudio](https://www.texstudio.org/) or other similar ![equation](latex.gif) editors are nice.  If you're super hardcore, you don't even need an editor, you can do everything from the commandline, but you will still have to download a distribution of ![equation](latex.gif) like [this one](https://tug.org/mactex/mactex-download.html). (We'll talk about general IDE's later, and that's another option in some cases.)
2. Complete [this tutorial](https://www.overleaf.com/learn/latex/Learn_LaTeX_in_30_minutes), it will give you all of the fundamentals you need to know.
3. Write an AIAA Conference Paper (well, not really): download the [AIAA Template](https://www.overleaf.com/latex/templates/latex-template-for-the-preparation-of-papers-for-aiaa-technical-conferences/rsssbwthkptn#.WbgUXMiGNPZ) and explore how to change the title, authors, abstract, nomenclature, etc.
4. Do your homework: Create a .tex file from scratch that includes the following elements:
   - A Header that includes the class name (e.g. MATH 334), your name, the date, and the assignment (e.g. Homework 3), and a horizontal rule (big horizontal line) speparating it from the body of the paper.
   - A footer that has the page number at the bottom right (or wherever you want to put it).
   - Sections for each homework problem with
   - Subsections for:
     - Problem descriptions (in italics)
     - Assumptions
     - Your work (maths, plots/figures, etc.)
     - Results
     - Conclusions
5. If possible, actually submit a homework assignment that you've written up in $\LaTeX$.

## Task 3: Read Like a Researcher
Searching for, critically skimming, reading, reviewing, and keeping track of relevant research articles is a necessity as a researcher. Starting with these simple things now will eliminate potential headaches later. You'll want to develop a system for keeping papers organized so that when it comes time to cite them, or do a literature review, you have everything ready to go.  We don't have a standardized system for this, so you'll have to decide on your own how you want to organize things, but in order to complete this task, you'll need to do at least the following:

1. Get a reference mananger (bibdesk, Mendeley, it doesn't really matter)
2. Create a directory to keep a master reference list.
3. Review 5 papers, write notes in a ![equation](latex.gif) docuement with proper citations/bibliography

## Task 4: Get Git
Git (feel free to read the [Wikipedia page on why it's named that](https://en.wikipedia.org/wiki/Git#Naming)) is among the best methods for keeping track of, and backing up your work when coding. Now that you've mastered the command line, this should be relatively easy and will set you up for success in the upcoming coding task.

You will need to do the following to complete this task.

1. Complete [this tutorial](https://www.codecademy.com/learn/learn-git).
2. Sign up for the [student developer pack](https://education.github.com/pack) on github so you can create your own private repositories.
3. Create a repository for yourself.
4. Use it.

## Task 5: Write. Some. Code.
Almost everything done in the FLOW Lab revolves around writing code. In the FLOW Lab, most students end up using several different languages at some point. The most common language we use are Julia and Python, but some of us dabble in Matlab, Fortran, C/C++, Java/Javascript, as well as other things like Bash and Regular Expressions. For this task, we'll have you start with Julia (unless you've been specifically told to do this part in Python). This task is actually a series of tasks, since, unlike the previous tasks, it will take a bit more work to become oriented to programming (especially if you've never done it before). Look in the [CodingActivities](./CodingActivities) subdirectory for the series of assignments that will get you going on gaining the necessary coding skills you'll need to do research in the FLOW Lab.

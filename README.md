# FLOW Lab Undergraduate Onboarding

This is an introductory mini-project (like a longer homework problem) designed to introduce you to some of the fundamental skills required to do research in the FLOW Lab.  A student with prior experience in programming and technical writing can likely complete this task in 2-3 weeks, whereas a freshmen may need a semester or two to learn some of these skills. 

## Prerequisites

In order to complete this project there are a few prerequisites.  If any of these topics are new, you should go through the corresponding tutorials.

1. LaTeX for writing.  [Here](https://www.overleaf.com/learn/latex/Learn_LaTeX_in_30_minutes) is a 30 minute tutorial.  You'll also want to know how to manage references. Most of us use BibDesk (see some instructions at the bottom of [this](https://github.com/byuflowlab/flowlab-notebook/blob/master/tutorials/latex.md) page), but you are welcome to use other options like Mendeley.  You'll want to develop a system for keeping papers organized so that when it comes time to cite them, or do a literature review, you have everything ready to go. 
2. Scientific writing using the IMRaD genre.  See [BYU ME Writing Materials on the IMRaD genre](https://me.byu.edu/resources) for some guidance and examples.
3. The command line.  This is the text-based interface to your computer.  It is actually not necessary to learn the command line to complete this assignment, but it is a useful skill in our lab and so is recommended.  Step 1 and 2 of [this](https://www.codecademy.com/learn/learn-the-command-line) tutorial would be a good place to start, but feel free to learn more as interested.  [This](https://lifehacker.com/become-a-command-line-ninja-with-these-time-saving-shor-5743814) page also has a nice summary of various shortcuts and tricks.  For Mac OS or Linux you will use Terminal.  For Windows, the built in command line (DOS) is totally different and not of use to us. Instead you will need to install [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/about).
4. Git for version control.  [Here](https://www.codecademy.com/learn/learn-git/modules/learn-git-git-workflow-u) is a tutorial for basic git workflow.  Also, create an account on [GitHub](https://github.com) so that you can create your own repositories.
5. Julia for programming.  Judd put together a helpful introduction [here](julia.md).  If you're already familiar with another language (like Matlab) you'll be able to pick this up relatively quickly.  If programming is new to you this is where you will probably spend most of your time.


## Mini-Project

The main goals of this project are to develop a basic aerodynamic analysis tool and write a report on your work.  The aerodynamic analysis method you will implement is blade element momentum theory, which is frequently used in analyzing both aircraft propellers and wind turbines.  There are two main tasks for this project, which are described below.

### Implement a Basic Blade Element Momentum Model

- This chapter provides a good overview of the basic theory.  
- Use Julia as the programming language. 
- Use GitHub for version control as you develop your code.
- Verify your model using this data.  The next step would be validation (comparison to experimental data), but we'd need to add a few additional features to your code to make it more realistic (mostly better airfoil data) and so will skip this.

<!-- (https://link.springer.com/chapter/10.1007/978-3-319-22114-4_7)  -->

### Write a Report

- Write a scientific report containing 1) an introduction describing your problem and a short literature review with at least five other relevant references, 2) methodology, 3) results, and 4) conclusions.  
- Your report should be created using LaTeX.


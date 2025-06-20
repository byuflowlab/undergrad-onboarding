

# Brainstorming a structure

It's been a hot second since I've looked through Judd's approach to the problem... and he has some good things. Here are some thoughts:

- We need to decide on a format, change things, then push it to master. 
- I'm not partial to an exam, I feel like that won't happen well. The grad students won't want to proctor a test and even if we do it remote on LearningSuite, then that means it has to be updated for every student who's taking the 497R (and it'll be a pain when multiple students are taking the 497R).
  - If the 497R is too much time to mentor, the grad students won't do it/ their energy will go into the details rather than mentoring their student. 
- We need more frequent assignments. 
  - ~15 weeks
  - Time frame on the assignments
    - I think 4-5 weeks for an assignment is too long. Most students aren't capable of thinking/planning on that time scale (most grad students aren't either). 
      - I kind of want to help them start thinking on longer time scales. 
        - Maybe 2 weeks to finish each assignment is a good time scale
          - That would result in ~7 assignments
        - The typical time frame for an engineering assignment is 1 week. 
- We should start with a lot more scaffolding, then decrease the scaffolding with time. 
  - A jupyter notebook or Pluto notebook for students to walk through. 
  - Scaffold them developing answers. 
- Previously we had thought about decreasing the amount of content that the students go through to encourage them to go further in depth. 
  - Students are always going to do the minimum. So if we're decreasing the amount of content, then we probably need to scaffold them going further in depth. 
    - What is the purpose of more or less depth? What is the purpose of the assignment? What is the purpose of the course? 
      - Considering the purpose I've outlined below, then only doing one thing in the 497R is probably a good idea. 
        - Judd currently has 3 theory assignments and 3 optimization assignments
          - Basic terminology, install the code and run an example
          - Deeper terminology (beginning into theory), plot the optimal lift distribution
          - more terminology (some theory), intro to optimization terminology, effects of stability
          - beginning git, choose a basic design objective, choose design variables, choose two constraints, build your objective, run 3 trade studies, write an introduction and methodology, put draft plots into the report
            - This assignment is pretty vague. 
          - More git, address ways to improve the optimization, iterate on methodology, outline your results
            - This assignment is pretty vague. 
          - address ways to improve the optimization, draft your assignment, get feedback from 2 graduate students, address that feedback
            - This assignment is pretty vague. 

- Alright further thoughts on Judd's stuff:
  - I think it needs some more scaffolding. 
  - The intial assignments are a little too easy. 
  - It needs one more assignment to fit the scope. 
    - Splitting up the optimization assignments would probably be good. 

Here's what I'm thinking assignments wise:
1. Terminology, basics of theory and installation
2. Dig into the theory and exploration
3. More theory and exploration (2nd topic to dig into)
4. Optimization basics (installation and solve a problem), discuss different objectives, design variables, constraints. Git basics
5. Implement objective, sweep design space, analyze objective, methods, etc. Predict what you think the optimizer will do. Begin report: introduction (problem statement, motivation, history), methodology
6. Run and analyze results (How did you choose your starting point? explain why the optimizer did what it did. Do the results coincide with your predictions?) Summarize results in bullet points in draft.
7. Develop optimization problem: improved objective, improved constraints, multi-start, exact gradients. Draft results. Get feedback on your draft from another graduate student (summarize your feedback 3 bullets and give 3 corresponding bullets on how you'll address the results). 
8. Communicate your results
   1. Polish your draft
   2. Prepare a presentation


# Purpose
Here I'm going to develop the purpose of the course. 

- I think the number one purpose for this course is to help students develop the ability to approach open-ended problems and dig into them. 
  - They should be able to look at a problem and ascertain the scope. 
  - They should be able to identify different approaches to solving the problem. 
  - They should be able to compare the different approaches. 
  - They should be able to implement an approach. 
- The second most important skill a student should develop in this course is the ability to learn something on their own. 
- Tertiary skills include:
  - Improved coding
  - basic aerodynmics knowledge
  - improved mathematics
  - improved numerical methods knowledge
  - improved communication skills:
    - writing
    - plotting 
#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Mon Jun 18 21:42:38 2018

@author: adam

Purpose: Find an estimate of the optimal 4 digit NACA parameterization of an airfoil 
that meets the the following design goals: (Listed in order of importance)
    - Re within in range (1e4, 1e5)
    - Alpha (Angle of attack) is 5 degrees
    - Lift/Drag Ratio is (25, 75) [for each respective range]
    - minimum max thickness = 6.5% chord
    - Maximize L/D ratio at alpha
"""

#Import relevant files for function use
import pyfoil
import numpy as np
import matplotlib.pyplot as plt
from bspaf import compute_z as bsp
from naca import naca4 as naca
from af import xspacing


#List Variables
Re = 1e5
Mach = 0.0
maxiter = 10
alpha = 5.0 # np.array(np.linspace(-3,7,20))
p = [0.015, 8.0, 7.5, 1.0, 1.0] #[2,4,12]    ##### NOTE this has 5 parameters ####
p1 = [0.1 , 3.0]   #First p value, Maximum Camber
p2 = [0.1, 5.2]   #Second p value, percent location of max camber along chord
p3 = [3, 6.5]      #Third p value, Maximum thickness (percent of chord)
h = .1             # A step size to try between for p values, go down in h as 
                   # we want to get a more accurate optimization?
                   
                   # Make sure that the distance between the p values upper and lower values 
                   # are evenly divisible by h.
             
f=open('data_11.txt','w')
xaf=xspacing()
data = np.zeros(4)



# In Judd's code he does something with a B-Spline, need to figure out what the heck
# the B-Spline does. I think he uses it in place of the NACA function
                   

#For loop to iterate through the desired range of p values
for i in range(int((p1[1]-p1[0])/h)):
    for j in range(int((p2[1]-p2[0])/h)):
        for k in range(int((p3[1]-p3[0])/h)):
            p = [(p1[0]+(h*i)),(p2[0]+(h*j)),(p3[0]+(h*k))]
            x,z = naca(p,xaf)
            cl, cd, cm, conv = pyfoil.runxfoil(x,z,alpha,Re,Mach,maxiter)
            rat = cl/cd
            info = np.array([p[0],p[1],p[2],rat])
            temp = np.concatenate((data,info))
            data = temp
            if k==int((p3[1]-p3[0])/h)-1:
                percent = (100*i)/int((p1[1]-p1[0])/h)
                print("Percent done:"),
                print(percent)
            
            
            
            
            

for a in range(len(data)):
    s=str(data[a])
    f.write(s + ' ')
    if (a+1)%4==0:
        f.write('\n')
        
f.close()
      
        
        

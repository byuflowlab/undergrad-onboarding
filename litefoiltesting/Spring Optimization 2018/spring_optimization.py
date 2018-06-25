#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Thu Jun 14 21:53:22 2018

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
Re = 1e4
Mach = 0.0
maxiter = 10 #I think this is the maximum number of iterations, but I'm not sure. 
alpha = 5.0 # np.array(np.linspace(-3,7,20))
goal = 25.0
p1 = [0.0 , 0.5]   #First p value, Maximum Camber
p2 = [5.0, 10.0]   #Second p value, percent location of max camber along chord
p3 = [4.0, 6.5]      #Third p value, Maximum thickness (percent of chord)
h = .1             # A step size to try between for p values, go down in h as 
                   # we want to get a more accurate optimization?
                   
                   # Make sure that the distance between the p values upper and lower values 
                   # are evenly divisible by h.
             

xaf=xspacing()
data = np.zeros(4)

print("Reynolds Number")
print(Re)
print('Mach Number')
print(Mach)
print('Maxiter') 
print(maxiter)
print('Angle of Attack: Alpha')
print(alpha)
print('target lift/drag ratio')
print(goal)
print('Naca parameters')
print('p1')
print(p1)
print('p2')
print(p2)
print('p3')
print(p3)
print('step size')
print(h)


# In Judd's code he does something with a B-Spline, need to figure out what the heck
# the B-Spline does. I think he uses it in place of the NACA function
                   
"""
#For loop to iterate through the desired range of p values and print them
#if they exceed the target Lift/Drag ratio
for i in range(int((p1[1]-p1[0])/h)):
    for j in range(int((p2[1]-p2[0])/h)):
        for k in range(int((p3[1]-p3[0])/h)):
            p = [(p1[0]+(h*i)),(p2[0]+(h*j)),(p3[0]+(h*k))]
            x,z = naca(p,xaf)
            cl, cd, cm, conv = pyfoil.runxfoil(x,z,alpha,Re,Mach,maxiter)
            rat = cl/cd
            info = np.array([p[0],p[1],p[2],rat])
            if rat>goal:
                print(info)
"""        
            
          


      
        
        

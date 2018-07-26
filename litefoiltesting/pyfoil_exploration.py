#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Thu Jul 12 11:21:12 2018

@author: adam
"""

#Import relevant files for function use
import pyfoil
import numpy as np
#import matplotlib.pyplot as plt
#from bspaf import compute_z as bsp
from naca import naca4 as naca
from af import xspacing

Re = 1e8
Mach = 0.0
Maxiter = 20
alfa = 0.555556
p = [0, 2, 5]

xaf = xspacing()
x,z = naca(p,xaf)

print("Input data: ")
print("alfa: ", alfa)
print("Re: ", Re)
print("Mach: ", Mach)
print("Maxiter: ", Maxiter)
print("P: ", p)

cl, cd, cm, conv = pyfoil.runxfoil(x,z,alfa,Re,Mach,Maxiter)

print("cl: ", cl)
print("cd: ", cd)
print("cm: ", cm)
print("conv: ", conv)
print("   ")

alfa = [-2.22222, 0 , 0.555556, 17.5]
Re = 1e8
Maxiter = 20
Mach = 0.1
p = [6,2,5]

print("Input data: ")
print("alfa: ", alfa)
print("Re: ", Re)
print("Mach: ", Mach)
print("Maxiter: ", Maxiter)
print("P: ", p)

CL = np.zeros(len(alfa))
CD = np.zeros(len(alfa))
CM = np.zeros(len(alfa))
CONV = np.zeros(len(alfa))

x,z = naca(p,xaf)

for i in range(0,len(alfa)):
    CL[i], CD[i], CM[i], CONV[i] = pyfoil.runxfoil(x,z,alfa[i],Re, Mach, Maxiter)
    
    
    
print("CL: ", CL)
print("CD: ", CD)
print("CM: ", CM)
print("CONV: ", CONV)


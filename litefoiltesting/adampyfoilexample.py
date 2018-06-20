#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Wed Jun 20 08:08:58 2018

@author: adam
"""

import pyfoil
import numpy as np
import matplotlib.pyplot as plt
from bspaf import compute_z as bsp
from naca import naca4 as naca
from af import xspacing

# --- Set Parameters --- #
Re = 1e5
Mach = 0.0
maxiter = 10
alpha = 5.0 # np.array(np.linspace(-3,7,20))
p = [0.1, 5.7, 3.8] #[2,4,12]

# --- Create Airfoil Geometry --- #
xaf = xspacing()
x,z = naca(p,xaf)
print x
# --- Run Xfoil --- #
cl, cd, cm, conv = pyfoil.runxfoil(x,z,alpha,Re,Mach,maxiter)

# --- Plot Stuff ---#

#single af fig:
plt.figure()
plt.axis('equal')
plt.plot(x,z)
plt.show()
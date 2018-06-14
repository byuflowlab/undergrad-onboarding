import pyfoil
import numpy as np
import matplotlib.pyplot as plt
from bspaf import compute_z as bsp
from naca import naca4 as naca
from af import xspacing

# --- Set Parameters --- #
Re = 1e6
Mach = 0.0
maxiter = 10
alpha = 2.0 # np.array(np.linspace(-3,7,20))
p = [0.015, 8.0, 7.5, 1.0, 1.0] #[2,4,12]

# --- Create Airfoil Geometry --- #
xaf = xspacing()
x,z = bsp(p,xaf) #naca(p,xaf)
print x
# --- Run Xfoil --- #
cl, cd, cm, conv = pyfoil.runxfoil(x,z,alpha,Re,Mach,maxiter)

# --- Plot Stuff ---#

#single af fig:
plt.figure()
plt.axis('equal')
plt.plot(x,z)
plt.show()
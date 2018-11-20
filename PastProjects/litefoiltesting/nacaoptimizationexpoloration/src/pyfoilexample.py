import pyfoil
import numpy as np
import matplotlib.pyplot as plt
from bspaf import compute_z as bsp
from naca import naca4 as naca
from af import xspacing

# --- Set Parameters --- #
Re = 1e7
Mach = 0.0
maxiter = 100
alpha = 2.0 # np.array(np.linspace(-3,7,20))
p = [4.49527659,  3.32387216, 11.23074539,  3.38520706] #[0.015, 8.0, 7.5, 1.0, 1.0] #[2,4,12]

# --- Create Airfoil Geometry --- #
xaf = xspacing()
x,z = naca(p,xaf) #bsp(p,xaf) #
# print x
# --- Run Xfoil --- #
cl, cd, cm, conv = pyfoil.runxfoil(x,z,alpha,Re,Mach,maxiter)
print cl, cd, conv
# --- Plot Stuff ---#

#single af fig:
plt.figure()
plt.axis('equal')
plt.plot(x,z)
plt.show()
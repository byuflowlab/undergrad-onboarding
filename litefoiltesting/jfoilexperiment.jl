import Xfoil
import AirfoilParams
using PyPlot


"""
Name: jfoilexperiment
Purpose: Explore the use of jfoil and figures. Trying out the use of arrays
though xfoil.sweep and the like.
Author: Adam Cardoza
Date started: 6/27/18
Inputs:
Outputs:
"""
temp = "THIS IS THE BEGINNING OF A NEW RUN"
println(temp)
println("")
println("")

# --- Set Parameters --- #
Re = 1e6
Mach = 0.0
maxiter = 10
aoa = linspace(-3,7,20)
p = [2,4,12]

# --- Create Airfoil Geometry --- #
x,z = AirfoilParams.naca4(p[1],p[2],p[3])

# --- Run Xfoil ---#

# # Real angle of attack sweep
#xl, cd, cdp, cm, converged = Xfoil.xfoilsweep(x,z,aoa,Re=1e6,Mach=0.0,maxiter=100)
# # Complex angle of attack sweep
# xl, cd, cdp, cm, converged = Xfoil.xfoilsweep_cs(x,z,aoa,Re=1e6,Mach=0.0,maxiter=100)
# #Real single run
#Xfoil.setCoordinates(x,z)
#cl, cd, cdp, cm, converged = Xfoil.solveAlpha(aoa,Re,mach=Mach,iter=maxiter)
# # Complex single run
# xl, cd, cdp, cm, converged = Xfoil.solveAlpha_cs(x,z,aoa,Re=1e6,Mach=0.0,maxiter=100)

# --- Plot Stuff --- #
figure()
plot(x,z)
show()

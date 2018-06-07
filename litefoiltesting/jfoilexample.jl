import Xfoil
import AirfoilParams
import PyPlot

# --- Set Parameters --- #
Re = 1e6
Mach = 0.0
maxiter = 10
aoa = 2.0 # linspace(-3,7,20)
p = [2,4,12]

# --- Create Airfoil Geometry --- #
x,z = AirfoilParams.naca4(p[1],p[2],p[3])

# --- Run Xfoil ---#

# # Real angle of attack sweep
# xl, cd, cdp, cm, converged = Xfoil.xfoilsweep(x,z,aoa,Re=1e6,Mach=0.0,maxiter=100)
# # Complex angle of attack sweep
# xl, cd, cdp, cm, converged = Xfoil.xfoilsweep_cs(x,z,aoa,Re=1e6,Mach=0.0,maxiter=100)
# Real single run
xl, cd, cdp, cm, converged = Xfoil.solveAlpha(x,z,aoa,Re,Mach,maxiter)
# # Complex single run
# xl, cd, cdp, cm, converged = Xfoil.solveAlpha_cs(x,z,aoa,Re=1e6,Mach=0.0,maxiter=100)

# --- Plot Stuff --- #
figure()
plot(x,z)
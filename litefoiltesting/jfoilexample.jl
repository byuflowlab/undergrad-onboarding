import Xfoil
import AirfoilParams
using PyPlot

# --- Set Parameters --- #
Re = 1e6
Mach = 0.0
maxiter = 10
aoa = collect(linspace(-3,7,20))#2.0 # linspace(-3,7,20)
p = [2,4,12]

# --- Create Airfoil Geometry --- #
x,zu,zl = AirfoilParams.naca4(p[1],p[2],p[3])

xx = vcat(x[end:-1:1], x)
zz = vcat(zu[end:-1:1],zl)
# --- Run Xfoil ---#

# # Real angle of attack sweep
cl, cd, cdp, cm, converged = Xfoil.xfoilsweep(xx,zz,aoa,Re,mach=0.0,iter=100)
# # Complex angle of attack sweep
# cl, cd, cdp, cm, converged = Xfoil.xfoilsweep_cs(x,z,aoa,Re=1e6,Mach=0.0,maxiter=100)
# Real single run
# Xfoil.setCoordinates(xx,zz)
# cl, cd, cdp, cm, converged = Xfoil.solveAlpha(aoa,Re,mach=Mach,iter=maxiter)
# # Complex single run
# cl, cd, cdp, cm, converged = Xfoil.solveAlpha_cs(x,z,aoa,Re=1e6,Mach=0.0,maxiter=100)

println(cl)
# --- Plot Stuff --- #
figure()
axis("equal")
plot(xx,zz)
show()

figure()
plot(aoa,cl,'o-')
show()
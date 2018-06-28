import Xfoil
import AirfoilParams
import PyPlot


"""
Name: jfoiltesting
Purpose: Create a set of data that I can compare with data from PyXlight to
determine if there is a difference in data, and if so how much.
Author: Adam Cardoza
Date started: 6/28/18
Inputs: A range of aoa, Re, and possibly Mach numbers or NACA parameters.
Outputs: A txt or csv file that I can use to analyze data.
Notes: While reading about Pycall, we might be getting some overhead from using
Pycall itself.
"""



## Setting Parameters ##
Re_exponent = [5, 6]
Mach = 0.0
maxiter = 10
alpha = [2.0, 3.0]
p = [2,4,12]

println("")
println("Begin New Run")
println("")

## --- Create Airfoil Geometry --- ##
x,z = AirfoilParams.naca4(p[1],p[2],p[3])

## Prepare for single run, cause I don't know how to use the sweep function yet
Xfoil.setCoordinates(x,z)

## Prepare txt file for output ##
outfile = "jfoil1.txt"
f = open(outfile,"w")
#println(f, "Re", "  ", "aoa", "  ", " cl", "  ", "cd", "  ")

#Iterate through the different combination of values
for i in 1:length(Re_exponent)
    for j in 1:length(alpha)
        aoa = alpha[j]
        Re = float(1*10^Re_exponent[i])
        cl, cd, cdp, cm, converged = Xfoil.solveAlpha(aoa,Re,mach=Mach,iter=maxiter)
        println(f, "1e", Re_exponent[i], "  ", aoa, "  ", cl, "  ", cd, "  ", )
    end
end

close(f)

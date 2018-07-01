import Xfoil
import AirfoilParams
#using PyPlot



"""
Name: jfoiltesting
Purpose: Create a set of data that I can compare with data from PyXlight to
determine if there is a difference in data, and if so how much.
Author: Adam Cardoza
Date started: 6/28/18
Inputs: A range of aoa, Re, and possibly Mach numbers or NACA parameters.
Outputs: Currently, print some data, but possibly have either a txt file,
figures or plots that help present the data.
Notes: While reading about Pycall, we might be getting some overhead from using
Pycall itself.
"""

## Setting Parameters ##
Re_exponent = [4, 8]
Mach_array= [0.0, 0.8]
maxiter = 10
aoa_length = 10
aoa = collect(linspace(-5,20,aoa_length))  #aoa must be a vector for xfoilsweep to work
X = reshape(aoa,1,aoa_length)
p1 = [0, 6]
p2 = [2, 4]
p3 = [5, 16]

#Initializing Variables and Arrays
count = 0
P = [0 0 0]
MACH = []
RE = []
CL = zeros(X)
CD = zeros(X)
CDP = zeros(X)
CM = zeros(X)
CONVERGED = []

println("")
println("Begin New Run")
println("")

## Iterate through the different combination of P values
for i in 1:length(p1)
    for j in 1:length(p2)
        for k in 1:length(p3)
            p = [p1[i] p2[j] p3[k]]
            ## Create Airfoil Geometry ##
            x,zu,zl = AirfoilParams.naca4(p[1],p[2],p[3])
            #concantenate the upper and lower, and make the vectors the same length
            xx = vcat(x[end:-1:1], x)
            zz = vcat(zu[end:-1:1],zl)

            # iterate through the different Re and Mach values
            for l in 1:length(Mach_array)
                for m in 1:length(Re_exponent)
                    Mach = Mach_array[l]
                    count += 1
                    Re = float(1 * 10^Re_exponent[m])
                    cl, cd, cdp, cm, converged = Xfoil.xfoilsweep(xx,zz,aoa,Re,mach=0.0,iter=10)
                    if count == 1
                        P = P + p
                    else
                        P = vcat(P,p)
                    end
                    append!(MACH,Mach)
                    append!(RE,Re)
                    println("[", P[count,1], ", ", P[count,2], ", ",P[count,3],"]" )
                    println(RE[count], "  ", MACH[count], "  ", aoa, "  ", cl, "  ", cd, "  ", )
                    println(" ")
                    #percent_done = count/()
                end
            end
        end
    end
end


#for i in 1:length(Re_exponent)
    #for j in 1:length(alpha)
        #Re = float(1*10^Re_exponent[i])
        #cl, cd, cdp, cm, converged = Xfoil.xfoilsweep(xx,zz,aoa,Re,mach=0.0,iter=100)
        #println("1e", Re_exponent[i], "  ", aoa, "  ", cl, "  ", cd, "  ", )
    #end
#end

#println(" ")
#println("PyXlight data")

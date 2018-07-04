import Xfoil
import AirfoilParams
using PyCall
@pyimport naca as NACA
@pyimport pyfoil
@pyimport numpy as np
@pyimport af


"""
Name: jfoiltesting.jl
Purpose: Create a set of data that I can compare with data from PyXlight to
determine if there is a difference in data, and if so how much.
Author: Adam Cardoza
Date started: 6/28/18

Inputs: A range of aoa, Re, and possibly Mach numbers or NACA parameters.
Outputs: Currently, print some data, but possibly have either a txt file,
figures or plots that help present the data.

Notes: I am accomplishing this by running all of the data using xfoil.jl, after
I will collect my PyXlight data by using pycall.
"""


## Setting Parameters ##
Re_exponent = [4, 8]
Mach_array= [0.0, 0.1] #Got a warning/error sourced from Xfoil saying
#CPCALC Local speed too fast, (Or something like that) when Mach == 0.8
iterations = 50
per_maint = true    #Percussive Maintenance.
aoa_length = 10
aoa = collect(linspace(-5,20,aoa_length))  #aoa must be a vector for xfoilsweep to work
X = reshape(aoa,1,aoa_length)
p1 = [0, 6]
p2 = [2, 4]
p3 = [5, 16]

#Initializing Variables and Arrays
count = 0
num_calcs = length(p1)*length(p2)*length(p3)*length(Mach_array)*length(Re_exponent)
P = [0 0 0]
MACH = []
RE = []

# Due to array adding rules, I initialized storage arrays to zero, and will
# reset the initial value later with an if statement.

CLj = zeros(X)
CDj = zeros(X)
CDPj = zeros(X)
CMj = zeros(X)
CONVERGEDj = zeros(Bool,1,length(X))
CLpy = zeros(X)
CDpy = zeros(X)
CDPpy = zeros(X) #Will go unused because pyfoil doesn't output this data
CMpy = zeros(X)
CONVERGEDpy = zeros(Bool,1,length(X))

println("")
println("Begin New Run")
println("")

println("Running Julia Data")
## Iterate through the different combination of P values
tic()
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
                    #format data to input to xfoil
                    Mach = Mach_array[l]
                    count += 1
                    Re = float(1 * 10^Re_exponent[m])

                    #Run xfoil
                    cl, cd, cdp, cm, converged = Xfoil.xfoilsweep(xx,zz,aoa,Re,mach=Mach,iter=iterations,npan=140,percussive_maintenance=per_maint)

                    #Format and save Data
                    cl = reshape(cl,1,length(cl))
                    cd = reshape(cd,1,length(cd))
                    cdp = reshape(cdp,1,length(cdp))
                    cm = reshape(cm,1,length(cm))
                    converged = reshape(converged,1,length(converged))
                    if count == 1   #reseting the initial values to actual
                        P = P + p
                        CLj = CLj + cl
                        CDj = CDj + cd
                        CDPj = CDPj + cdp
                        CMj = CMj + cm
                        CONVERGEDj = CONVERGEDj + converged
                    else
                        P = vcat(P,p)
                        CLj = vcat(CLj,cl)
                        CDj = vcat(CDj,cd)
                        CDPj = vcat(CDPj,cdp)
                        CMj = vcat(CMj,cm)
                        CONVERGEDj = vcat(CONVERGEDj, converged)
                    end
                    append!(MACH,Mach)
                    append!(RE,Re)
                    #println("[", P[count,1], ", ", P[count,2], ", ",P[count,3],"]" )
                    #println(RE[count], "  ", MACH[count], "  ", aoa, "  ", cl, "  ", cd, "  ", )
                    #println(converged)
                    percent_done = 100*count/num_calcs
                    println("Julia Calculation Percent Done: ", percent_done,"%")
                    println(" ")
                end
            end
        end
    end
end

julia_time = toc()

#Run the exact same data set, but use PyCall to run the data through Xfoil
#and store it in some different arrays
println("Running Python data")
count = 0
tic()
## Iterate through the different combination of P values
for i in 1:length(p1)
    for j in 1:length(p2)
        for k in 1:length(p3)
            p = [p1[i], p2[j], p3[k]]

            ## Create Airfoil Geometry ##
            xaf = af.xspacing(80) #80 is the number that is set in AirfoilParams.jl
            x,z = NACA.naca4(p,xaf)

            # iterate through the different Re and Mach values
            for l in 1:length(Mach_array)
                for m in 1:length(Re_exponent)
                    #format data to input to xfoil
                    Mach = Mach_array[l]
                    count += 1
                    Re = float(1 * 10^Re_exponent[m])

                    #Run xfoil
                    cl, cd, cm, converged = pyfoil.runxfoil(x, z, aoa, Re, Mach, iterations, per_maint)
                    #Format and save Data
                    cl = reshape(cl,1,length(cl))
                    cd = reshape(cd,1,length(cd))
                    cm = reshape(cm,1,length(cm))
                    converged = reshape(converged,1,length(converged))
                    if count == 1   #reseting the initial values to actual
                        CLpy = CLpy + cl
                        CDpy = CDpy + cd
                        CMpy = CMpy + cm
                        CONVERGEDpy = CONVERGEDpy + converged
                    else
                        CLpy = vcat(CLpy,cl)
                        CDpy = vcat(CDpy,cd)
                        CMpy = vcat(CMpy,cm)
                        CONVERGEDpy = vcat(CONVERGEDpy, converged)
                    end
                    #println("[", P[count,1], ", ", P[count,2], ", ",P[count,3],"]" )
                    #println( aoa, "  ", cl, "  ", cd, "  ", )
                    #println(converged)
                    percent_done = 100*count/num_calcs
                    println("Python Calculation Percent Done: ", percent_done,"%")
                    println(" ")
                end
            end
        end
    end
end
python_time = toc()


#Begin Analysis
println(" ")
println("Start Analysis")
println("###############################")
println(" ")

#calulate error
temp = CLj-CLpy
clerror = 100*temp./CLpy
temp = CDj - CDpy
cderror = 100*temp./CDpy
temp = CMj - CMpy
cmerror = 100*temp./CMpy

#Error extrema
clerror_max = maximum(clerror)
clerror_min = minimum(clerror)
cderror_max = maximum(cderror)
cderror_min = minimum(cderror)
cmerror_max = maximum(cmerror)
cmerror_min = minimum(cmerror)

#Calculate average error
clavg_error = 0.0
cdavg_error = 0.0
cmavg_error = 0.0
for i in 1:length(clerror)
    clavg_error += clerror[i]
    cdavg_error += cderror[i]
    cmavg_error += cmerror[i]
end
clavg_error = clavg_error/length(clerror)
cdavg_error = cdavg_error/length(cderror)
cmavg_error = cmavg_error/length(cmerror)

#time analysis
time_ratio = julia_time/python_time
time_diff = julia_time - python_time

#Print outcomes
println("Max error: ")
println("   ", "cl error: ", clerror_max)
println("   ", "cd error: ", cderror_max)
println("   ", "cm error: ", cmerror_max)
println(" ")
println("Min error: ")
println("   ", "cl error: ", clerror_min)
println("   ", "cd error: ", cderror_min)
println("   ", "cm error: ", cmerror_min)
println(" ")
println("Avg error: ")
println("   ", "cl error: ", clavg_error)
println("   ", "cd error: ", cdavg_error)
println("   ", "cm error: ", cmavg_error)
println(" ")
println("Time ratio: ", time_ratio, " (Julia/Python)")
println("Time diff: ", time_diff, " (Julia-Python)")

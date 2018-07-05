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
I will collect my PyXlight data by using pycall. USES FILE pyfoil.py that Judd created
for me. Not a normal part of pyXlight, may consider using other file.
"""


## Setting Parameters for data collection ##
Re_exponent = [4, 8]    #This is the exponent of the reynolds number. It creates an appropriate array below.
Mach_array= [0.0, 0.1] #Got a warning/error sourced from Xfoil saying
#CPCALC Local speed too fast, (Or something like that) when Mach == 0.8
iterations = 20     #This is the number of iterations that Xfoil goes through to calc
per_maint = false    #Percussive Maintenance.
aoa_length = 10     #determines the number of entries in aoa array
x_length= 100       #Julia is automatically set at 100, and can't change without
#changing source code. This is half the number of points entered into Xfoil for the
#shape of the wing.
aoa = collect(linspace(-5,20,aoa_length))  #aoa must be a vector for xfoilsweep to work
X = reshape(aoa,1,aoa_length)
p1 = [0, 6]
p2 = [2, 4]
p3 = [5, 16]

## Setting parameters for data analysis ##
error_tol = 5 #written in percent. Will notify if regions have error greater than error_tol
show_max = 1    #for all show vars, if 1, will print said data to screen
show_min = 1
show_avg = 1
show_time = 1

#Initializing Variables and Arrays
count = 0
num_calcs = length(p1)*length(p2)*length(p3)*length(Mach_array)*length(Re_exponent)
Pj = [0 0 0]
Ppy = [0 0 0]
MACHj = []
MACHpy= []
REj = []
REpy = []

# Due to array adding rules, I initialized storage arrays to zero, and will
# reset the initial value later with an if statement.
Xj = zeros(Float64, 1, 2*x_length)
Xpy = zeros(Float64, 1, 2*x_length)
Zj = zeros(Float64, 1, 2*x_length)
Zpy = zeros(Float64, 1, 2*x_length)
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
            x,zu,zl = AirfoilParams.naca4(p[1],p[2],p[3],x_length,bluntTE=true) #c, p, t, N ( number of iterations), bluntTE
                #the python naca file doesn't have a bluntTE file, could be calling incorrectly

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
                    # xx & zz are the shape of the airfoil, created earlier -- differences shown below
                    #aoa is the array of angle of attacks -- the code puts the exact same array in both calls
                    #Re is the current Reynolds number -- both calls receive same vars
                    #mach is the current mach number (airspeed?) -- same as Re
                    #iter is the number of iterations the function attemps to solve? -- same on both calls
                    #npan is the the number of panels used in Xfoil, julia default=140, python default=??? xfoil default=140.
                    #percussive_maintenance is a bool of whether or not percussive_maintenance is used -- same on both calls

                    #Format and save Data
                    xtemp = reshape(xx, 1, 2*x_length)
                    ztemp = reshape(zz, 1, 2*x_length)
                    cl = reshape(cl,1,length(cl))
                    cd = reshape(cd,1,length(cd))
                    cdp = reshape(cdp,1,length(cdp))
                    cm = reshape(cm,1,length(cm))
                    converged = reshape(converged,1,length(converged))
                    if count == 1   #reseting the initial values to actual
                        Xj += xtemp
                        Zj += ztemp
                        Pj += p
                        CLj += cl
                        CDj += cd
                        CDPj += cdp
                        CMj += cm
                        CONVERGEDj += converged
                    else
                        Xj = vcat(Xj,xtemp)
                        Zj = vcat(Zj,ztemp)
                        Pj = vcat(Pj,p)
                        CLj = vcat(CLj,cl)
                        CDj = vcat(CDj,cd)
                        CDPj = vcat(CDPj,cdp)
                        CMj = vcat(CMj,cm)
                        CONVERGEDj = vcat(CONVERGEDj, converged)
                    end
                    append!(MACHj,Mach)
                    append!(REj,Re)
                    #println("[", Pj[count,1], ", ", Pj[count,2], ", ",Pj[count,3],"]" )
                    #println(REj[count], "  ", MACHj[count], "  ", aoa, "  ", cl, "  ", cd, "  ", )
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
            xaf = af.xspacing(x_length) #80 is the number that is set in AirfoilParams.jl
            #line 3, however in naca.jl line 41 it is called with 100
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
                    xtemp = reshape(x, 1, 2*x_length)
                    ztemp = reshape(z, 1, 2*x_length)
                    ptemp = reshape(p,1,3)
                    cl = reshape(cl,1,length(cl))
                    cd = reshape(cd,1,length(cd))
                    cm = reshape(cm,1,length(cm))
                    converged = reshape(converged,1,length(converged))
                    if count == 1   #reseting the initial values to actual
                        Xpy += xtemp
                        Zpy += ztemp
                        Ppy += ptemp
                        CLpy += cl
                        CDpy += cd
                        CMpy += cm
                        CONVERGEDpy = CONVERGEDpy + converged
                    else
                        Xpy = vcat(Xpy, xtemp)
                        Zpy = vcat(Zpy, ztemp)
                        Ppy = vcat(Ppy, ptemp)
                        CLpy = vcat(CLpy,cl)
                        CDpy = vcat(CDpy,cd)
                        CMpy = vcat(CMpy,cm)
                        CONVERGEDpy = vcat(CONVERGEDpy, converged)
                    end
                    append!(MACHpy, Mach)
                    append!(REpy, Re)
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

#printout % converged
#Something to indicate where they overlap in convergence
#Collect the range of data that show where they converge and where
#   they don't. Make note of any trends.
#Only show error if they both converge
#Min error doesn't matter, max and avg are good
#

#Determine Convergence overlap and difference
conv_comp = (2*CONVERGEDpy)-CONVERGEDj
conv_both = find(conv_comp .== 1)
conv_j = find(conv_comp .== -1)
conv_py = find(conv_comp .== 2)
conv_none = find(conv_comp .== 0)

"""
#calulate total error
xerror = 100*(Xpy - Xj)./Xpy
zerror = 100*(Zpy - Zj)./Zpy
clerror = 100*(CLpy-CLj)./CLpy
cderror = 100*(CDpy-CDj)./CDpy
cmerror = 100*(CMpy-CMj)./CMpy

#Error extrema
xerror_max = findmax(xerror)
xerror_min = findmin(xerror)
zerror_max = findmax(zerror)
zerror_min = findmin(zerror)
clerror_max = findmax(clerror)
clerror_min = findmin(clerror)
cderror_max = findmax(cderror)
cderror_min = findmin(cderror)
cmerror_max = findmax(cmerror)
cmerror_min = findmin(cmerror)

#Calculate average error
xavg_error = 0.0
zavg_error = 0.0
clavg_error = 0.0
cdavg_error = 0.0
cmavg_error = 0.0
for i in 1:length(clerror)
    xavg_error += xerror[i]
    zavg_error += zerror[i]
    clavg_error += clerror[i]
    cdavg_error += cderror[i]
    cmavg_error += cmerror[i]
end
xavg_error = xavg_error/length(xerror)
zavg_error = zavg_error/length(zerror)
clavg_error = clavg_error/length(clerror)
cdavg_error = cdavg_error/length(cderror)
cmavg_error = cmavg_error/length(cmerror)
"""

#time analysis
time_ratio = julia_time/python_time
time_diff = julia_time - python_time

#Print outcomes
if show_max == 1
    println("Max error: ")
    #if xerror_max[1] >= error_tol
    println("   ", "x error: ", xerror_max, "%")
    #end
    #if zerror_max[1] >= error_tol
    println("   ", "z error: ", zerror_max, "%")
    #end
    println("   ", "cl error: ", clerror_max, "%")
    println("   ", "cd error: ", cderror_max, "%")
    println("   ", "cm error: ", cmerror_max, "%")
    println(" ")
end
if show_min == 1
    println("Min error: ")
    println("   ", "x error: ", xerror_min, "%")
    println("   ", "z error: ", zerror_min, "%")
    println("   ", "cl error: ", clerror_min, "%")
    println("   ", "cd error: ", cderror_min, "%")
    println("   ", "cm error: ", cmerror_min, "%")
    println(" ")
end
if show_avg == 1
    println("Avg error: ")
    println("   ", "x error: ", xavg_error, "%")
    println("   ", "z error: ", zavg_error, "%")
    println("   ", "cl error: ", clavg_error, "%")
    println("   ", "cd error: ", cdavg_error, "%")
    println("   ", "cm error: ", cmavg_error, "%")
    println(" ")
end
if show_time == 1
    println("Time ratio: ", time_ratio, " (Julia/Python)")
    println("Time diff: ", time_diff, " (Julia-Python)")
end

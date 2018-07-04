"""
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
                    #format data to input to xfoil
                    Mach = Mach_array[l]
                    count += 1
                    Re = float(1 * 10^Re_exponent[m])

                    #Run xfoil
                    cl, cd, cdp, cm, converged = Xfoil.xfoilsweep(xx,zz,aoa,Re,mach=0.0,iter=10)

                    #Format and save Data
                    cl = reshape(cl,1,length(cl))
                    cd = reshape(cd,1,length(cd))
                    cdp = reshape(cdp,1,length(cdp))
                    cm = reshape(cm,1,length(cm))
                    converged = reshape(converged,1,length(converged))
                    if count == 1   #reseting the initial values to actual
                        P = P + p
                        CL = CL + cl
                        CD = CD + cd
                        CDP = CDP + cdp
                        CM = CM + cm
                        CONVERGED = CONVERGED + converged
                    else
                        P = vcat(P,p)
                        CL = vcat(CL,cl)
                        CD = vcat(CD,cd)
                        CDP = vcat(CDP,cdp)
                        CM = vcat(CM,cm)
                        CONVERGED = vcat(CONVERGED, converged)
                    end
                    append!(MACH,Mach)
                    append!(RE,Re)
                    println("[", P[count,1], ", ", P[count,2], ", ",P[count,3],"]" )
                    println(RE[count], "  ", MACH[count], "  ", aoa, "  ", cl, "  ", cd, "  ", )
                    println(converged)
                    percent_done = 100*count/num_calcs
                    println("Julia Calculation Percent Done: ", percent_done,"%")
                    println(" ")
                end
            end
        end
    end
end
"""

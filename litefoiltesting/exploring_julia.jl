workspace()

using PyCall
@pyimport pyXLIGHT as pyfoil
@pyimport numpy as np

println("start")

function naca4(P,x)

    #NACA 4-Series parameterization method
    # normalize inputs
    m = P[1]/100.0
    p = P[2]/10.0
    tc = P[3]/100.0

    # thickness
    tau = 5*tc*(0.2969*np.sqrt(x) - 0.1260*x - 0.3516*x.^2 + 0.2843*x.^3 - 0.1015*x.^4)

    # camber (normal to chord)
    if np.iscomplexobj([m, p, tc])
        zc = np.zeros_like(x, dtype="complex")
    else
        zc = np.zeros_like(x)
    end

    if p != 0
        idx = np.argwhere(x <= np.real(p))
        zc[idx] = m/p^2*(2*p*x[idx] - x[idx]^2)
        idx = np.argwhere(x > np.real(p))
        zc[idx] = m/(1-p)^2*(1-2*p + 2*p*x[idx] - x[idx]^2)
    end

    # upper and lower surface
    zu = zc + tau
    zl = zc - tau
    xx = np.r_[x[end:-1:1], x[1:end]]
    zz = np.r_[zu[end:-1:1], zl[1:end]]

    return xx, zz
end

function xspacing(nx=100)
    #x/c - cosine spacing
    x = 0.5*(1-np.cos(np.pi/(nx-1)*np.arange(0, nx)))
    return x
end

#He said something about turning percussive maintenance off.
function runxfoil(x,z,alpha,Re=1e6,Mach=0.0,maxiter=100,percuss=True)
"""
    Run Xfoil for give geometry and angle of attack



    # --- define percussive maintenance function --- #
    def percussivemaintenance(alpha, Re, maxiter=25):
        #set reynolds and aoa bump values
        rm = 1000
        if alpha <= 0.0
            am = 0.1
        else
            am = -0.
        end

        #initialize taps
        remod = Re+rm
        aoamod = alpha+am
        counter = 0

        #hammer to fit
        for i in range(0,maxiter)
            cl, cd, cm, exitflag, conv = af.solveAlpha(aoamod, remod, Mach, maxiter)
            fail = ((exitflag == 1) or (conv == 0))
            counter += 1
            if fail == False
                break
            end

            remod += rm
            aoamod += am

        if fail == False:
            #set backtracking taps
            backsteps = (counter+3)/3
            rediff = (remod - Re)/float(backsteps)
            aoadiff = (aoamod - alpha)/float(backsteps)
            #paint to match
            for i in range(0,backsteps):
                remod -= rediff
                aoamod -= aoadiff
                cl, cd, cm, exitflag, conv = af.solveAlpha(aoamod, remod, Mach, maxiter)
        else:
            cl, cd, cm, exitflag, conv = af.solveAlpha(alpha, Re, Mach, maxiter)
        #return (even if it doesn't converge...)
        return cl, cd, cm, exitflag, conv
"""


# --- Xfoil analysis --- #

#initialize analysis
    af = pyfoil.xfoilAnalysis()
#set airfoil coordinates
    af.setCoordinates(x, z)
    #run xfoil
    if typeof(alpha) == np.ndarray
        cl = np.zeros(len(alpha))
        cd = np.zeros(len(alpha))
        cm = np.zeros(len(alpha))
        fail = np.zeros(len(alpha))
        #run sweep
        for i in range(0,len(alpha))
            cl[i], cd[i], cm[i], exitflag, conv = af.solveAlpha(alpha[i], Re, Mach, maxiter)
            fail[i] = ((exitflag == 1) || (conv == 0))
        end
            """
            #perform percussive maintainance if not converged
            if percuss == True and fail[i] == True
                cl[i], cd[i], cm[i], exitflag, conv = percussivemaintenance(alpha[i], Re, maxiter/4)
                fail[i] = ((exitflag == 1) or (conv == 0))
            end
            """
    else
        cl, cd, cm, exitflag, conv = af.solveAlpha(alpha, Re, Mach, maxiter)
        fail = ((exitflag == 1) || (conv == 0))
        """
        #perform percussive maintainance if not converged
        if percuss == True && fail == True:
            cl, cd, cm, exitflag, conv = percussivemaintenance(alpha, Re, maxiter/4)
            fail = ((exitflag == 1) or (conv == 0))
        end
        """
    end
    #returns
    return cl, cd, cm, fail
end

println("Start analysis")

#define variables
Re = 1e4
mach = 0.0
maxiter = 10
p = [2 4 12]
aoa_length = 10
aoa = collect(linspace(-5,20,aoa_length))

x = xspacing()
x, zu, zl = naca4(p, x)
xx = vcat(x[end:-1:1]],x)
zz = vcat(zu[end:-1:1],zl)

cl, cd, cdp, cm, converged = pyfoil.runxfoil(xx, zz, aoa, Re,mach=0.0, iter=10)
println(cl, "--", cd, "--")



println("done")

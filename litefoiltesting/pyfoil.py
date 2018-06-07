import pyXLIGHT as xfoil #pyxlight.pyXLIGHT as xfoil
import numpy as np

def runxfoil(x,z,alpha,Re=1e6,Mach=0.0,maxiter=100,percuss=True):
    '''
    Run Xfoil for give geometry and angle of attack
    '''
    # --- define percussive maintenance function --- #
    def percussivemaintenance(alpha, Re, maxiter=25):
        #set reynolds and aoa bump values
        rm = 1000
        if alpha <= 0.0:
            am = 0.1
        else:
            am = -0.1
        #initialize taps
        remod = Re+rm
        aoamod = alpha+am
        counter = 0
        #hammer to fit
        for i in range(0,maxiter):
            cl, cd, cm, exitflag, conv = af.solveAlpha(aoamod, remod, Mach, maxiter)
            fail = ((exitflag == 1) or (conv == 0))
            counter += 1
            if fail == False:
                break
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

    # --- Xfoil analysis --- #
    #initialize analysis
    af = xfoil.xfoilAnalysis()
    #set airfoil coordinates
    af.setCoordinates(x, z)
    #run xfoil
    if type(alpha) == np.ndarray:
        cl = np.zeros(len(alpha))
        cd = np.zeros(len(alpha))
        cm = np.zeros(len(alpha))
        fail = np.zeros(len(alpha))
        #run sweep
        for i in range(0,len(alpha)):
            cl[i], cd[i], cm[i], exitflag, conv = af.solveAlpha(alpha[i], Re, Mach, maxiter)
            fail[i] = ((exitflag == 1) or (conv == 0))
            #perform percussive maintainance if not converged
            if percuss == True and fail[i] == True:
                cl[i], cd[i], cm[i], exitflag, conv = percussivemaintenance(alpha[i], Re, maxiter/4)
                fail[i] = ((exitflag == 1) or (conv == 0))
    else:
        cl, cd, cm, exitflag, conv = af.solveAlpha(alpha, Re, Mach, maxiter)
        fail = ((exitflag == 1) or (conv == 0))
        #perform percussive maintainance if not converged
        if percuss == True and fail == True:
            cl, cd, cm, exitflag, conv = percussivemaintenance(alpha, Re, maxiter/4)
            fail = ((exitflag == 1) or (conv == 0))
    #returns
    return cl, cd, cm, fail



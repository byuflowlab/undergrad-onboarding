import pyfoil
import numpy as np
import matplotlib.pyplot as plt

# --- Set Parameters --- #
Re = 1e6
Mach = 0.0
maxiter = 10
alpha = 2.0 # np.array(np.linspace(-3,7,20))
p = [2,4,12]

# --- Create Airfoil Geometry --- #
def xspacing(nx=100):
    '''
    x/c - cosine spacing
    '''
    x = 0.5*(1-np.cos(np.pi/(nx-1)*np.arange(0, nx)))

    return x

def naca4(P):
    '''
    NACA 4-Series parameterization method
    '''
    x = xspacing
    # normalize inputs
    m = P[0]/100.0
    p = P[1]/10.0
    tc = P[2]/100.0

    # thickness
    tau = 5*tc*(0.2969*np.sqrt(x) - 0.1260*x - 0.3516*x**2 + 0.2843*x**3 - 0.1015*x**4)

    # camber (normal to chord)
    if np.iscomplexobj([m, p, tc]):
        zc = np.zeros_like(x, dtype="complex")
    else:
        zc = np.zeros_like(x)

    if p != 0:
        idx = np.argwhere(x <= np.real(p))
        zc[idx] = m/p**2*(2*p*x[idx] - x[idx]**2)
        idx = np.argwhere(x > np.real(p))
        zc[idx] = m/(1-p)**2*(1-2*p + 2*p*x[idx] - x[idx]**2)

    # upper and lower surface
    zu = zc + tau
    zl = zc - tau
    xx = np.concatenate([xu[::-1], xl[0:]])
    zz = np.concatenate([zu[::-1], zl[0:]])

    return xx, zz

x,z = naca4(p)

# --- Run Xfoil --- #
cl, cd, cm, conv = pyfoil.runxfoil(x,z,alpha,Re,Mach,maxiter)

# --- Plot Stuff ---#

#single af fig:
plt.figure()
plt.plot(x,z)
plt.show()
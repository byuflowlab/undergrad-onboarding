import numpy as np
def naca4(P,x):
    '''
    NACA 4-Series parameterization method
    '''

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
    xx = np.r_[x[::-1], x[0:]]
    zz = np.r_[zu[::-1], zl[0:]]

    return xx, zz
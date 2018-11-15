import numpy as np

def xspacing(nx=100):
    '''
    x/c - cosine spacing
    '''
    x = 0.5*(1-np.cos(np.pi/(nx-1)*np.arange(0, nx)))

    return x
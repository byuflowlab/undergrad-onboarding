
using PyCall
@pyimport naca as NACA
@pyimport pyfoil
@pyimport numpy as np
@pyimport af

println("start")


"""
function xspacing(nx=100)
    #x/c - cosine spacing
    x = 0.5*(1-np.cos(np.pi/(nx-1)*np.arange(0, nx)))
    return x
end
"""



#define variables
Re = 1e4
mach = 0.0
maxiter = 10
p = [2, 4, 12]
aoa_length = 10
aoa = collect(linspace(-5,20,aoa_length))

xaf = af.xspacing()
x,z = NACA.naca4(p, xaf)
#xx = vcat(x[end:-1:1]],x)
#zz = vcat(zu[end:-1:1],zl)
#af = pfoil.xfoilAnalysis()
#af.setCoordinates(x,z)

cl, cd, cm, converged = pyfoil.runxfoil(x, z, aoa, Re,mach, 10)
println(cl, "--", cd, "--")



println("done")

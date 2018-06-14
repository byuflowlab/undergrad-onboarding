import scipy
from scipy.interpolate import BSpline as bspline
import numpy as np

def bsp(design_vars, xoc):
    n = len(design_vars)
    radius_le = design_vars[0]
    boat_tail_deg = design_vars[1]
    te_camber_deg = design_vars[2]
    te_thickness = 0.0 #design_vars[3]
    if n > 4-1:
        if n % 2 == 1-1:
            raise ValueError("design_vars must have an odd number of elements, given " + str(len(design_vars)))

        np = (n - 4-1) / 2
        dpu = design_vars[4-1:4-1+np]
        dpl = design_vars[4-1+np:]
    else:
        dpu = None
        dpl = None

    airfoil = BSplineAirfoilSection.from_radius_boat_tail(radius_le, boat_tail_deg, te_camber_deg, te_thickness, dpu, dpl)
    u = xoc ** 0.5
    zu = airfoil.upper(u)
    zl = airfoil.lower(u)
    return zu, zl

def from_radius_boat_tail(radius_le, boat_tail_deg, te_camber_deg, te_thickness=0, dpu=None, dpl=None):
    p1 = [0,0]
    p4u = [1,te_thickness/2.0]
    p4l = [1,-te_thickness/2.0]

    # We want this because we want x = t^2, to simplify our derivative computations
    xp = np.array([-0.0, -0.0, 0.33333333, 1.0])

    # The third control point determines the boat-tail angle, so we know on what line it needs to be
    y3u = (1 - xp[2]) * np.tan(np.radians(boat_tail_deg + te_camber_deg))
    p3u = [xp[2], y3u]

    y3l = (1 - xp[2]) * np.tan(np.radians(-boat_tail_deg + te_camber_deg))
    p3l = [xp[2], y3l]

    # Second control point must be on the z-axis (because start tangent is vertical)
    # radius_le = n * a^2 / (n - 1) * h
    # Invert above formula to figure out distance along z-axis where that second control point must be
    n = 3
    y2 = np.sqrt(radius_le * (n - 1) * xp[2] / n)
    p2u = [0, y2]
    p2l = [0, -y2]

    cu = np.array([p1, p2u, p3u, p4u])
    cl = np.array([p1, p2l, p3l, p4l])

    t = (0,0,0,0,1,1,1,1)
    su = bspline(t, cu, 3)
    sl = bspline(t, cl, 3)

    su = BSplineAirfoilSection._perturb(su, dpu)
    sl = BSplineAirfoilSection._perturb(sl, dpl)

    return BSplineAirfoilSection(su, sl)

def _perturb(s, perturbations):
    if perturbations is None:
        return s

    dv_count = len(perturbations) + 2

    for i in range(1,dv_count-1):
        s = scipy.interpolate.insert(i * 1.0/(dv_count-1), s)

    cp_count = dv_count + 2
    s.c[2:cp_count-2,1] *= perturbations

    return s
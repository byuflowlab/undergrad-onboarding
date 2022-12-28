# Rotor Design Track Reading List

The theory exam for the Rotor Design track will come from the following readings:

- [Flight Vehicle Design](http://flowlab.groups.et.byu.net/me415/flight.pdf)
  - Chapter 2: Fundamentals (13 pages)

- [Computational Aerodynamics](https://byu.box.com/shared/static/ywfayozbj3sr2ot6b32u8nqk5brqvurt.pdf)
  - Chapter 1, Section 6: Dynamic Similarity (5 pages)
  - Chapter 6, Sections 1-3 (36 pages)

- [Engineering Design Optimization](http://flowlab.groups.et.byu.net/mdobook.pdf)
  - Chapter 1: Introduction (32 pages)

## Additional Readings (Optional)
- [Engineering Design Optimization](http://flowlab.groups.et.byu.net/mdobook.pdf)
  - Chapter 5: Constrained Gradient-based Optimization
  - or other chapters depending on your optimization approach.

## Test Concepts
A deeper list of the concepts covered in the theory test for rotor analysis.

- Blade-Element Momentum (BEM) theory basics
  - Airfoil fundamentals
    - Airfoil Geometry
      - chord, leading edge, trailing edge, thickness, camber, angle of attack
    - Polars
      - Relationship between forces, moments and angle of attack
      - Polar characteristics
        - Lift curve slope, stall angle of attack, zero-lift angle of attack, lift-over-drag ratio
  - Analysis method of BEM
    - Conservation of linear and angular momentum
      - Inflowing air, forces imparted on/by the rotor, outflowing air
    - Relationship between twist, pitch, angle of attack, and inflow angle
  - Assumptions of BEM
    - Steady, no 3D effects
    - Incompressible
  - Pitfalls of BEM
    - Steady
      - Can apply a dynamic stall model
    - Doesn't account for crossflow (Tilt, yaw)
      - Can apply a yaw model
    - Doesn't account for other 3D effects
      - Can apply 3D corrections, tip-loss corrections, and add the Coriolis effect
  - Preliminary Results
    - How normal and tangential loadings vary along the blade
    - Relationship between radius and thrust, torque, and root bending moment
    - Relationship between chord and thrust, torque, and root bending moment

- Design Optimization basics
  - Objective Function
    - What is an objective function
      - What makes a good objective function
    - What is a design variable
      - What makes a good design variable
  - Constraints
    - How to apply constraints
      - Internal to the method
      - A penalty function

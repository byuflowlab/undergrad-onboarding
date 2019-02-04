# Aerodynamics Projects

These projects deal more exclusively with aerodynamics, as opposed to aircraft or turbine design. 

## Airfoils

[IGAFoil Accuracy Analysis]()

XFOIL is a common airfoil analysis tool used in research and industry. IGAFoil is another airfoil analysis tool in development in the FLOW Lab. Once ready the tool will require verification and validation, and sources of inaccuracy and bugs will need to be identified in order to improve performance and usability.

[Flapped Airfoil Optimization]()

There are several airfoil parameterization methods used in airfoil design. A B-spline based method is utilized in the IGAFoil code. An interesting project would be to extend that parameterization to include flaps (angling the trailing edge to approximate control surface deflections). Along with the parameterization would be analysis and optimization to demonstrate the capabilites of IGAFoil in this setting.

## Shape Optimization

[2D Shape Optimization]()

Design, and complete a 2D airfoil shape optimization


## "New" Panel Methods

[IGAFoil Viscous Solver]()

Currently, the IGAFoil code solves for an inviscid flow field. A project to include viscosity would be helpful to increase the usability of the code. Decisions would have to be made concerning how to couple the solutions and how to take as much advantage of the attractive properties inherent in IGAFoil as possible, while still resulting in accurate viscous solutions.

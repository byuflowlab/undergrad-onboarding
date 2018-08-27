#Dependencies for users 
	These files must be added to the PYTHONPATH in order for the program to run.

	PyXlight 
		(Flowlab Modified version) (Package) (Xfoil wrapper)
	Pyxlight is a wrapper for xfoil, and the whole package must be added to your PYTHONPATH in order to call xfoil using python. In order to use pyXLIGHT, you will need to build it.To build it, simply run `python setup.py'in the pyxlight directory. Note that this version of pyXLIGHT is very slightly modified from the original found at: https://bitbucket.org/mdolab/pyxlight/src

	pyfoil.py 
	bspaf.py
	naca.py
		
	These files contain a series of functions that use pyxlight to access xfoil in a simple manner. They must also be on your PYTHONPATH. They can be found in the src directory. 

#Description of project
	The point of this project was to experiment with using Pyxlight, optimization and gain some experience with NACA parameters. I was tasked with finding the maximum lift to drag ratio under certain constraints. I accomplished this by using python to run through a series of NACA parameters and then printing that information to a txt doc which I read into excel and analyzed there (I was unfamiliar with using python as a numerical analysis tool.). 

#Improvements
	This project could be improved by developing code to conduct numerical analysis within the python script, insuring that actual NACA parameters are part of the search. I would also suggest not making your report as long as mine, it doesn't need a report of everything you've learned. 







#Dependencies for users 
	These files must be added to the PYTHONPATH in order for the program to run.

	PyXlight 
		(Flowlab Modified version) (Package) (Xfoil wrapper)
	Pyxlight is a wrapper for xfoil, and the whole package must be added to your PYTHONPATH in order to call xfoil using python. In order to use pyXLIGHT, you will need to build it.To build it, simply run `python setup.py'in the pyxlight directory. Note that this version of pyXLIGHT is very slightly modified from the original found at: https://bitbucket.org/mdolab/pyxlight/src

	pyfoil.py 
	naca.py
		
	These files contain a series of functions that use pyxlight to access xfoil in a simple manner. They must also be on your PYTHONPATH. They can be found in the src directory. 
	
	AirfoilParams
		(From Flowlab) (Package) (Xfoil wrapper)

	AirfoilParams is a xfoil wrapper for julia. This whole package must be in your julia path (I found mine within the julia data either in the appdata, or usr data, I can't remember which.) It has a series of functions that work together to access xfoil. Likelyhood is if you have access to this file, you have access on Git to AirfoilParams. 

#Purpose of Project
	The purpose of this project was to create a test harness that can compare the results that python and Julia would return from Xfoil. This was accomplished by creating a single set of data that would be swept through the Julia and Python wrappers seperately (both with a swept angle of attack, and individual points). Data was compared by total error, error at data points that flagged as converged, and for normal NACA Parameters. 

#Outcome of Project

#Improvements


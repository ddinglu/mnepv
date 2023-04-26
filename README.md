# mNEPv - Monotone Nonliear Eigenvector Problems

Dated 		03-01-2023

This folder contains testing codes and data for the monotone eigenvector
dependent nonlinear eigenvalue problems (mNEPv), as used in the paper:

> *Variational Characterization of Monotone Nonlinear Eigenvector Problems
and Geometry of Self-consistent Field Iteration*
by Zhaojun Bai and Ding Lu, 2022.
(Manuscript available at: https://doi.org/10.48550/arXiv.2211.05179 )


this is math
$$ f(x)=y $$


## Contents

- mNEPv solver
	- scf.m:			SCF iteration with and without local acceleration

- Examples 
	- numrd2d.m:  		mNEPv from numerical radius computation  
	- dhdae1.m: 		mNEPv from distance problems of linear dHDAE systems
	- dhdae2.m:			mNEPv from distance problems of quadratic dHDAE systems
	- tensorappr.m:  	mNEPv from Tensor rank-1 approximation

- Other files: numrange.m (plot numerical range), goescf (geometry of SCF), and data files.


## External

The MATLAB toolbox Manopt is used in dhdae2 for comparison. The
comparison is deactivated by default. To use it please first download
and install the Manopt available at https://www.manopt.org/


## Contact 	

For questions, please contact Ding.Lu@uky.edu 


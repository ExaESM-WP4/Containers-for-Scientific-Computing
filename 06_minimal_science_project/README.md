# Minimal science project

Consider a scientific project that consists of two steps: A _"simulation"_ which produces data, and a _"data analysis"_.

## Simulation — Running a compiled software which produces some data

This could, e.g., be a physical or biological simulation. Here, we'll use a [small program written in Fortran](create_data.F90) which produces a data sets with a sinus-shaped signal and some added noise.

The data look like this:
```
   15.0000000       0.644502997    
   30.0000000       1.54576778    
   45.0000000       2.07850647    
   ...             ...
   330.000000      -1.68714190    
   345.000000      -0.620180488    
   360.000000       9.53099951E-02
```

## Data analysis

This could be a script or a set of scripts which produce figures for a publication or reduced data like mean and standard deviations of the input data. Here, we'll use [`gnuplot`](https://en.wikipedia.org/wiki/Gnuplot) to run [a script](plot_data.gp) which plots the sinus-shaped data produced in step A.

The resulting plot looks like this:
```
                                                                            
  4 +----------------------------------------------------------------------+   
    |        +        +        +        +       +        +        +        |   
  3 |-+          A  A                                   "data.dat"    A  +-|   
    |                  A                                                   |   
    |       A  A         A                                                 |   
  2 |-+                     A                                            +-|   
    |                          A                                           |   
  1 |-+  A                                                               +-|   
    |  A                         A                                         |   
    |                                                                      |   
  0 |-+                             A                               A    +-|   
    |                                                            A         |   
 -1 |-+                                A                                 +-|   
    |                                                          A           |   
    |                                    A                                 |   
 -2 |-+                                     A                            +-|   
    |                                                       A              |   
 -3 |-+                                        A       A A               +-|   
    |                                            A  A                      |   
    |        +        +        +        +       +        +        +        |   
 -4 +----------------------------------------------------------------------+   
    0        50      100      150      200     250      300      350      400  

```

## Hands-on details

- Use the latest stable [Ubuntu Linux container image](https://hub.docker.com/_/ubuntu): `ubtuntu:21.04`

- Make sure you have the Fortran compiler gfrotran (package name is `gfortran`) and Gnuplot (package name `gnuplot-nox`) installed. Installation can be done by running `apt update` and `apt install -y <package1> <package2>` in the container.

- Compile the software using: `gfortran create_data.F90 -o create_data` Then run the software with: `./create data` To redirect the output into a data file called `data.dat`, use: `./create_data > data.dat`.

- Plot the data with: `gnuplot plot_data.gp`
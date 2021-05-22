# Minimal scientific workflow

We'll use [gnuplot](https://en.wikipedia.org/wiki/Gnuplot) to analyse (mainly plot) a simple data file.

## Build

```shell
$ docker build . -t minimal-science-workflow:latest
```

## Run

```shell
docker run -v ${PWD}:/work minimal-science-workflow:latest
```

## Data and output

Data:
```shell
$ head -n 5 data/data.csv 
```
```
0,9
1,172
2,194
3,348
4,418
```

Output:
```shell
$ docker run -v $PWD:/work minimal-science-workflow:latest
```
```
                                                                               
  1500 +-------------------------------------------------------------------+   
       |      +      +     +      +      +      +      +     +      +      |   
       |                                     "/work/data/data.csv"    A    |   
  1000 |-+           A A AAA                                             +-|   
       |          AA  A      AAA                                           |   
       |       A A                                                         |   
       |      A                  AA                                        |   
   500 |-+  A                       A                                    +-|   
       |   A                         A                                     |   
       |A A                           A A                                  |   
     0 |-+                                                               +-|   
       |                                 AA                               A|   
       |                                    A                         AAA  |   
  -500 |-+                                   A  A                        +-|   
       |                                      A  A                 AA      |   
       |                                           A            A          |   
       |                                            AA A     A A A         |   
 -1000 |-+                                              AA AA            +-|   
       |                                                                   |   
       |      +      +     +      +      +      +      +     +      +      |   
 -1500 +-------------------------------------------------------------------+   
       0      5      10    15     20     25     30     35    40     45     50  

```

## Exercises

1. Explain how gnuplot could read the data. (Hint: Play with the `-v` argument to `docker run`.)

2. Here you can feed arbitrary data into `gnuplot`. What if you'd also like to change the script that does the plot?
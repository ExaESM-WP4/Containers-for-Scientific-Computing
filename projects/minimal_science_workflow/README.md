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
79,39
29,49
95,65
49,33
2,25
```

Output:
```shell
$ docker run -v $PWD:/work minimal-science-workflow:latest
```
```
                                                                               
  100 +--------------------------------------------------------------------+   
      |A  A  +      +      +A   A +      +     +      +      +      +      |   
   90 |-+         A     A                             A AA          A    +-|   
      |             A        A                     A             A A AA    |   
   80 |-+                 A                          A                   +-|   
      |     AA A       A      A  A        A                       A        |   
   70 |-+           A             A     A    A                           +-|   
      |         A                        A                         A    A  |   
   60 |-+                A                 A   A       A      A          +-|   
      |          A             A                 A              A        AA|   
   50 |-A                              A                    A            +-|   
      |       A                 A               A   A A                   A|   
   40 |-+              A   A                        A                    +-|   
      |                      A        A        A                           |   
   30 |A+A        A                A         A    A            A         +-|   
      |     A   A  A              A A                                      |   
   20 |-+                            A                     A A           +-|   
      |                  A          A A                      A             |   
   10 |-+     A      A     A             A    A  A        A      A      A+-|   
      |    A +      +      +      +      +     +      +   A  + A    +      |   
    0 +--------------------------------------------------------------------+   
      0      10     20     30     40     50    60     70     80     90    100  

```

## Exercises

1. Explain how gnuplot could read the data. (Hint: Play with the `-v` argument to `docker run`.)

2. ...
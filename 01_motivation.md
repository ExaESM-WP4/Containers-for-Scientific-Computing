# Motivation behind using containers

Containers may help with **reproducibility** of your scientific work,

> **Scholarly research has evolved significantly over the past decade, but the same cannot be said for the methods by which research processes are captured and disseminated.** The primary method for dissemination - the scholarly publication - is largely unchanged since the advent of the scientific journal in the 1660s. This is no longer sufficient to verify, reproduce, and extend scientific results. Despite the increasing recognition of the need to share all aspects of the research process, scholarly publications today are often disconnected from the underlying analysis and, crucially, the computational environment that produced the findings. **For research to be reproducible, researchers must publish and distribute the entire contained analysis, not just its results.** The analysis should be mobile. **Mobility of Compute is defined as the ability to define, create, and maintain a workflow locally while remaining confident that the workflow can be executed elsewhere.** In essence, mobility of compute means being able to contain the entire software stack, from data files up through the library stack, and reliably move it from system to system. Any research that is limited to where it can be deployed is instantly limited in the extent that it can be reproduced. (from [The Turing Way](https://the-turing-way.netlify.app/reproducible-research/renv.html#science))

And containers may help increasing your personal (and your research group's) **scientific productivity**,

* especially by simplifying workflow aspects around "the lifecycle of a scientific idea" (after Perez 2017, [the architecture of Jupyter](https://www.youtube.com/watch?v=dENc0gwzySc))
  * individual exploratory work
  * collaborative developments
  * production runs (HPC, workstation, cloud, ...)
  * publication (reproducibly!)
* specifically, by reducing your individual "time-to-scientific-insight"
  * daily perspective, e.g. [Jupyter start-up times](https://nbviewer.jupyter.org/github/ExaESM-WP4/Jupyter-HPC-performance/blob/fa725c1f3656f81c78254946f97a9c1764908e53/analysis.ipynb) on distributed storage machines
  * project perspective, e.g. becoming independent of particular machines and their software
  * ...

## Demo

Suppose you want to do a data analysis on a machine, where you do not already have a suitable software environment installed.
With containerized environments, it's extremely simple to (1) get started on your local machine, as well as to (2) scale a task out to another, e.g. bigger machine, or to (3) share an environment with your colleague who wants to build upon an analysis you have already started.

We cover sharing of containerized software environments later in more detail.
For a start, here we demonstrate the "installation" (or deployment) of a fully identical IPython software environment on a Linux, MacOS and Windows machine.
IPython is provided with, e.g., the [Jupyter Docker stacks](https://jupyter-docker-stacks.readthedocs.io/en/latest/index.html), which are provided via [Dockerhub](https://hub.docker.com/r/jupyter/base-notebook), a very popular container sharing platform.
Only two commands are necessary to pull and start-up the software environment.

Your Linux desktop with Docker,

```
$ uname -a
Linux morpheus 5.8.0-50-generic #56~20.04.1-Ubuntu SMP Mon Apr 12 21:46:35 UTC 2021 x86_64 x86_64 x86_64 GNU/Linux
$ docker pull jupyter/base-notebook
$ docker run -it jupyter/base-notebook ipython
Python 3.9.2 | packaged by conda-forge | (default, Feb 21 2021, 05:02:46) 
Type 'copyright', 'credits' or 'license' for more information
IPython 7.24.1 -- An enhanced Interactive Python. Type '?' for help.

In [1]: 
```

Your MacOS desktop with Docker,

```
$ uname -a
Darwin od-nb008mc 18.7.0 Darwin Kernel Version 18.7.0: Mon Mar  8 22:11:48 PST 2021; root:xnu-4903.278.65~1/RELEASE_X86_64 x86_64
$ docker pull jupyter/base-notebook
$ docker run -it jupyter/base-notebook ipython
Python 3.9.2 | packaged by conda-forge | (default, Feb 21 2021, 05:02:46) 
Type 'copyright', 'credits' or 'license' for more information
IPython 7.24.1 -- An enhanced Interactive Python. Type '?' for help.

In [1]: 
```

Your Windows desktop with Docker,

```
Windows PowerShell
Copyright (C) Microsoft Corporation. All rights reserved.
PS V:\> docker pull jupyter/base-notebook
PS V:\> docker run -it jupyter/base-notebook ipython
Python 3.9.2 | packaged by conda-forge | (default, Feb 21 2021, 05:02:46) 
Type 'copyright', 'credits' or 'license' for more information
IPython 7.24.1 -- An enhanced Interactive Python. Type '?' for help.

In [1]: 
```

# Goal of this workshop

Accelerate your "scientific productivity" (and increase your scientific work's reproducibility) by covering the basics of container technology, as well as a few considerations around scientific workflows from a container perspective.

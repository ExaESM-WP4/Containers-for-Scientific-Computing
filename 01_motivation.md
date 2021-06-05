# Motivation for using containers

Reproducibility of your scientific work,

> **Scholarly research has evolved significantly over the past decade, but the same cannot be said for the methods by which research processes are captured and disseminated.** The primary method for dissemination - the scholarly publication - is largely unchanged since the advent of the scientific journal in the 1660s. This is no longer sufficient to verify, reproduce, and extend scientific results. Despite the increasing recognition of the need to share all aspects of the research process, scholarly publications today are often disconnected from the underlying analysis and, crucially, the computational environment that produced the findings. **For research to be reproducible, researchers must publish and distribute the entire contained analysis, not just its results.** The analysis should be mobile. **Mobility of Compute is defined as the ability to define, create, and maintain a workflow locally while remaining confident that the workflow can be executed elsewhere.** In essence, mobility of compute means being able to contain the entire software stack, from data files up through the library stack, and reliably move it from system to system. Any research that is limited to where it can be deployed is instantly limited in the extent that it can be reproduced. (from [The Turing Way](https://the-turing-way.netlify.app/reproducible-research/renv.html#science))

Your personal and/or your research group's scientific productivity,

* ...

## Demo

Suppose you want to do a quick data analysis task on a machine, where you do not already have a suitable software environment installed.
With containerized environments, it's both (1) extremely simple to get started on your local machine, as well as (2) to later scale a task out to another, e.g. bigger machine.
Here, we use an IPython software environment as an example, which is provided with the [Jupyter Docker stacks](https://jupyter-docker-stacks.readthedocs.io/en/latest/index.html) via [Dockerhub](https://hub.docker.com/r/jupyter/base-notebook).
As you can see, there are only about two lines of shell commands necessary to (1) install and (2) start-up a scientific computing environment on a Linux, MacOS or Windows machine (with Docker already installed), as well as on a multi-user system with Singularity installed (more on Singularity later).

Linux desktop,

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

MacOS desktop,

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

Windows desktop,

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

Shared workstation,

```
```

High-performance computing system,

```
```

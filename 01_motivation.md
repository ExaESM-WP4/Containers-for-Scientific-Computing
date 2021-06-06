# Motivation behind using containers

Reproducibility of your scientific work,

> **Scholarly research has evolved significantly over the past decade, but the same cannot be said for the methods by which research processes are captured and disseminated.** The primary method for dissemination - the scholarly publication - is largely unchanged since the advent of the scientific journal in the 1660s. This is no longer sufficient to verify, reproduce, and extend scientific results. Despite the increasing recognition of the need to share all aspects of the research process, scholarly publications today are often disconnected from the underlying analysis and, crucially, the computational environment that produced the findings. **For research to be reproducible, researchers must publish and distribute the entire contained analysis, not just its results.** The analysis should be mobile. **Mobility of Compute is defined as the ability to define, create, and maintain a workflow locally while remaining confident that the workflow can be executed elsewhere.** In essence, mobility of compute means being able to contain the entire software stack, from data files up through the library stack, and reliably move it from system to system. Any research that is limited to where it can be deployed is instantly limited in the extent that it can be reproduced. (from [The Turing Way](https://the-turing-way.netlify.app/reproducible-research/renv.html#science))

Your personal (and your research group's) scientific productivity,
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
With containerized environments, it's extremely simple to (1) get started on your local machine, as well as to (2) scale a task out to another, e.g. bigger machine, or to share an environment to (3) have your colleague build upon an analysis you have already done.

We cover sharing of a containerized environment later in more detail.
Here, we start with "installing" a fully identical IPython software environment, as provided with the [Jupyter Docker stacks](https://jupyter-docker-stacks.readthedocs.io/en/latest/index.html) via [Dockerhub](https://hub.docker.com/r/jupyter/base-notebook) as an example.
Only two shell commands are necessary for this on a Linux, MacOS or Windows machine, as well as e.g. on a shared workstation.

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

Your group's shared workstation with Singularity,

```
$ uname -a
Linux scalc07 5.7.8-1.el8.elrepo.x86_64 #1 SMP Tue Jul 7 18:26:28 EDT 2020 x86_64 x86_64 x86_64 GNU/Linux
$ singularity pull docker://jupyter/base-notebook
INFO:    Converting OCI blobs to SIF format
INFO:    Starting build...
Getting image source signatures
Copying blob sha256:345e3491a907bb7c6f1bdddcf4a94284b8b6ddd77eb7d93f09432b17b20f2bbe
Copying blob sha256:57671312ef6fdbecf340e5fed0fb0863350cd806c92b1fdd7978adbd02afc5c3
Copying blob sha256:5e9250ddb7d0fa6d13302c7c3e6a0aa40390e42424caed1e5289077ee4054709
Copying blob sha256:89b549ea476ebff33b73e3c3cc0e7427472b54317c5ee1332b7564a9625ff47d
Copying blob sha256:3dead672c27041bcb14eaa6989f9f915d1aae9a12f07e395b6c8c077693f69d9
Copying blob sha256:4f4fb700ef54461cfa02571ae0db9a0dc1e0cdb5577484a6d75e68dc38e8acc1
Copying blob sha256:2b4b1b6f1b0707dda0d2354caa154008388f41a2f071246a1a2f9b24907b889e
Copying blob sha256:9a5ae6b126eb7937add78c50283c83159145545caaacbb634ee51c42d30d542d
Copying blob sha256:c2cb066023c22cdd88da41ae9c35f5c4f20652fdeaadca78578d05b894d79619
Copying blob sha256:4f4fb700ef54461cfa02571ae0db9a0dc1e0cdb5577484a6d75e68dc38e8acc1
Copying blob sha256:4185dc4182861a4109d5a40350c882ff504b0936a0174e7ededfcdbfc3c790bb
Copying blob sha256:37a1489aad3ceb1b63a34a8056c57d0f4e74d0fb8e74162cf0ff5da05b0c7d77
Copying blob sha256:6b46519c17cff1e7eeb6552251b16b784db1d21fa9549c2feb0b05997ac2a272
Copying blob sha256:fd47bddbb14bceca6a53c5891ffe6a6e62dccc9fc5e789236adb0c3920edc858
Copying blob sha256:858f74c5f496e3836098f330b146fd969e28c4475159bb7752a43f1d046c6803
Copying blob sha256:4f4fb700ef54461cfa02571ae0db9a0dc1e0cdb5577484a6d75e68dc38e8acc1
Copying config sha256:0acfacdf87fc37aba91073724415af1fe9d81c86a66bd99ef6355f7505567ae0
Writing manifest to image destination
Storing signatures
2021/06/06 14:22:55  info unpack layer: sha256:345e3491a907bb7c6f1bdddcf4a94284b8b6ddd77eb7d93f09432b17b20f2bbe
2021/06/06 14:22:56  info unpack layer: sha256:57671312ef6fdbecf340e5fed0fb0863350cd806c92b1fdd7978adbd02afc5c3
2021/06/06 14:22:56  info unpack layer: sha256:5e9250ddb7d0fa6d13302c7c3e6a0aa40390e42424caed1e5289077ee4054709
2021/06/06 14:22:56  info unpack layer: sha256:89b549ea476ebff33b73e3c3cc0e7427472b54317c5ee1332b7564a9625ff47d
2021/06/06 14:22:56  info unpack layer: sha256:3dead672c27041bcb14eaa6989f9f915d1aae9a12f07e395b6c8c077693f69d9
2021/06/06 14:22:56  info unpack layer: sha256:4f4fb700ef54461cfa02571ae0db9a0dc1e0cdb5577484a6d75e68dc38e8acc1
2021/06/06 14:22:56  info unpack layer: sha256:2b4b1b6f1b0707dda0d2354caa154008388f41a2f071246a1a2f9b24907b889e
2021/06/06 14:22:56  info unpack layer: sha256:9a5ae6b126eb7937add78c50283c83159145545caaacbb634ee51c42d30d542d
2021/06/06 14:22:56  info unpack layer: sha256:c2cb066023c22cdd88da41ae9c35f5c4f20652fdeaadca78578d05b894d79619
2021/06/06 14:22:56  info unpack layer: sha256:4f4fb700ef54461cfa02571ae0db9a0dc1e0cdb5577484a6d75e68dc38e8acc1
2021/06/06 14:22:56  info unpack layer: sha256:4185dc4182861a4109d5a40350c882ff504b0936a0174e7ededfcdbfc3c790bb
2021/06/06 14:22:59  info unpack layer: sha256:37a1489aad3ceb1b63a34a8056c57d0f4e74d0fb8e74162cf0ff5da05b0c7d77
2021/06/06 14:23:03  info unpack layer: sha256:6b46519c17cff1e7eeb6552251b16b784db1d21fa9549c2feb0b05997ac2a272
2021/06/06 14:23:03  info unpack layer: sha256:fd47bddbb14bceca6a53c5891ffe6a6e62dccc9fc5e789236adb0c3920edc858
2021/06/06 14:23:03  info unpack layer: sha256:858f74c5f496e3836098f330b146fd969e28c4475159bb7752a43f1d046c6803
2021/06/06 14:23:03  info unpack layer: sha256:4f4fb700ef54461cfa02571ae0db9a0dc1e0cdb5577484a6d75e68dc38e8acc1
INFO:    Creating SIF file...
$ singularity run base-notebook_latest.sif ipython
Python 3.9.2 | packaged by conda-forge | (default, Feb 21 2021, 05:02:46) 
Type 'copyright', 'credits' or 'license' for more information
IPython 7.24.1 -- An enhanced Interactive Python. Type '?' for help.

In [1]: 
```

# Goal of this workshop

Accelerate your "scientific productivity" (and scientific work's reproducibility) with container technology!

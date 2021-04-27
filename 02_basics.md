# Container basics

Think about reproducible scientific (or robustly deployed) software based on a Python script example.

## What is a "container"?

For the following, need to know about two Linux concepts...

* file system
* kernel

### OS defaults

* the user "owns" only the Python script and user-specific packages... neither the Python interpreter, nor system libraries or the kernel.

### Conda package manager

* the user "owns" the Python script, the Python interpreter and user-specific packages, but not system libraries and the kernel.

### Container

* the user "owns" everything, except the kernel.

## Container terminology

* base image, layers, Dockerfile, ...

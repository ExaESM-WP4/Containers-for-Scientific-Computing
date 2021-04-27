# Container basics

Thinking about reproducible scientific (or robustly deployed) software based on a Python script example.

## What is a "container"?

For the following, need to know about two Linux concepts...

* file system
* kernel

### OS defaults

* the Python script "owns" only user-specific packages... neither the Python interpreter, nor system libraries or the kernel.

### Package manager

* the Python script "owns" the Python interpreter and user-specific packages, but not system libraries and the kernel.

### Container

* the Python script "owns" the Python interpreter, user-specific packages and system libraries, but not the kernel.

### Virtual machine

* the Python script "owns" everything mentioned above, except... the hardware.

## Container terminology

* base image, layers, Dockerfile, ...

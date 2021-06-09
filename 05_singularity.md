# Singularity

Singularity is a container platform that provides,

* mobility of compute via a single-file SIF container image format 
  * very natural to migrate, execute, share and archive!
* a permission model that is suitable for shared machines (such as HPC, group's workstation, ...)
  * users execute containers as themselves and don't need and/or can't get root privileges on the host per default
* optimization for "integration" with the host system, rather than "isolation" from the host system
  * it's very easy to use the host's network and file system (plus available GPUs! which is also possible with Docker, though)

## Docker/Singularity CLI

During the hands-on part you have already used Docker commands to pull, specify, build, run and archive a container (image).
Basically, each of these have an equivalent command in Singularity on the machines you might be using.

Pull container images from a remote registry,

```
$ docker pull ubuntu:21.04
$ singularity pull docker://ubuntu:21.04
```

Build a container image after specification (on a machine you own),

```
$ docker build -t local/my-container-image -f Dockerfile .
$ singularity build --fakeroot my-container-image.sif my-container-image.txt
```

(For [details on Singularity definition files](https://sylabs.io/guides/3.7/user-guide/definition_files.html) see their official docs.)

Run a containerized software,

```
$ docker run -it --rm local/my-container-image
$ singularity run my-container-image.sif
```

Archive a container image,

```
$ docker save ...
```

(With Singularity's container image format the archiving aspect is solved naturally.)

## Singularity build: Stumbling blocks

* installing Singularity requires a Linux machine and involves compiling the Singularity code base
* debugging, building and executing Singularity containers is only natively possible on Linux architecture
* building Singularity containers requires root privileges and is therefore not possible on shared machines

```
$ singularity build my-container-image.sif my-container-image.txt
FATAL:   You must be the root user, however you can use --remote or --fakeroot to build from a Singularity recipe file
$ singularity build --fakeroot my-container-image.sif my-container-image.txt
FATAL:   could not use fakeroot: no mapping entry found in /etc/subuid for username
$ singularity build --remote my-container-image.sif my-container-image.txt
FATAL:   Unable to submit build job: no authentication token, log in with `singularity remote login`
```

You could get yourself access to the [Syslabs.io remote builder](https://cloud.sylabs.io/).
(This seems very nice, however, building remotely might be rather tedious also the storage of this service is currently limited to about 11GB quota. More severe might be the aspect of adding further local files to the container during build?)

As Singularity comes with a lot of ways to convert Docker images to the Singularity container image format one can fully go around the "Singularity build" problem, however, by utilizing Docker only (and it's community knowledge and the portability problems they have already solved.)

## Docker container build workflow for Singularity containers

The "advisable" scientific container lifecycle: `docker build` to `singularity run`?
(This is open for discussion, definitly.)

### Specify

Let's specify a container image that contains a Bash (!) script to print a "hello world" message.
In the Ubuntu base image... but let's use Alpine.

```
$ cat Dockerfile
FROM alpine:latest
RUN ...
RUN ...
```

### Build

```
$ docker build -t local/hello-from-osx-build-system .
```

### Deploy

There are two options to ...

```
$ docker images
[...]
```

Remote,

* export as Docker tar archive
* transfer the tar archive to a machine with Singularity
* do a Singularity build on that machine

```
# local machine
$ docker ...
$ ls -h ...
$ scp ...
# target machine
$ module load singularity/...
$ singularity build
```

Local,

* pull a dockerized Singularity
* do the Singularity build directly on your local Docker machine
* transfer the Singularity image file

```
# local machine
$ docker pull ...
$ docker run ...
$ ls -h
$ scp ...
```

This has the advantage of transfering a much smaller file!

### Run

```
# target machine
$ module load singularity/...
$ singularity run
```

## Considerations: Singularity containers via Docker

Building Singularity container images with Docker is possible, and only comes with very few considerations.

what to keep in mind for specifying Docker containers to be used with Singularity
there is also official docs on this!

stumbling blocks,
* many ready-to-use container images are only build with Docker, but not with Singularity in mind, e.g. Jupyter Docker stacks

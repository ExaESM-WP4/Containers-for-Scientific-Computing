# Singularity

Singularity is a container platform that provides,

* mobility of compute via a single-file container image format that is very natural to migrate, execute, share and archive
* a security model suitable for shared machines, i.e. users execute containers as themselves and don't need and can't get root privileges
* per default optimization for "integration" rather than "isolation" of the containerized software, i.e. it's very easy to use the host network and file system

## Docker/Singularity CLI

During the hands-on part you have already used Docker commands to pull, specify, build, run and archive a container (image).
Basically, each of these have an equivalent command in Singularity on the machines you might be using.

Pull some container image from a remote registry,

```
$ docker pull ubuntu:21.04
$ singularity pull docker://ubuntu:21.04
```

Build a container image (after specification),

```
$ docker build -t my-container-image -f Dockerfile .
$ singularity build --fakeroot my-container-image.sif my-container-image-specs.txt
```

(For [details on Singularity definition files](https://sylabs.io/guides/3.7/user-guide/definition_files.html) see their official docs.)

Run a containerized software,

```
$ docker run -it --rm ... my-container-image
$ singularity run ... my-container-image.sif
```

Archive a container image,

```
$ docker save ...
```

With Singularity's single-file container image format the archiving aspect is solved naturally.

### Caveats

why use docker for building singularity images?

## Advisable workflow

The scientific (!) container lifecycle: `docker build` to `singularity run`.

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
Also, you do not have to rely on the build functionality of the target system, which may not have the everything "activated".

### Run

```
# target machine
$ module load singularity/...
$ singularity run
```

## Considerations: Singularity via Docker

what to keep in mind for specifying Docker containers to be used with Singularity
there is also official docs on this!

stumbling blocks,
* many ready-to-use container images are only build with Docker, but not with Singularity in mind, e.g. Jupyter Docker stacks

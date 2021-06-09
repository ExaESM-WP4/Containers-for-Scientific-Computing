# Singularity



## Workflow: Docker build to Singularity run

The scientific container lifecycle: From `docker build` to `singularity run`.
(We don't cover the debugging, archival and/or reproduction steps here explicitly.)

### Specification

Let's specify a container image that contains a Bash script to print a "hello world" message.
In the Ubuntu base image...

```
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

#### Remote

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

#### Local

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
Also, you do not have to rely on the build functionality of the target system, which may not have the full functionality activated.

### Run

```
# target machine
$ module load singularity/...
$ singularity run
```

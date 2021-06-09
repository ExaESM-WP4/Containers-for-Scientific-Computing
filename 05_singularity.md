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
$ docker save local/my-container-image --output my-container-image.tar
```

(With Singularity's container image format the archiving aspect is solved naturally.)

## Singularity build: Stumbling blocks

_Note that there is a lot of development on singularity going on. Expect that the following statements will be outdated very soon and that working with Singularity on MacOS and Windows machines will be just as easy as with Docker Desktop._

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
(This is open for discussion, definitely.)

### Specify

Let's specify a container image that contains a Bash (!) script to print a "hello world" message.
In the Ubuntu base image Bash is already installed, but let's use Alpine here, so that we need to install something.

```
$ cat Dockerfile
FROM alpine:latest
RUN apk add bash
RUN echo '#!/bin/bash' > /hello.sh \
 && echo 'echo "Hello from a container built on MacOS!"' >> /hello.sh \
 && chmod +x /hello.sh
```

### Build

```
$ docker build -t local/hello-from-macos .
```

Have a look at your local registry,

```
$ docker images                                                         
REPOSITORY                   TAG       IMAGE ID       CREATED         SIZE
local/hello-from-macos       latest    2ec03757f43b   5 seconds ago   9.74MB
```

Make a test run,

```
$ docker run --rm local/hello-from-macos /hello.sh
Hello from a container built on MacOS!
```

### Deploy... and run!

You don't actually need to have Singularity installed on your system to build Singularity containers.
Having Docker installed you can:

* pull a dockerized Singularity (thanks community!)
* do the Singularity build directly from your local Docker registry
* transfer the Singularity image file to the target system

```
# local machine
$ docker pull kathoef/docker2singularity:latest
$ docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v ${PWD}:/output \
kathoef/docker2singularity singularity build hello-from-macos.sif docker-daemon://local/hello-from-macos:latest
$ ls -lh
-rwxr-xr-x  1 khoeflich  GEOMAR   5.3M Jun  9 14:08 hello-from-macos.sif
$ scp hello-from-macos.sif ...
```

```
# target machine
$ module load singularity/...
$ singularity run hello-from-macos.sif /hello.sh
Hello from a container built on MacOS!
```

Note, that you could also

* export your container image as a Docker tar archive
* transfer the tar archive to a machine with Singularity
* do a Singularity build from the tar archive on the target machine

```
# local machine
$ docker save local/hello-from-macos --output hello-from-macos.tar
$ scp hello-from-macos.tar ...
```

```
# target machine
$ singularity build hello-from-macos.sif docker-archive://hello-from-macos.tar
INFO:    Starting build...
Getting image source signatures
Copying blob b2d5eeeaba3a done
Copying blob c33f491601cb done
Copying blob 4b7cacb5f751 done
Copying config b7469f518f done
Writing manifest to image destination
Storing signatures
2021/06/09 22:18:32  info unpack layer: sha256:d12dd637fd61a233bdb43ff256513c0704ceb2d4d1d8e40d75c8b4a0128dc976
2021/06/09 22:18:32  info unpack layer: sha256:d1b09556f2eedc3a9044cd5788a9efdf602382391249dc576e5e30db3cac5d7e
2021/06/09 22:18:32  info unpack layer: sha256:b4d2b1ee81c66d77659d89d01ca64bcba9345e1d82bfd4f52b74db8f7e6c4a93
INFO:    Creating SIF file...
INFO:    Build complete: hello-from-macos.sif
```

Doing the Singularity build on your local machine has the advantage of transfering a much smaller file!
(Because the Docker layer structure is collapsed during conversion and SIF files are compressed.)

```
$ ls -lh
-rwxr-xr-x  1 khoeflich  GEOMAR   5.3M Jun  9 14:08 hello-from-macos.sif
-rw-------  1 khoeflich  GEOMAR   9.6M Jun  9 14:17 hello-from-macos.tar
```

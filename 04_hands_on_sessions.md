# Basic Hands-on Example

Throughout this part, we'll link the [docker reference docs](https://docs.docker.com/reference/) of which the [docs for the command line interface (CLI)](https://docs.docker.com/engine/reference/commandline/cli/) and the [docs for Dockerfiles](https://docs.docker.com/engine/reference/builder/) are the most important.

## A: Modification of an existing container

### Task

Use an existing base image ([`ubuntu:21.04`](https://hub.docker.com/_/ubuntu)), start a container with an interactive shell, and install a software necessary to download an image from the internet (`curl`) and a software necessary to convert the image to a different format (`imagemagick`).

### Hints

Running containers with an interactive shell (here using `bash`) can be done with: [`docker run --rm -it <image-name> bash`](https://docs.docker.com/engine/reference/commandline/run/)

Installation can be done with `apt update` followed by `apt install -y <package> <package> ...`.

Let's use this graphics file: <https://upload.wikimedia.org/wikipedia/commons/d/df/Container_01_KMJ.jpg>

To download the image, run 
```shell
curl https://upload.wikimedia.org/wikipedia/commons/d/df/Container_01_KMJ.jpg -o container.jpg
```

To convert the graphics file to, e.g., PNG, run:
```shell
convert container.jpg container.png
```
(The `convert` command is part of the `imagemagick` suite.)

To check if the file format really changed, compare the output of `identify container.jpg` with that of `identify container.png`.
(The `identify` command is part of the `imagemagick` suite.)

### Discussion

- How to get the graphics file out of the container? — We'll skip this for now and come back to this question later.
- ...

## B: Specification and Building

### Task

Write a [`Dockerfile`](https://docs.docker.com/engine/reference/builder/) which specifies the full environment (e.g. the base image and all packages we need), and [build the container image](https://docs.docker.com/engine/reference/commandline/build/).

Then, for testing if the container is able to do what it's meant for, start a shell in the container (see above) and download and convert the graphics file again.

### Hints

In the `Dockerfile`, you can [specify the base image using](https://docs.docker.com/engine/reference/builder/#from)
```Dockerfile
FROM <base-image>
```
and you can specify [commands that are running at _build time_](https://docs.docker.com/engine/reference/builder/#run) using
```Dockerfile
RUN <command>
```

### Discussion

- Note that this will store the image in a local _registry_. We'll talk about this later.

## C: Binding host-system storage

### Task

Make available the file-system of your computer within the container.

This will show how to get data in and out of the container. We've already seen that from within the container, we can access the network / the internet. For many _industry_ applications using the network for interacting with the environment is all that is needed. For a scientific data-analysis context, file-system acces is, however, essential.

### Hints

Adding the following flags [`--volume $PWD:/work --workdir /work`](https://docs.docker.com/engine/reference/commandline/run/#mount-volume--v---read-only) to the [`docker run`](https://docs.docker.com/engine/reference/commandline/run/) call will create a directory `/work/` within the container showing the contents of the current directory (`$PWD`) and makes sure the working directory within the container is `/work`.

### Discussion

There is no strong conventions about how to name volumes / directories bound into containers. It's wise to avoid any name used in the [(Linux) Filesystem Hierarchy Standard](https://en.wikipedia.org/wiki/Filesystem_Hierarchy_Standard), however.

## D.1: Deploy (via registry)

### Task

Use the image built in part C above. Tag the image. Push the image to a registry. Pull the image from a registry. Run the image.

_(Note that for pushing, you'd need an account at a registry. So the pushing part will be done by one of the presenters. But you should be able to follow along pulling and running the image.)_

### Hints

Tagging images can be done with [`docker tag ...`](https://docs.docker.com/engine/reference/commandline/tag/).

Pushing to a registry is as easy as running [`docker push`](https://docs.docker.com/engine/reference/commandline/push/).

You can [`docker pull <image-name>`](https://docs.docker.com/engine/reference/commandline/pull/) an image and then run it as if you tagged it locally with [`docker run ... <image-name>`](https://docs.docker.com/engine/reference/commandline/run/)

## D.2: Deploy (via files)

### Task

Export the container image to a file and import it again (possibly on a separate machine).

### Hints

You can use [`docker save <image-name> --output <archive_name>`](https://docs.docker.com/engine/reference/commandline/save/) to save a container image to a tar archive. You can use [`docker load --input <archive_name>`](https://docs.docker.com/engine/reference/commandline/load/) to load the image again.

### Discussion

- While container registries are best used for keeping and providing container images during active use, file-based deployments can be used for archiving or for sharing containers with machines that do not have access to a registry.

- There also is a way of directly importing file-based docker images into Singularity.

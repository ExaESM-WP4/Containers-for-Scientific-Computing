# Basic Hands-on Example

## A: Modification of an existing container

### Task

Use an existing base image (`ubuntu:21.04`), start a container with an interactive shell, and install a software necessary to download an image from the internet (`curl`) and a software necessary to convert the image to a different format (`imagemagick`).

### Hints

Running containers with an interactive shell (here using `bash`) can be done with: `docker run --rm -it <image-name> bash`

Installation can be done with `apt update` followed by `apt intall -y <package> <package> ...`.

Let's use this graphics file: <https://upload.wikimedia.org/wikipedia/commons/d/df/Container_01_KMJ.jpg>

To download the image, run 
```shell
curl https://upload.wikimedia.org/wikipedia/commons/d/df/Container_01_KMJ.jpg -o container.jpg
```

To convert the image to, e.g., PNG, run:
```shell
convert container.jpg container.png
```
(The `convert` command is part of the `imagemagick` suite.)

To check if the file format really changed, compare the output of `identify container.jpg` with that of `identify container.png`.
(The `identify` command is part of the `imagemagick` suite.)

### Discussion

- How to get the image out of the container? — We'll skip this for now and come back to this question later.
- How to automate this? — See next hands-on.

## B: Specification and Building

### Task

Write a `Dockerfile` which specifies the full environment (e.g. the base image and all packages we need), and build the container image.

Then, for testing if the container is able to do what it's mean for, start a shell in the container and download and convert the image again.

### Hints

In the `Dockerfile`, you can specify the base image using 
```Dockerfile
FROM <base-image>
```
and you can specify commands that are running at _build time_ using
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

Adding the following flags `--volume $PWD:/work --workdir /work` to the `docker run` call will create a directory `/work/` within the container showing the contents of the current directory (`$PWD`) and makes sure the working directory within the container is in `/work`.

### Discussion

There is no strong conventions about how to name volumes / directories bound into containers. It's wise to avoid any name used in the ((Linux) Filesystem Hierarchy Standard)[https://en.wikipedia.org/wiki/Filesystem_Hierarchy_Standard], however.

## D: Deploy

### Task

This will show different ways of deploying container images to either a registry or to a local file.

...

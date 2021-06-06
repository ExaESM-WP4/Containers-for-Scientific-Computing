# Basic Hands-on Example

## A: Modification of an existing container

### Task

Use an existing base image (`ubuntu:21.04`), install software necessary to download an image from the internet (`curl`), and a software necessary to convert the image to a different format (`imagemagick`).

### Hints

Installation can be done with `apt update` followed by `apt intall -y <package> <package> ...`.

Let's use this image: <https://upload.wikimedia.org/wikipedia/commons/1/15/Container_Ship_%27Ever_Given%27_stuck_in_the_Suez_Canal%2C_Egypt_-_March_24th%2C_2021_cropped.jpg>

To download the image, run 
```shell
curl https://upload.wikimedia.org/wikipedia/commons/1/15/Container_Ship_%27Ever_Given%27_stuck_in_the_Suez_Canal%2C_Egypt_-_March_24th%2C_2021_cropped.jpg -o eg.jpg
```

To convert the image to, e.g., PNG, run:
```shell
convert eg.jpg eg.png
```

To check if the file format really changed, compare the output of `file eg.jpg` with that of `file eg.png`.

### Possible Solution

```shell
$ docker run -it --rm ubuntu:21.04 bash
# apt update
# apt install curl imagemagick file
# curl https://upload.wikimedia.org/wikipedia/commons/1/15/Container_Ship_%27Ever_Given%27_stuck_in_the_Suez_Canal%2C_Egypt_-_March_24th%2C_2021_cropped.jpg -o eg.jpg
# convert eg.jpg eg.png
# file eg.jpg
# file eg.png
# exit
```

### Discussion

- How to get the image out of the container? — We'll skip this for now.
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
and you can run commands using 
```Dockerfile
RUN <command>
```

### Possible solution

Create a file called `Dockerfile` with the following contents:
```Dockerfile
FROM ubuntu:21.04

RUN apt update && apt install -y curl imagemagick file
```

Then, being in the (otherwise empty directory that holds the `Dockerfile`), run
```shell
docker build . -t my-convert-image
```

For starting the container, for starting a shell in the container, and for downloading the file etc, run
```shell
$ docker run -it --rm my-convert-image bash
# curl https://upload.wikimedia.org/wikipedia/commons/1/15/Container_Ship_%27Ever_Given%27_stuck_in_the_Suez_Canal%2C_Egypt_-_March_24th%2C_2021_cropped.jpg -o eg.jpg
# convert eg.jpg eg.png
# file eg.jpg
# file eg.png
# exit
```

### Discussion

- Note that this will store the image in a local _registry_. We'll talk about this later.

## C: Binding host-system storage

This will show how to get data in and out of the container. We've already seen that from within the container, we can access the network / the internet. For many _industry_ applications using the network for interacting with the environment is all that is needed. For a scientific data-analysis context, file-system acces is, however, essential.

### Task

Make available the file-system of your computer within the container adding the following flags `--volume $PWD:/work --workdir /work` to the `docker run` call. `$PWD` contains current directory.

### Possible solution

With the image built above, start a container with a directory mounted:
```shell
$ docker run -it --rm --volume $PWD:/work --workdir /work my-convert-image bash
# curl https://upload.wikimedia.org/wikipedia/commons/1/15/Container_Ship_%27Ever_Given%27_stuck_in_the_Suez_Canal%2C_Egypt_-_March_24th%2C_2021_cropped.jpg -o eg.jpg
# convert eg.jpg eg.png
# file eg.jpg
# file eg.png
# exit
$ ls eg.*  # will display the two files
```

### Discussion

...

## D: Bundle as an app?

### Task

What if we'd like to bundle the `covert` command into a container-based app that can be called for the sole purpose of converting images?

### Hints

For defining a standard command that is executed when running the container, use 
```Dockerfile
ENTRYPOINT ["<command>", ]
```
Here, `"<command>"` could be `"convert"`.

We'll also need bind mounts.

### Possible solution

A `Dockerfile` which only has `imagemagick` installed and that has an entrypoint:
```Dockerfile
FROM ubuntu:21.04

RUN apt update && apt install -y imagemagick

ENTRYPOINT ["convert"]
```

Then, build with:
```shell
$ docker build . -t my-convert-container
```
Now, let's download the JPG outside of the container and just do the conversion in the container:
```shell
$ curl https://upload.wikimedia.org/wikipedia/commons/1/15/Container_Ship_%27Ever_Given%27_stuck_in_the_Suez_Canal%2C_Egypt_-_March_24th%2C_2021_cropped.jpg -o eg.jpg
$ docker run --rm -v $PWD:/work -w /work my-convert-container:latest eg.jpg eg.png
$ file eg.jpg
$ file eg.png
```

### Discussion

- How to use a different `imagemagick` command? There is, e.g., `identify` which can be used to inspect images.

## E: Deploy

### Task

This will show different ways of deploying container images.

...
# Basic Hands-on Example

## A: Modification of an existing container

### Possible Solution

```shell
$ docker run -it ubuntu:21.04 bash
# apt update
# apt install curl imagemagick
# curl https://upload.wikimedia.org/wikipedia/commons/d/df/Container_01_KMJ.jpg -o container.jpg
# convert container.jpg container.png
# identify container.jpg
# identify container.png
# exit
```
Repeating the `docker run` creates a new container from the same image. This new container is not affected by the changes you made to the first container created. You can see the existing containers on your system by runnig
```shell
$ docker container ls -a
```
Docker automatically assignes names to the containers. You can use the name of the first container to start it again interactively and verify that the graphic files are still present.
```shell
$ docker start -i NAME_OF_THE_CONTAINER
# ls -la
```
Note that you can force docker to automatically remove any stopped container by providing the `--rm` flag to `docker run`.

## B: Specification and Building

### Possible solution

Create a file called `Dockerfile` with the following contents:
```Dockerfile
FROM ubuntu:21.04

RUN apt update && apt install -y curl imagemagick
```

Then, being in the (otherwise empty directory that holds the `Dockerfile`), run
```shell
$ docker build . -t my-graphics-conversion-image
```

For starting the container, for starting a shell in the container, and for downloading the file etc, run
```shell
$ docker run -it --rm my-graphics-conversion-image bash
# curl https://upload.wikimedia.org/wikipedia/commons/d/df/Container_01_KMJ.jpg -o container.jpg
# convert container.jpg container.png
# identify container.jpg
# identify container.png
# exit
```

## C: Binding host-system storage

### Possible solution

With the image built above, start a container with a directory mounted:
```shell
$ docker run -it --rm --volume $PWD:/work --workdir /work my-convert-image bash
# curl https://upload.wikimedia.org/wikipedia/commons/d/df/Container_01_KMJ.jpg -o container.jpg
# convert container.jpg container.png
# identify container.jpg
# identify container.png
# exit
$ ls eg.*  # will display the two files
```

## D.1: Deploy via registry

With the image built above, first tag the image and then push it
```shell
$ docker tag my-convert-image willirath/2021-06-container-intro-course:convert-image
$ docker push willirath/2021-06-container-intro-course:convert-image
```

Pulling and running the image amounts to:
```shell
$ docker pull willirath/2021-06-container-intro-course:convert-image
$ docker run -it --rm --volume $PWD:/work --workdir /work willirath/2021-06-container-intro-course:convert-image
# curl https://upload.wikimedia.org/wikipedia/commons/d/df/Container_01_KMJ.jpg -o container.jpg
# convert container.jpg container.png
# identify container.jpg
# identify container.png
# exit
```

## D.2: Deploy via file

With the image built above, save the container to a tar archive:
```shell
$ docker save my-convert-image --output my-convert-image.tar
```

Re-loading and running the image amounts to:
```shell
$ docker load --input my-convert-image.tar
$ docker run -it --rm --volume $PWD:/work --workdir my-convert-image
# curl https://upload.wikimedia.org/wikipedia/commons/d/df/Container_01_KMJ.jpg -o container.jpg
# convert container.jpg container.png
# identify container.jpg
# identify container.png
# exit
```

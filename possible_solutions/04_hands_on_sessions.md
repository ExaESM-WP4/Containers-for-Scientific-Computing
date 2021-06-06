# Basic Hands-on Example

## A: Modification of an existing container

### Possible Solution

```shell
$ docker run -it --rm ubuntu:21.04 bash
# apt update
# apt install curl imagemagick
# curl https://upload.wikimedia.org/wikipedia/commons/d/df/Container_01_KMJ.jpg -o container.jpg
# convert container.jpg container.png
# identify container.jpg
# identify container.png
# exit
```

## B: Specification and Building

### Possible solution

Create a file called `Dockerfile` with the following contents:
```Dockerfile
FROM ubuntu:21.04

RUN apt update && apt install -y curl imagemagick file
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

## D: Bundle as an app?
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
$ curl https://upload.wikimedia.org/wikipedia/commons/d/df/Container_01_KMJ.jpg -o container.jpg
$ docker run --rm -v $PWD:/work -w /work my-convert-container:latest container.jpg container.png
$ identify container.jpg  # if installed on your host system
$ identify container.png  # if installed on your host system
```

## E: Deploy

...
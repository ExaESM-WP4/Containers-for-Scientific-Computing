# Basic Hands-on Example

## A: Modification of an existing container

### Possible Solution

```shell
$ docker run -it --rm ubuntu:21.04 bash
# apt update
# apt install curl imagemagick
# curl https://upload.wikimedia.org/wikipedia/commons/1/15/Container_Ship_%27Ever_Given%27_stuck_in_the_Suez_Canal%2C_Egypt_-_March_24th%2C_2021_cropped.jpg -o eg.jpg
# convert eg.jpg eg.png
# identify eg.jpg
# identify eg.png
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
# curl https://upload.wikimedia.org/wikipedia/commons/1/15/Container_Ship_%27Ever_Given%27_stuck_in_the_Suez_Canal%2C_Egypt_-_March_24th%2C_2021_cropped.jpg -o eg.jpg
# convert eg.jpg eg.png
# identify eg.jpg
# identify eg.png
# exit
```

## C: Binding host-system storage

### Possible solution

With the image built above, start a container with a directory mounted:
```shell
$ docker run -it --rm --volume $PWD:/work --workdir /work my-convert-image bash
# curl https://upload.wikimedia.org/wikipedia/commons/1/15/Container_Ship_%27Ever_Given%27_stuck_in_the_Suez_Canal%2C_Egypt_-_March_24th%2C_2021_cropped.jpg -o eg.jpg
# convert eg.jpg eg.png
# identify eg.jpg
# identify eg.png
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
$ curl https://upload.wikimedia.org/wikipedia/commons/1/15/Container_Ship_%27Ever_Given%27_stuck_in_the_Suez_Canal%2C_Egypt_-_March_24th%2C_2021_cropped.jpg -o eg.jpg
$ docker run --rm -v $PWD:/work -w /work my-convert-container:latest eg.jpg eg.png
$ identify eg.jpg  # if installed on your host system
$ identify eg.png  # if installed on your host system
```

## E: Deploy

...
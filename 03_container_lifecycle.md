# The container lifecycle

The typical container lifecycle (from an industry containerized software delivery perspective) consists of four parts which may be grouped into a part dealing with the *container image* and a part dealing with the *container* itself:

- Image:
  - [Specify](https://docs.docker.com/build/building/best-practices/)
  - [Build](https://docs.docker.com/reference/cli/docker/buildx/build/)
  - [Deploy](https://docs.docker.com/reference/cli/docker/image/pull/)
- Container:
  - [Run](https://docs.docker.com/reference/cli/docker/container/run/)

In a scientific-computing setting, we add two parts:

- Archive
- Reproduce

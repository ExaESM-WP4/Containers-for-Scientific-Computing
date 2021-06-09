# Summary

...

## Recap the container lifecycle

- Specify: `Dockerfile`
- Build: `docker build`
- Deploy: `docker push/export/save` and `docker pull/import/load`
- Run: `docker run`
- Archive: `docker push/export/save`
- Reproduce: `docker build`, `docker pull/import/load`

### Specify

There are different ways of specifying a container. Here, we will see `Dockerfile`s which contain a sequence of commands that lead to a container image.

### Build

There are also different ways of _building container images_. Here, we'll work extensively with `docker build` and briefly demonstrate building Singulartiy images.

### Deploy

Loosely translating deployment as "making something ready for immediate use", we'll show how to bring container images to the computer meant to run the container. We'll use two ways of transferring container images: `docker push` / `docker pull` to / from a registry, and `docker export` to a `tar` archive file which then is be transferred finally `docker import`ed.

### Run

Running containers requires a container runtime like Docker or singularity. We'll use `docker run` in most of our examples and briefly show how to use `singularity run` for running containers.

### Archive

If scientific workflows are based on containers, we need to understand how to archive all necessary aspects of container images for later use or adaption. We won't be able to cover this part of the scientific container lifecycle in great detail, but we'll aim at enabling a discussion of the various possibilities for archiving container images for later use.

### Reproduce

While containers do isolate the intenals of the container from the computer system they are running on, this isolation is not perfect. As a result, even with containers, full reproducibility and full portability is not guaranteed.

## Not covered so far

- specific scientific workflows and collaboration
- specific ways of archiving containers for short-term / long-term purposes
- subtleties:
  - Don't store data in containers
  - own software inside / outside of container?
  - integration of outside software?
  - granularity and inter-operation of containers (one big container image for the full project or many small containers for specific purposes?
)
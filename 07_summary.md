# Summary

## Recap the container lifecycle

- Specify: `Dockerfile`
- Build: `docker build`
- Deploy: `docker push/save` and `docker pull/load`
- Run: `docker run`
- Archive: `docker push/save`
- Reproduce: `docker build`, `docker pull/load`

## Further key points

- What is a container? 
- What's a container image?
- The (scientific) container lifecycle
- How to debug containers?
- Singularity: Containers for shared machines
- Isolation from / integration into host system
- Filesystem and networking
- Deploying containers
  - via a registry
  - via tar archives
  - converting docker images to singularity files

## What's next?

- Containers
  - and GPUs
  - and MPI
  - and host-system libraries (like batch schedulers)
- Multi-container setups and container orchestration
  - docker compose and singularity compose
  - manual solutions
  - kubernetes
  - what level of granularity is best for which purpose?
- Continuous Integration (CI)
  - Containers as test environments for scientific software
  - CI for building container images
- Container based workflows
  - Maintain group-wide containers as single source of truth for computing environments?
  - Share (changing) containers with collaborators?
- Container best practices (for scientific computing)
  - No data in containers
  - Include own sofware in container or not?
  - Where to archive containers for long / short term purposes?
- Advanced building
  - Docker-image layers (number and size) and cleanup
  - Multi-stage builds
  - Controlling build context
  - Target different architectures
- From Docker to Singularity
  - Many pre-existing Docker images were built with Docker but not with Singularity in mind.
  - There's a few considerations to make it easier to use Docker images with Singularity.
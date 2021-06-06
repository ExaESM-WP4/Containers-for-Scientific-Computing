# Scientific workflows and containers

## Recap the container lifecycle

- Specify: `Dockerfile`
- Build: `docker build`
- Deploy: `docker push/export/save` and `docker pull/import/load`
- Run: `docker run`
- Archive: `docker push/export/save`
- Reproduce: `docker build`, `docker pull/import/load`

## Not covered so far

- specific scientific workflows and collaboration
- specific ways of archiving containers for short-term / long-term purposes
- subtleties:
  - Don't store data in containers
  - own software inside / outside of container?
  - integration of outside software?
  - granularity and inter-operation of containers (one big container image for the full project or many small containers for specific purposes?
)
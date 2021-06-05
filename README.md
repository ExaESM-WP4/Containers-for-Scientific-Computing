# Containers for Scientific Computing Workshop 2021

## 1. Motivating demonstrator

- 5 minutes
- starting an ipython or R prompt in a pre-built container

## 2.a Brief formal intro

- scientific productivity / reproducibility
- what's a container (1 slide / page)

## 2.b Hands-On: Container basics (5 minutes)
  - docker pull for two different base images
  - `uname -a` shows same kernel (but different for each / most attendees)
  - `cat /etc/os-release` show different distros
- summary: container at runtime, image at rest

## 3. Container lifecycle

- spec
- build
- store / distribute / deploy
- run
- (archive)
- (reproduce)

## 4. Basic Hands-Ons

- A: Modification of env
  - pull, run, install `imagemagick` and `curl`, convert, exit)
  - problems:
    - How to retain the data? (later!)
    - How to keep / formalise this environment? (now!)

- B: Specification and building:
  - Dockerfile which formalises A
  - build
  - (not that this stores implicitly on local machine)
  - (run)
  - Quick overview of Dockerfile syntax and commands

- C: Bind mounts
  - this is how to provide / retain data

- D: Bundle a `convert` app?

- E: Deploy
  - show docker push (/ pull)
  - show / hands-on tar export and import 

- F: Singularity
  - mention docker2singularity
  - pull from docker registry
  - build from tar file

BREAK?

## 5. Discussion Scientific workflows

- recap lifecycle
- Discussion !!!
  - **Not covered so far:**_ Scientific productivity, reproducibility / archiving
  - Subtleties:
    - data inside / outside of container
    - own software inside / outside of container
    - integration of outside software?

## 6. Final project: Build a container for a fully reproducible and portable scientific project

See https://github.com/ExaESM-WP4/Containers-for-Scientific-Computing/tree/add-minimal-science-project/projects/minimal_science_project (to be adapted)

## Final discussion

- Caveats and limitations / when containers don't help or should be avoided
- ...

## Appendix, not covered, ...

- Z (demo): Network / Jupyter base notebook in Docker and singularity
  - show different levels of isolation

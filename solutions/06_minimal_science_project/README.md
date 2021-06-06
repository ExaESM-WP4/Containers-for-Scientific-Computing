# Minimal science project - One possible solution

We drive the whole workflow with one script [`run_everyting.sh`](run_everyting.sh).

The [`Dockerfile`](Dockerfile) installs all packages, compiles the "simulation" code [`create_data.F90`](create_data.F90) _at build time_, and then runs the whole workflow (create data and plot data) at _runtime_ as a `CMD`.

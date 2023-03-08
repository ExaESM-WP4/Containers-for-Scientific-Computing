FROM ubuntu:22.04

RUN apt update && apt install -y gfortran gnuplot-nox

# make source code available in container
RUN mkdir -p /app
COPY create_data.F90 plot_data.gp run_everything.sh /app/

# compile data creator
RUN gfortran -o /app/create_data /app/create_data.F90

# command which is executed if the container is just called
CMD [ "bash", "/app/run_everything.sh" ]
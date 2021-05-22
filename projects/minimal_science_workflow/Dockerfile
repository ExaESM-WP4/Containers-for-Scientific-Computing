FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install --force-yes --yes gnuplot-nox

RUN mkdir -p /app
COPY src/plot_data.gp /app/.
RUN chmod 755 /app/plot_data.gp

CMD [ "gnuplot", "/app/plot_data.gp" ]
FROM alpine:latest

RUN apk add --no-cache gnuplot

RUN mkdir -p /app
COPY src/plot_data.gp /app/.

CMD [ "gnuplot", "/app/plot_data.gp" ]
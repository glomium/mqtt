# vim:set ft=dockerfile:
ARG BASEIMAGE=ubuntu:rolling
FROM $BASEIMAGE
MAINTAINER Sebastian Braun <sebastian.braun@fh-aachen.de>

ENV DEBIAN_FRONTEND noninteractive
ENV LANG en_US.UTF-8

RUN apt-get update && apt-get install --no-install-recommends -y -q \
    mosquitto \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

COPY mosquitto.conf /etc/mosquitto
COPY server.conf /etc/mosquitto/conf.d/server.conf
COPY websocket.conf /etc/mosquitto/conf.d/websocket.conf

EXPOSE 1883/tcp
EXPOSE 9883/tcp

ENTRYPOINT ["mosquitto", "-c", "/etc/mosquitto/mosquitto.conf"]

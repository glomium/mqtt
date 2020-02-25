FROM ubuntu:rolling
MAINTAINER Sebastian Braun <sebastian.braun@fh-aachen.de>

RUN apt-get update && apt-get install --no-install-recommends -y -q \
    mosquitto \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
# RUN mkdir /etc/mosquitto/conf.d

COPY mosquitto.conf /etc/mosquitto
COPY server.conf /etc/mosquitto/conf.d/server.conf
COPY websocket.conf /etc/mosquitto/conf.d/websocket.conf

EXPOSE 1883/tcp
EXPOSE 9883/tcp

ENTRYPOINT ["mosquitto", "-c", "/etc/mosquitto/mosquitto.conf"]

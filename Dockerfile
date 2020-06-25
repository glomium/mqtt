ARG UBUNTU=rolling
FROM ubuntu:$UBUNTU
MAINTAINER Sebastian Braun <sebastian.braun@fh-aachen.de>

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y -q \
    mosquitto \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

COPY mosquitto.conf /etc/mosquitto
COPY server.conf /etc/mosquitto/conf.d/server.conf
COPY websocket.conf /etc/mosquitto/conf.d/websocket.conf

EXPOSE 1883/tcp
EXPOSE 9883/tcp

ENTRYPOINT ["mosquitto", "-c", "/etc/mosquitto/mosquitto.conf"]

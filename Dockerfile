FROM alpine:3.10.3
MAINTAINER Sebastian Braun <sebastian.braun@fh-aachen.de>
# base alpine template

RUN apk add --no-cache mosquitto
RUN mkdir /etc/mosquitto/conf.d

COPY mosquitto.conf /etc/mosquitto
COPY server.conf /etc/mosquitto/conf.d/server.conf
COPY websocket.conf /etc/mosquitto/conf.d/websocket.conf

EXPOSE 1883/tcp
EXPOSE 9883/tcp

ENTRYPOINT ["mosquitto", "-c", "/etc/mosquitto/mosquitto.conf"]
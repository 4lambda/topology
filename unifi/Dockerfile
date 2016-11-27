FROM debian:jessie
MAINTAINER 4Lambda Developers <d@4lambda.io>

# Add volumes.
VOLUME ["/var/lib/unifi", "/var/log/unifi", "/var/run/unifi", "/usr/lib/unifi/work"]

# Disable interactive mode.
ENV DEBIAN_FRONTEND noninteractive

# Add repos.
COPY 20ubiquiti.list /etc/apt/sources.list.d/20ubiquiti.list
COPY 21mongodb.list /etc/apt/sources.list.d/21mongodb.list
RUN  apt-key adv --keyserver keyserver.ubuntu.com --recv C0A52C50 \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10

# Install UniFi.
RUN apt-get -q update \
    && apt-get install -qy unifi prelink \
    && apt-get -q clean \
    && rm -rf /var/lib/apt/lists/*

# Setup UniFi.
RUN ln -s /var/lib/unifi /usr/lib/unifi/data
RUN execstack -c /usr/lib/unifi/lib/native/Linux/amd64/libubnt_webrtc_jni.so
EXPOSE 8080/tcp 8081/tcp 8443/tcp 8843/tcp 8880/tcp
WORKDIR /var/lib/unifi

ENTRYPOINT ["/usr/bin/java", "-Xmx1024M", "-jar", "/usr/lib/unifi/lib/ace.jar"]
CMD ["start"]

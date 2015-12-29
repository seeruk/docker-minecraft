FROM seeruk/docker-java:oracle-java8
MAINTAINER Elliot Wright <elliot@elliotwright.co>

RUN \
  apt-get update && \
  apt-get install -y git-core && \
  rm -rf /var/lib/apt/lists/* && \
  useradd -d /opt/mcserver -u 1000 -m -s /bin/bash mcserver && \
  mkdir -p /opt/mcserver && \
  mkdir -p /opt/mcbuild && \
  cd /opt/mcbuild && \
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/45/artifact/target/BuildTools.jar && \
  java -d64 -jar BuildTools.jar

COPY ./scripts/start.sh /opt/mcbuild

RUN \
  chown -R mcserver: /opt/mcbuild && \
  chown -R mcserver: /opt/mcserver && \
  chmod +x /opt/mcbuild/start.sh

USER mcserver

ENV MEMORY 2G

EXPOSE 25565

VOLUME [ "/opt/mcserver" ]

WORKDIR /opt/mcserver

CMD [ "/opt/mcbuild/start.sh" ]

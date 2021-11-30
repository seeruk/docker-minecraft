FROM openjdk:17-slim-buster
MAINTAINER Elliot Wright <hello@elliotdwright.com>

ENV MINECRAFT_HEAP_MAX 4G

COPY ./provisioning/docker-entrypoint.sh /opt/mcbuild/docker-entrypoint.sh

RUN set -x \
    && useradd -d /opt/mcserver -u 1000 -m -s /bin/bash mcserver \
    && mkdir -p /opt/mcserver \
    && mkdir -p /opt/mcbuild \
    && chown -R mcserver: /opt/mcbuild \
    && chown -R mcserver: /opt/mcserver \
    && chmod +x /opt/mcbuild/docker-entrypoint.sh

USER mcserver

EXPOSE 25565

VOLUME /opt/mcserver
WORKDIR /opt/mcserver

ENTRYPOINT ["/opt/mcbuild/docker-entrypoint.sh"]

CMD ["nogui"]

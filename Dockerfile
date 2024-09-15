FROM bitnami/java:21-debian-12

ENV MINECRAFT_HEAP_MAX=8G

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

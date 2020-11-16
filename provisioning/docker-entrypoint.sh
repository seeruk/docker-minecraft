#!/bin/bash

if [ ! -f /opt/mcserver/eula.txt ]; then
    echo "eula=true" > /opt/mcserver/eula.txt
fi

cd /opt/mcserver

exec java -XX:+UnlockExperimentalVMOptions -XX:+UseZGC -Xmx${MINECRAFT_HEAP_MAX} -jar mcserver.jar "$@"

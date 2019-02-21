#!/bin/bash

if [ ! -f /opt/mcserver/mcserver.jar ]; then
    cp /opt/mcbuild/spigot*.jar /opt/mcserver/mcserver.jar
fi

if [ ! -f /opt/mcserver/eula.txt ]; then
    echo "eula=true" > /opt/mcserver/eula.txt
fi

cd /opt/mcserver

java -XX:+UnlockExperimentalVMOptions -XX:+UseZGC -Xmx${SPIGOT_HEAP_MAX} -jar mcserver.jar "$@"

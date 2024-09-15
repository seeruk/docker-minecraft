#!/bin/bash

if [ ! -f /opt/mcserver/eula.txt ]; then
    echo "eula=true" > /opt/mcserver/eula.txt
fi

cd /opt/mcserver

exec java \
  --add-modules jdk.incubator.vector \
  -Xms${MINECRAFT_HEAP_MAX} \
  -Xmx${MINECRAFT_HEAP_MAX} \
  -XX:+UnlockExperimentalVMOptions \
  -XX:+UseZGC \
  -XX:-ZUncommit \
  -XX:+AlwaysActAsServerClassMachine \
  -XX:+AlwaysPreTouch \
  -XX:+DisableExplicitGC \
  -XX:+OptimizeStringConcat \
  -XX:+ParallelRefProcEnabled \
  -XX:+PerfDisableSharedMem \
  -XX:+UseNUMA \
  -XX:+UseParallelGC \
  -XX:+UseStringDeduplication \
  -XX:+UseThreadPriorities \
  -XX:+UseVectorCmov \
  -jar mcserver.jar "$@"

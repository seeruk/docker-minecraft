#!/bin/bash

if [ ! -f /opt/mcserver/eula.txt ]; then
    echo "eula=true" > /opt/mcserver/eula.txt
fi

cd /opt/mcserver

exec java \
  --add-modules jdk.incubator.vector \
  -XX:InitialRAMPercentage=${JVM_INIT_RAM_PERCENT:-75} \
  -XX:MaxRAMPercentage=${JVM_MAX_RAM_PERCENT:-75} \
  -XX:+UnlockExperimentalVMOptions \
  -XX:+UseZGC \
  -XX:+ZGenerational \
  -XX:+AlwaysActAsServerClassMachine \
  -XX:+AlwaysPreTouch \
  -XX:+DisableExplicitGC \
  -XX:+EnableDynamicAgentLoading \
  -XX:+OptimizeStringConcat \
  -XX:+ParallelRefProcEnabled \
  -XX:+PerfDisableSharedMem \
  -XX:+UseNUMA \
  -XX:+UseStringDeduplication \
  -XX:+UseThreadPriorities \
  -XX:+UseVectorCmov \
  -jar mcserver.jar "$@"

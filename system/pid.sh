#/bin/bash

COLLECTD_PID=$(ps aux | grep "^root.*collectd\.pid" | awk '{print $2}')
ANYCOLLECT_PID=$(ps aux | grep "^root.*/usr/bin/java.*9000" | awk '{print $2}')
JMXTRANS_PID=$(ps aux | grep "^root.*/usr/bin/java.*9002" | awk '{print $2}')

curl \
    --request PUT \
    --data "{pid: $COLLECTD_PID, tags: {app: fastjmx}}" \
    http://localhost:8500/v1/kv/anycollect/processes/fastjmx
curl \
    --request PUT \
    --data "{pid: $ANYCOLLECT_PID, tags: {app: anycollect}}" \
    http://localhost:8500/v1/kv/anycollect/processes/anycollect
curl \
    --request PUT \
    --data "{pid: $JMXTRANS_PID, tags: {app: jmxtrans}}" \
    http://localhost:8500/v1/kv/anycollect/processes/jmxtrans

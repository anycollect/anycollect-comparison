#!/bin/bash

echo "restarting: host: $JMX_HOST, port: $JMX_PORT"
export MONITOR_OPTS="-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.local.only=false -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Djava.rmi.server.hostname=${JMX_HOST} -Dcom.sun.management.jmxremote.rmi.port=${JMX_PORT} -Dcom.sun.management.jmxremote.port=${JMX_PORT}"
echo "opts: $MONITOR_OPTS"
cd /jmxtrans-270/
{{ if key "jmxtrans/separatePoolEnabled" | parseBool }}
  {{ if keyExists "jmxtrans/poolSize" }}
    export SECONDS_BETWEEN_RUNS="60 --use-separate-executors --query-processor-executor-pool-size {{ key "jmxtrans/poolSize" }} "
  {{ else }}
    export SECONDS_BETWEEN_RUNS="60 --use-separate-executors "
  {{ end }}
{{ else }}
  {{ if keyExists "jmxtrans/poolSize" }}
    export SECONDS_BETWEEN_RUNS="60 --query-processor-executor-pool-size {{ key "jmxtrans/poolSize" }}"
  {{ end }}
{{ end }}
echo "http://$CONSUL_HOST:$CONSUL_PORT/v1/kv/anycollect/jmx/$SERVICE_ID"
curl \
    --request PUT \
    --data "{\"id\":\"$SERVICE_ID\",\"host\":\"$JMX_HOST\",\"port\":\"$JMX_PORT\"}" \
    http://$CONSUL_HOST:$CONSUL_PORT/v1/kv/anycollect/jmx/$SERVICE_ID

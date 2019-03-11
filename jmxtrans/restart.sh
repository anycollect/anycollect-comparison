#!/bin/bash

echo "restarting: host: $JMX_HOST, port: $JMX_PORT"
export MONITOR_OPTS="-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.local.only=false -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Djava.rmi.server.hostname=${JMX_HOST} -Dcom.sun.management.jmxremote.rmi.port=${JMX_PORT} -Dcom.sun.management.jmxremote.port=${JMX_PORT}"

separatePoolEnabled=$(curl "http://$CONSUL_HOST:$CONSUL_PORT/v1/kv/jmxtrans/separatePoolEnabled?raw")
poolSize=$(curl "http://$CONSUL_HOST:$CONSUL_PORT/v1/kv/jmxtrans/poolSize?raw")
echo "poolSize: $poolSize"
echo "separatePoolEnabled $separatePoolEnabled"

if [[ $separatePoolEnabled == "true" ]]
  if [[ -z $poolSize ]]
    export EXTRA_OPTS="--use-separate-executors "
  else
    export EXTRA_OPTS="--use-separate-executors --query-processor-executor-pool-size $poolSize "
  fi
elif [[ -z $poolSize ]]
    export EXTRA_OPTS="--query-processor-executor-pool-size $poolSize "
fi
echo "http://$CONSUL_HOST:$CONSUL_PORT/v1/kv/anycollect/jmx/$SERVICE_ID"

cd /jmxtrans-270/
export SECONDS_BETWEEN_RUNS="60 $EXTRA_OPTS"
echo "additional: $SECONDS_BETWEEN_RUNS"
echo "monitor opts: $MONITOR_OPTS"
./bin/jmxtrans.sh restart /jmxtrans-270/conf/jmxtrans.yaml

curl \
    --request PUT \
    --data "{\"id\":\"$SERVICE_ID\",\"host\":\"$JMX_HOST\",\"port\":\"$JMX_PORT\"}" \
    http://$CONSUL_HOST:$CONSUL_PORT/v1/kv/anycollect/jmx/$SERVICE_ID

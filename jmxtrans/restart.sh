#!/bin/bash

echo "restarting: host: $JMX_HOST, port: $JMX_PORT"
MONITOR_OPTS="-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.local.only=false -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Djava.rmi.server.hostname=${JMX_HOST} -Dcom.sun.management.jmxremote.rmi.port=${JMX_PORT} -Dcom.sun.management.jmxremote.port=${JMX_PORT}"
echo "opts: $MONITOR_OPTS"
cd /jmxtrans-270/
./bin/jmxtrans.sh restart /jmxtrans-270/conf/jmxtrans.yaml
echo "http://$CONSUL_HOST:$CONSUL_PORT/v1/kv/anycollect/jmx/$SERVICE_ID"
curl \
    --request PUT \
    --data "{\"id\":\"$SERVICE_ID\",\"host\":\"$JMX_HOST\",\"port\":\"$JMX_PORT\"}" \
    http://$CONSUL_HOST:$CONSUL_PORT/v1/kv/anycollect/jmx/$SERVICE_ID
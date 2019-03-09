#!/bin/bash

echo "restart collectd"
kill `cat /collectd.pid`
/collectd/build/sbin/collectd -P /collectd.pid
curl \
    --request PUT \
    --data "{\"id\":\"$SERVICE_ID\",\"host\":\"$JMX_HOST\",\"port\":\"$JMX_PORT\"}" \
    http://$CONSUL_HOST:$CONSUL_PORT/v1/kv/anycollect/jmx/$SERVICE_ID
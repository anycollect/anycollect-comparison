#!/bin/bash

chmod +x set-env.sh
./set-env.sh
echo "additional: $SECONDS_BETWEEN_RUNS"
echo "monitor opts: $MONITOR_OPTS"
./bin/jmxtrans.sh restart /jmxtrans-270/conf/jmxtrans.yaml

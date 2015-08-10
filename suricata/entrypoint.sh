#!/usr/bin/env bash

# wait for elasticsearch to start up - https://github.com/elasticsearch/kibana/issues/3077
counter=0
while [ ! "$(curl elasticsearch:9200 2> /dev/null)" -a $counter -lt 30  ]; do
  sleep 1
  ((counter++))
  echo "waiting for Elasticsearch to be up ($counter/30)"
done

#
echo "Staring log-courier"
log-courier -config="/etc/log-courier/log-courier.conf" &

# touch /var/log/suricata/eve.json
# # chmod 644 /var/log/suricata/eve.json
#
# echo "Starting Suricata"
# suricata -c /etc/suricata/suricata.yaml --pidfile /var/run/suricata.pid -k none -i eth0 &

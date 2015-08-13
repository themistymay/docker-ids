#!/bin/bash
echo $INTERFACE
suricata -c /etc/suricata/suricata.yaml -k none -i $INTERFACE

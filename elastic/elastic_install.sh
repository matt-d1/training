#!/bin/bash

./hostdns.sh
./rsyslog.sh
./iptables.sh
./iptables_elastic.sh
./iptables_es_kibana.sh
./iptables_kibana.sh
./upgrade.sh
./common.sh
./java8.sh
./elastic.sh
./logstash.sh

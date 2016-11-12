#!/bin/bash

./hostdns.sh
./iptables.sh
./iptables_kafka.sh
./rsyslog.sh
./common.sh
./upgrade.sh
./kafka.sh

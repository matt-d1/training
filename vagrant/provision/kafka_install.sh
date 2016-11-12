#!/bin/bash

./.provision/hostdns.sh
./.provision/iptables.sh
./.provision/iptables_kafka.sh
./.provision/rsyslog.sh
./.provision/common.sh
./.provision/upgrade.sh
./.provision/kafka.sh

#!/bin/bash

./.provision/iptables.sh
# ./.provision/upgrade.sh
./.provision/hostdns.sh
./.provision/common.sh
./.provision/java8.sh
./.provision/iptables_kafka.sh
./.provision/kafka.sh

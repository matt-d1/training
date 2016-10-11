#!/bin/bash

./.provision/hostdns.sh
./.provision/iptables.sh
./.provision/iptables_kibana.sh
./.provision/rsyslog.sh
./.provision/common.sh
./.provision/upgrade.sh
./.provision/java8.sh
./.provision/kibana.sh

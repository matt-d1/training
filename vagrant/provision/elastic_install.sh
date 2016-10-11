#!/bin/bash

./.provision/hostdns.sh
./.provision/rsyslog.sh
./.provision/iptables.sh
./.provision/iptables_elastic.sh
./.provision/iptables_es_kibana.sh
./.provision/iptables_kibana.sh
./.provision/upgrade.sh
./.provision/common.sh
./.provision/java8.sh
./.provision/elastic.sh
./.provision/logstash.sh

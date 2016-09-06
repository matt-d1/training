#!/bin/bash

./.provision/iptables.sh
./.provision/upgrade.sh
./.provision/common.sh
./.provision/hostdns.sh
./.provision/java8.sh
./.provision/elastic.sh
./.provision/logstash.sh

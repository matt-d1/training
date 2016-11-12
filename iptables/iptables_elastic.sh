#!/bin/bash

# Remove IPTables drop rules
	./iptables_remove_drop.sh

# Allow http connection from kibana

# Allow rsyslog > logstash port 9480 for testing until KAFKA setup
	sudo iptables -A INPUT -p tcp --dport 9480 -j ACCEPT
	sudo iptables -A INPUT -p udp --dport 9480 -j ACCEPT

# transport.tcp.port - bind port range. Defaults to 9300-9400
        sudo iptables -A INPUT -s ELK1 -p tcp --dport 9300:9400 -j ACCEPT
	sudo iptables -A INPUT -s ELK1 -p udp --dport 9300:9400 -j ACCEPT

	sudo iptables -A INPUT -s ELK2 -p tcp --dport 9300:9400 -j ACCEPT
        sudo iptables -A INPUT -s ELK2 -p udp --dport 9300:9400 -j ACCEPT

# Add IPTables drop rules
        ./iptables_drop.sh

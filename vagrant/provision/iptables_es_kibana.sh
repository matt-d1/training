#!/bin/bash

# Remove IPTables drop rules
        ./.provision/iptables_remove_drop.sh

# Allow http connection to kibana

# Allow connection from remote kibana instances

	sudo iptables -A INPUT -s kibana1 -p tcp --dport 9200 -j ACCEPT
	sudo iptables -A INPUT -s kibana1 -p udp --dport 9200 -j ACCEPT
	
	sudo iptables -A INPUT -s kibana2 -p tcp --dport 9200 -j ACCEPT
	sudo iptables -A INPUT -s kibana2 -p tcp --dport 9200 -j ACCEPT


# Add IPTables drop rules
        ./.provision/iptables_drop.sh

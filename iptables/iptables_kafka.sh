#!/bin/bash

echo "Adding iptables for Kafka ports"

# Remove IPTables drop rules
        ./iptables_remove_drop.sh

# Kafka default port Allow anyone to connect
# NEEDS TO BE CHANGED LATER!
	sudo iptables -A INPUT -s 10.0.0.0/32 -p tcp --dport 9092 -j ACCEPT

# zookeeper clients connect to 2181
# zookeeper servers 2888:3888
	
	sudo iptables -A INPUT -s KAFKA1 -p tcp --dport 2888:3888 -j ACCEPT
	sudo iptables -A INPUT -s KAFKA2 -p tcp --dport 2888:3888 -j ACCEPT	
	
	sudo iptables -A INPUT -s KAFKA1 -p tcp --dport 2181 -j ACCEPT
        sudo iptables -A INPUT -s KAFKA2 -p tcp --dport 2181 -j ACCEPT

	sudo iptables -A INPUT -s ELK1 -p tcp --dport 2181 -j ACCEPT
        sudo iptables -A INPUT -s ELK2 -p tcp --dport 2181 -j ACCEPT

# Add IPTables drop rules
        ./iptables_drop.sh

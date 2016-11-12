#!/bin/bash

echo "Removing IPTables drop rules"

# iptables remove drop logging to allow ES port first
        sudo iptables -D INPUT -m limit --limit 5/min -j LOG --log-prefix "iptables denied: " --log-level 7

# iptables remove drop
        sudo iptables -D INPUT -j DROP

# iptables remove kibana drop
	sudo iptables -D INPUT -p tcp --dport 9200 -j REJECT

#!/bin/bash

echo "Adding iptables for Kafka ports"

# iptables remove drop logging to allow add at eof
        sudo iptables -D INPUT -m limit --limit 5/min -j LOG --log-prefix "iptables denied: " --log-level 7

# iptables remove drop
        sudo iptables -D INPUT -j DROP

# iptables add zookeeper

        sudo iptables -A INPUT -p tcp --dport 2181 -j ACCEPT

# re-add drop logging
        sudo iptables -A INPUT -m limit --limit 5/min -j LOG --log-prefix "iptables denied: " --log-level 7

# re-add drop
        sudo iptables -A INPUT -j DROP

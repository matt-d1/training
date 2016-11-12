#!/bin/bash

# drop logging
        sudo iptables -A INPUT -m limit --limit 5/min -j LOG --log-prefix "iptables denied: " --log-level 7

# drop all traffic to elasticsearch port
# local host will be allowed by localhost rule at begining of rule set
        sudo iptables -A INPUT -p tcp --dport 9200 -j REJECT

# re-add drop
        sudo iptables -A INPUT -j DROP

# List iptables
	sudo iptables -L -v

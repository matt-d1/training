#!/bin/bash

# iptables remove drop logging to allow ES port first
        sudo iptables -D INPUT -m limit --limit 5/min -j LOG --log-prefix "iptables denied: " --log-level 7

# iptables remove drop
        sudo iptables -D INPUT -j DROP

# Allow http connection from kibana

#	sudo iptables -A INPUT -s kibana1 -p tcp --dport 9200:9300 -j ACCEPT
#       sudo iptables -A INPUT -s kibana1 -p udp --dport 9200:9300 -j ACCEPT

# drop all http traffic to elasticsearch port
# local host will be allowed by localhost rule at begining of rule set
	sudo iptables -A INPUT -p tcp --dport 9200 -j REJECT

# add http.port Defaults to 9200-9300
        # sudo iptables -A INPUT -p tcp --dport 9200:9300 -j ACCEPT
        # sudo iptables -A INPUT -p udp --dport 9200:9300 -j ACCEPT

# transport.tcp.port - bind port range. Defaults to 9300-9400
        sudo iptables -A INPUT -s ELK1 -p tcp --dport 9300:9400 -j ACCEPT
	sudo iptables -A INPUT -s ELK1 -p udp --dport 9300:9400 -j ACCEPT

	sudo iptables -A INPUT -s ELK2 -p tcp --dport 9300:9400 -j ACCEPT
        sudo iptables -A INPUT -s ELK1 -p udp --dport 9300:9400 -j ACCEPT

# re-add drop logging
        sudo iptables -A INPUT -m limit --limit 5/min -j LOG --log-prefix "iptables denied: " --log-level 7

# re-add drop
        sudo iptables -A INPUT -j DROP


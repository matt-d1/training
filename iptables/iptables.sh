#!/bin/bash

# to clear all iptables
# sudo iptables -F
# sudo iptables -L --line-numbers -v

# set -I INPUT 1 to set at first line else -A apend)

#Accept established connections & New SSH

sudo iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A INPUT -p tcp --dport ssh -j ACCEPT

# Add Loopback address for all

sudo iptables -A INPUT -s 127.0.0.1/32 -j ACCEPT
sudo iptables -A INPUT -i lo -j ACCEPT

# Allow inbound ping (source IP subnet should be added)
sudo iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT

# Allow outbound ping
sudo iptables -A INPUT -p icmp --icmp-type echo-reply -j ACCEPT

##############################################
#
#
# FOR VAGRANT HOST MACHINE - CAN BE DELETED

sudo iptables -A INPUT -s 10.0.1.29 -j ACCEPT

# Drop DS UDP to stop broadcast flooding syslog
sudo iptables -A INPUT -s DS -p udp -j DROP

#
#
##############################################

#  Log dropped traffic for 5min burst (Same Source IP/Port - stop log being flooded)
sudo iptables -A INPUT -m limit --limit 5/min -j LOG --log-prefix "iptables denied: " --log-level 7

#  Drop everything else

sudo iptables -A INPUT -j DROP

# copy iptablessave to /etc/network/if-post-down.d/iptablessave
sudo cp ./config/iptablessave /etc/network/if-post-down.d/

# copy iptablesload to /etc/network/if-pre-up.d/iptablesload
sudo cp ./config/iptablesload /etc/network/if-pre-up.d/iptablesload

# make both executable 

sudo chmod +x /etc/network/if-post-down.d/iptablessave
sudo chmod +x /etc/network/if-pre-up.d/iptablesload

#!/bin/bash

# Need to add SMTP to allow outgoing mails & setup connections for ELK

# Add Loopback address for all (set -I INPUT 1 to set at first line else -A apend)

sudo iptables -A INPUT -i lo -j ACCEPT
sudo iptables -A INPUT -s 127.0.0.1/32 -d 127.0.0.1/32 -j ACCEPT

#Accept established connections & New SSH

sudo iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
sudo iptables -A INPUT -p tcp --dport ssh -j ACCEPT

# Allow inbound ping (source IP subnet should be added)
sudo iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT

# Allow outbound ping
sudo iptables -A INPUT -p icmp --icmp-type echo-reply -j ACCEPT

#  Log dropped traffic for 5min burst (Same Source IP/Port - stop log being flooded)
sudo iptables -A INPUT -m limit --limit 5/min -j LOG --log-prefix "iptables denied: " --log-level 7

#  Drop everything else

sudo iptables -A INPUT -j DROP

# copy iptablessave to /etc/network/if-post-down.d/iptablessave
sudo cp ./.provision/config/iptablessave /etc/network/if-post-down.d/

# copy iptablesload to /etc/network/if-pre-up.d/iptablesload
sudo cp ./.provision/config/iptablesload /etc/network/if-pre-up.d/iptablesload

# make both executable 

sudo chmod +x /etc/network/if-post-down.d/iptablessave
sudo chmod +x /etc/network/if-pre-up.d/iptablesload

#sudo apt-get install iptables-persistent -y
#sudo invoke-rc.d iptables-persistent save

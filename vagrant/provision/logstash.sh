#!/bin/bash

# If installing on seperate machine, then might need IP Tables amending
# iptables remove drop
# sudo iptables -D INPUT -j DROP
# add ES port 9200
# sudo iptables -A INPUT -p tcp --dport 9200 -j ACCEPT
# re-add drop 
# sudo iptables -A INPUT -j DROP

echo "Adding elastic repo"

# Add ES key / repo

wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

echo "deb https://packages.elastic.co/logstash/2.3/debian stable main" | sudo tee -a /etc/apt/sources.list


# Install Logstash 
# Install dir is
	sudo apt-get update -y
        sudo apt-get install logstash 

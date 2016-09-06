#!/bin/bash

#  apt-get or yum depending on system
PKG_MANAGER=$( command -v yum | grep yum || command -v apt-get | grep apt-get )


# If installing on seperate machine, then might need IP Tables amending
# iptables remove drop
# sudo iptables -D INPUT -j DROP
# add ES port 9200
# sudo iptables -A INPUT -p tcp --dport 9200 -j ACCEPT
# re-add drop 
# sudo iptables -A INPUT -j DROP

echo "Adding logstash repo"

# Add ES key / repo

wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

echo "deb https://packages.elastic.co/logstash/2.3/debian stable main" | sudo tee -a /etc/apt/sources.list


# Install Logstash 
# Install dir is
	sudo $PKG_MANAGER update -y
        sudo $PKG_MANAGER install logstash 

# Copy configs	
	sudo cp ./.provision/config/elk_config/logstash_default.conf /etc/logstash/conf.d/logstash_default.conf
	sudo cp ./.provision/config/elk_config/logstash /etc/default/logstash

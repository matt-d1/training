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

# echo "deb https://packages.elastic.co/logstash/2.3/debian stable main" | sudo tee -a /etc/apt/sources.list
echo "deb https://packages.elastic.co/logstash/2.4/debian stable main" | sudo tee -a /etc/apt/sources.list


# Install Logstash 
	sudo $PKG_MANAGER update -y
        sudo $PKG_MANAGER install logstash 

# Copy configs	
	sudo cp ./.provision/config/elk_config/logstash.conf /etc/logstash/conf.d
	sudo cp ./.provision/config/elk_config/logstash /etc/default/logstash

# Copy syslog configs
# 49-ship for kafka
#	sudo cp ./.provision/config/rsyslog/49-ship-syslog.conf /etc/rsyslog.d
	sudo cp ./.provision/config/rsyslog/01-json-template.conf /etc/rsyslog.d
	sudo cp ./.provision/config/rsyslog/60-output.conf /etc/rsyslog.d

# Start logstash service
	sudo /etc/init.d/logstash start

# Restart rsyslog
	sudo service rsyslog restart

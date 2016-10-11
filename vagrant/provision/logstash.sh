#!/bin/bash

#  apt-get or yum depending on system
PKG_MANAGER=$( command -v yum | grep yum || command -v apt-get | grep apt-get )


echo "Adding logstash repo"

# Add ES key / repo

wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

# echo "deb https://packages.elastic.co/logstash/2.3/debian stable main" | sudo tee -a /etc/apt/sources.list
echo "deb https://packages.elastic.co/logstash/2.4/debian stable main" | sudo tee -a /etc/apt/sources.list


# Install Logstash 
	sudo $PKG_MANAGER update -y
        sudo $PKG_MANAGER install logstash 

# Copy configs	
	sudo cp ./.provision/config/elk_config/logstash_indexer.sh /etc/logstash/conf.d
	sudo cp ./.provision/config/elk_config/logstash /etc/default/logstash

# Start logstash service
	sudo /etc/init.d/logstash start

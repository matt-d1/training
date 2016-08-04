#!/bin/bash

# install curl
 	sudo apt-get install curl

# iptables remove drop logging to allow ES port first
	sudo iptables -D INPUT -m limit --limit 5/min -j LOG --log-prefix "iptables denied: " --log-level 7

# iptables remove drop
	sudo iptables -D INPUT -j DROP

# add http.port Defaults to 9200-9300
	sudo iptables -A INPUT -p tcp --dport 9200:9300 -j ACCEPT

# transport.tcp.port - bind port range. Defaults to 9300-9400
	sudo iptables -A INPUT -p tcp --dport 9300:9400 -j ACCEPT

# re-add drop logging
	sudo iptables -A INPUT -m limit --limit 5/min -j LOG --log-prefix "iptables denied: " --log-level 7

# re-add drop 
	sudo iptables -A INPUT -j DROP

echo "Adding elastic repo"

# Add ES key / repo

  	sudo wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

        # elasticsearch v2 not found

        echo "deb http://packages.elastic.co/elasticsearch/2.x/debian stable main" | sudo tee -a /etc/apt/sources.list.d/elasticsearch-2.x.list

        # elasticsearch v5

# echo "deb https://packages.elastic.co/elasticsearch/5.x/debian stable main" | sudo tee -a /etc/apt/sources.list.d/elasticsearch-5.x.list


# Install Elasticserach
# Install dir is /usr/share/elasticsearch/
	sudo apt-get update -y
        sudo apt-get install elasticsearch
        sudo update-rc.d elasticsearch defaults 95 10
# sudo -i service elasticsearch start

# copy env variables config file - set JVM size
	cp ./.provision/config/elk_config/elasticsearch /etc/default/elasticsearch

# copy elasticsearch config files to configure cluster - change to root first

	sudo su

	cp ./.provision/config/elk_config/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml

	exit

# Start service
	sudo -i service elasticsearch start

# Restart service 
#	sudo service elasticsearch restart

# check cluster status and print
	echo | curl -XGET 'http://localhost:9200/_cluster/health?pretty=true'

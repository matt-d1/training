#!/bin/bash

#  $PKG_MANAGER or yum depending on system
PKG_MANAGER=$( command -v yum | grep yum || command -v $PKG_MANAGER | grep $PKG_MANAGER )


# install curl
 	sudo $PKG_MANAGER install curl

# iptables remove drop logging to allow ES port first
	sudo iptables -D INPUT -m limit --limit 5/min -j LOG --log-prefix "iptables denied: " --log-level 7

# iptables remove drop
	sudo iptables -D INPUT -j DROP

# iptables add zookeeper

	sudo iptables -A INPUT -p tcp --dport 2181 -j ACCEPT


# re-add drop logging
	sudo iptables -A INPUT -m limit --limit 5/min -j LOG --log-prefix "iptables denied: " --log-level 7

# re-add drop 
	sudo iptables -A INPUT -j DROP

echo "Adding jre"
	sudo $PKG_MANAGER install default-jre

echo "Adding zookeeper"

sudo $PKG_MANAGER install zookeeperd

# Add kafka.tar 

wget "http://mirror.cc.columbia.edu/pub/software/apache/kafka/0.8.2.1/kafka_2.11-0.8.2.1.tgz"

        # elasticsearch v2 not found

        echo "deb http://packages.elastic.co/elasticsearch/2.x/debian stable main" | sudo tee -a /etc/apt/sources.list.d/elasticsearch-2.x.list

        # elasticsearch v5

# echo "deb https://packages.elastic.co/elasticsearch/5.x/debian stable main" | sudo tee -a /etc/apt/sources.list.d/elasticsearch-5.x.list


# Install Elasticserach
# Install dir is /usr/share/elasticsearch/
	sudo $PKG_MANAGER update -y
        sudo $PKG_MANAGER install elasticsearch
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

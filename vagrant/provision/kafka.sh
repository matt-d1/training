#!/bin/bash

#  $PKG_MANAGER or yum depending on system
PKG_MANAGER=$( command -v yum | grep yum || command -v $PKG_MANAGER | grep $PKG_MANAGER )

echo "Adding jre"
	sudo $PKG_MANAGER install default-jre

echo "Adding zookeeper"

sudo $PKG_MANAGER install zookeeperd

# Add kafka.tar 

wget "http://mirror.cc.columbia.edu/pub/software/apache/kafka/0.8.2.1/kafka_2.11-0.8.2.1.tgz"

sudo tar -zxvf kafka_2.11-0.8.2.1.tgz 
sudo mv kafka_2.11-0.8.2.1 /usr/local/kafka


# Install dir is /usr/share/elasticsearch/
	sudo $PKG_MANAGER update -y

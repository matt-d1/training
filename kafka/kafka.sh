#!/bin/bash

#  $PKG_MANAGER or yum depending on system
PKG_MANAGER=$( command -v yum | grep yum || command -v $PKG_MANAGER | grep $PKG_MANAGER )

# need to re-write to auto add account
sudo useradd kafka -m
sudo passwd kafka
kafka123

sudo adduser kafka sudo
su - kafka

echo "Adding jre"
	sudo $PKG_MANAGER install default-jre

echo "Adding zookeeper"

sudo $PKG_MANAGER install zookeeperd

exit

# Add kafka.tar 

wget "http://mirror.cc.columbia.edu/pub/software/apache/kafka/0.8.2.1/kafka_2.11-0.8.2.1.tgz"

sudo tar -zxvf kafka_2.11-0.8.2.1.tgz 
sudo mv kafka_2.11-0.8.2.1 /usr/local/kafka_2.11-0.8.2.1

sudo ln -s /usr/local/kafka_2.11-0.8.2.1 /usr/local/kafka

sudo cp ./config/elk_config/kafka/server.properties /usr/local/kafka/config/

# Starting Kafka
echo "Starting Kafka"
nohup /usr/local/kafka/bin/kafka-server-start.sh ../config/server.properties > /var/log/kafka/kafka.log 2>&1 &

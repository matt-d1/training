#!/bin/bash

#  $PKG_MANAGER or yum depending on system
PKG_MANAGER=$( command -v yum | grep yum || command -v $PKG_MANAGER | grep $PKG_MANAGER )


echo "Adding kafka account"

sudo apt-get install zookeeperd

echo "Adding jre"
        sudo $PKG_MANAGER install default-jre

	sudo $PKG_MANAGER install zookeeperd

wget "http://mirror.cc.columbia.edu/pub/software/apache/kafka/0.10.0.1/kafka_2.11-0.10.0.1.tgz"

mkdir -p /usr/local/zookeeper

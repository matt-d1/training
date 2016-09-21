#!/bin/bash

#  apt-get or yum depending on system
PKG_MANAGER=$( command -v yum | grep yum || command -v apt-get | grep apt-get )

	sudo $PKG_MANAGER update -y

# install curl
 	sudo $PKG_MANAGER install curl

echo "Adding ES iptables rules"
# iptables_elastic.sh
	./.provision/iptables_elastic.sh

echo "Adding elastic repo"

# Add ES key / repo

  	sudo wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

        # elasticsearch v2 not found

        echo "deb http://packages.elastic.co/elasticsearch/2.x/debian stable main" | sudo tee -a /etc/apt/sources.list.d/elasticsearch-2.x.list

        # elasticsearch v5

# echo "deb https://packages.elastic.co/elasticsearch/5.x/debian stable main" | sudo tee -a /etc/apt/sources.list.d/elasticsearch-5.x.list

echo "Install Elasticserach"
# Install Elasticserach
# Install dir is /usr/share/elasticsearch/
	sudo $PKG_MANAGER update -y
        sudo $PKG_MANAGER install elasticsearch

echo "Elasticsearch install complete"

# sudo ./.provision/elastic_root.sh

# copy elasticsearch config files to configure cluster - change to root first

        #sudo su

        # copy env variables config file - set JVM size
        sudo cp ./.provision/config/elk_config/elasticsearch /etc/default/elasticsearch

        # change swappiness to 15 from 60 - mlockall
        sudo echo 'vm.swappiness = 15' >> /etc/sysctl.conf
        sudo sysctl -p

# cat /proc/sys/vm/swappiness


echo "Copying elasticsearch.yml"
sudo cp ./.provision/config/elk_config/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml

echo "start elasticsearch service"


sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable elasticsearch.service
sudo /bin/systemctl start elasticsearch.service

# Start service
#        sudo -i service elasticsearch start

# Restart service
#       sudo service elasticsearch restart

# check cluster status and print
       echo | curl -XGET 'http://localhost:9200/_cluster/health?pretty=true'

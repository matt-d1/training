#!/bin/bash

# iptables remove drop
sudo iptables -D INPUT -j DROP

# add ES port 9200
sudo iptables -A INPUT -p tcp --dport 9200 -j ACCEPT

# re-add drop 
sudo iptables -A INPUT -j DROP

echo "Adding elastic repo"

# Add ES key / repo

  sudo wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

        # elasticsearch v2 not found

#        echo "deb http://packages.elastic.co/elasticsearch/2.x/debian stable main" | sudo tee -a /etc/apt/sources.list.d/elasticsearch-2.x.list

        # elasticsearch v5

echo "deb https://packages.elastic.co/elasticsearch/5.x/debian stable main" | sudo tee -a /etc/apt/sources.list.d/elasticsearch-5.x.list


# Install Elasticserach
# Install dir is /usr/share/elasticsearch/
	sudo apt-get update -y
        sudo apt-get install elasticsearch
        sudo update-rc.d elasticsearch defaults 95 10
        sudo -i service elasticsearch start

# Install curl
	sudo apt-get install curl

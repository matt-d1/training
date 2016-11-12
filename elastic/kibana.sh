#!/bin/bash

#  apt-get or yum depending on system
PKG_MANAGER=$( command -v yum | grep yum || command -v apt-get | grep apt-get )

echo "Adding kibana repo"

# Add ES key / repo
wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

# echo "deb http://packages.elastic.co/kibana/4.5/debian stable main" | sudo tee -a /etc/apt/sources.list
echo "deb https://packages.elastic.co/kibana/4.6/debian stable main" | sudo tee -a /etc/apt/sources.list.d/kibana.list


# Install Kibana
# install dir /opt/kibana
sudo $PKG_MANAGER update -y
sudo $PKG_MANAGER install kibana

# copy config to localhost

sudo cp ./config/elk_config/kibana.yml /opt/kibana/config/

sudo update-rc.d kibana defaults 95 10
sudo -i service kibana start

# Restart service
#       sudo service kibana restart

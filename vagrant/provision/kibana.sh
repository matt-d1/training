#!/bin/bash

# iptables remove drop
sudo iptables -D INPUT -j DROP

# add http / https
sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT

# re-add drop 
sudo iptables -A INPUT -j DROP

# save iptables
sudo invoke-rc.d iptables-persistent save

echo "Adding elastic repo"

# Add ES key / repo
wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

echo "deb http://packages.elastic.co/kibana/4.5/debian stable main" | sudo tee -a /etc/apt/sources.list


# Install Kibana
# install dir /opt/kibana
sudo apt-get update -y
sudo apt-get install kibana

sudo update-rc.d kibana defaults 95 10
sudo -i service kibana start

# copy config to localhost

sudo cp ./.provision/config/kibana.yml /opt/kibana/config/

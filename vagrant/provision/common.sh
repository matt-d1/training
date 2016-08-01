#!/bin/bash

# sudo tail -1000f /var/log/syslog

# common utiils
        sudo apt-get install htop

# upload hosts file
	sudo cp ./.provision/config/hosts /etc/hosts

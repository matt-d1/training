#!/bin/bash

# sudo tail -1000f /var/log/syslog

# common utiils

#  apt-get or yum depending on system
PKG_MANAGER=$( command -v yum | grep yum || command -v apt-get | grep apt-get )

	sudo $PKG_MANAGER install htop
	sudo $PKG_MANAGER install iproute

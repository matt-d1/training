#!/bin/bash

# update, upgrade and remove no longer required

#  apt-get or yum depending on system 
PKG_MANAGER=$( command -v yum | grep yum || command -v apt-get | grep apt-get )

	sudo $PKG_MANAGER update
#	sudo $PKG_MANAGER upgrade -y
#	sudo dpkg --configure -a
	sudo $PKG_MANAGER -f install
#	sudo $PKG_MANAGER autoremove -y

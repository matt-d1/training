#!/bin/bash

# update, upgrade and remove no longer required

	sudo apt-get update
	sudo apt-get upgrade -y
	sudo dpkg --configure -a
	sudo apt-get -f install
	sudo apt-get autoremove -y

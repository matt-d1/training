#!/bin/bash

#Copy current hosts to server
sudo cp ./.provision/config/hosts /etc/hosts

# PATH TO YOUR HOSTS FILE
ETC_HOSTS=/etc/hosts

#find all ip
IP=$(ifconfig | grep -oE '((1?[0-9][0-9]?|2[0-4][0-9]|25[0-5])\.){3}(1?[0-9][0-9]?|2[0-4][0-9]|25[0-5])' | grep 10.0.1 | grep -v 10.0.1.255)

# Hostname to add/remove.
HOSTNAME=$(hostname)

if [ -n "$(grep $HOSTNAME /etc/hosts)" ]
    then
        echo "$HOSTNAME Found in your $ETC_HOSTS, Removing now...";
        sudo sed -i".bak" "/$HOSTNAME/d" $ETC_HOSTS
    else
        echo "$HOSTNAME was not found in your $ETC_HOSTS";
    fi


    HOSTS_LINE="$IP\t$HOSTNAME"
            echo "Adding $HOSTNAME to your $ETC_HOSTS"
            sudo -- sh -c -e "echo '$HOSTS_LINE' >> /etc/hosts"

#Copy hosts back to provision dir 
sudo cp /etc/hosts ./.provision/config/hosts

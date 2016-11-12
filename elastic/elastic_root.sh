#!/bin/bash

# copy elasticsearch config files to configure cluster - change to root first

        #sudo su

        # copy env variables config file - set JVM size
        sudo cp ./config/elk_config/elasticsearch /etc/default/elasticsearch

        # change swappiness to 15 from 60 - mlockall
        sudo echo 'vm.swappiness = 15' >> /etc/sysctl.conf
        sudo sysctl -p

# cat /proc/sys/vm/swappiness

        exit

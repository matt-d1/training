#!/bin/bash

# Copy syslog configs
# 49-ship for kafka
#       sudo cp ./.provision/config/rsyslog/49-ship-syslog.conf /etc/rsyslog.d
        sudo cp ./.provision/config/rsyslog/01-json-template.conf /etc/rsyslog.d
        sudo cp ./.provision/config/rsyslog/60-output.conf /etc/rsyslog.d

# Restart rsyslog
        sudo service rsyslog restart

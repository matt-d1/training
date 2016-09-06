#/!bin/bash

#  $PKG_MANAGER or yum depending on system
PKG_MANAGER=$( command -v yum | grep yum || command -v $PKG_MANAGER | grep $PKG_MANAGER )


echo "Installing Java8"
# Install Java8

        # Update repo

        sudo $PKG_MANAGER -repository ppa:webupd8team/java -y
        sudo $PKG_MANAGER update -y

        # Accept license terms and mark as read
        echo debconf shared/accepted-oracle-license-v1-1 select true | \
        sudo debconf-set-selections

        echo debconf shared/accepted-oracle-license-v1-1 seen true | \
        sudo debconf-set-selections

        # Install java8

        sudo $PKG_MANAGER install oracle-java8-installer -y

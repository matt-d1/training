#/!bin/bash

echo "Installing Java8"
# Install Java8

        # Update repo

        sudo add-apt-repository ppa:webupd8team/java -y
        sudo apt-get update -y

        # Accept license terms and mark as read
        echo debconf shared/accepted-oracle-license-v1-1 select true | \
        sudo debconf-set-selections

        echo debconf shared/accepted-oracle-license-v1-1 seen true | \
        sudo debconf-set-selections

        # Install java8

        sudo apt-get install oracle-java8-installer -y

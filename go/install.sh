#! /bin/bash
echo "Installing go"
sudo add-apt-repository ppa:gophers/archive 
sudo apt update > /dev/null 2>&1
sudo apt-get -y install golang-1.9-go > /dev/null

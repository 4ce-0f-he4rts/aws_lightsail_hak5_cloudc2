#! /bin/bash 
sudo apt update && sudo apt install wget unzip -y
wget https://downloads.hak5.org/api/devices/cloudc2/firmwares/latest -q -O c2.zip && unzip -qq c2.zip && \
IP=$(curl -s https://checkip.amazonaws.com) && \
echo "Copy the below setup token and browse to http://$IP:8080" && \
./c2-*_amd64_linux -hostname $IP
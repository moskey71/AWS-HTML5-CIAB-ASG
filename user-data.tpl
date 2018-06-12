#!/bin/bash

# install git
apt-get install git

# change directory
cd /opt

# clone ciab project
git clone ${ciab_repo}

# rename directory
mv /opt/CIAB-Guacamole-Remote-Desktop /opt/ciab

# change folder
cd ciab

# setup guacamole
./setup-guacamole.sh

# add guacd config
IP="$(ip -o -4  address show  | awk ' NR==2 { gsub(/\/.*/, "", $4); print $4 } ')"
export IP
#add text file
touch /etc/guacamole/guacd.conf
echo "bind_host = echo $IP" \> /etc/guacamole/guacd.conf
echo "bind_port = 443" \> /etc/guacamole/guacd.conf



# setup nginx
./setup-nginx

# install microsoft fonts and accept license to allow setup-ciab to succeed
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
sudo apt-get install ttf-mscorefonts-installer

# setup cloud in a box
#./setup-ciab.sh

#restart
shutdown -r now

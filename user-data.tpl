#!/bin/bash

# install git
apt-get install git -y

# change directory
cd /opt

# clone ciab git repo
git clone ${git_repo}

# rename directory
mv /opt/CIAB-Guacamole-Remote-Desktop /opt/ciab

# change folder
cd ciab

# setup guacamole
./setup-guacamole.sh

# add guacd config
#IP="$(ip -o -4  address show  | awk ' NR==2 { gsub(\/\\\/.*\/, "", $4); print $4 } ')"
#IP="$(ip -o -4  address show  | awk ' NR==2 { gsub(/\/.*/, "", $4); print $4 } ')"
#export IP
#add guacd config file
#touch \/etc\/guacamole\/guacd.conf
#echo "bind_host = $${IP}" >> \/etc\/guacamole\/guacd.conf
#echo "bind_port = 443" >> \/etc\/guacamole\/guacd.conf

# Set guacadmin password
mysql --host=localhost << END

USE guacdb;
SET @salt = UNHEX(SHA2(UUID(), 256));
UPDATE guacamole_user
SET
    password_salt = @salt,
    password_hash = UNHEX(SHA2(CONCAT('${GUAC_ADMIN_PASSWORD}', HEX(@salt)), 256))
WHERE
    username = 'guacadmin';

END

# set permissions on setup-nginx.sh
chmod 744 setup-nginx.sh

# setup nginx
./setup-nginx.sh

# install microsoft fonts and accept license to allow setup-ciab to succeed
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
sudo apt-get install ttf-mscorefonts-installer -y

# setup cloud in a box
#./setup-ciab.sh

#restart
#shutdown -r now

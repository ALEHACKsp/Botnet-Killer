#!/bin/bash

echo "[+] xorddos killer starting"

# 清理病毒脚本
rm -f /etc/init.d/tmoogsb
rm -f /etc/cron.hourly/gcc.sh

# 清理病毒自启动项
rm -f /etc/rc[1-5].d/S90tmoogsb
rm -f /etc/rc.d/rc[1-5].d/S90tmoogsb

# 清理病毒动态链接库
rm -f /lib/libudev.so

rm -f /lib/udev/udev

crontab -r
chkconfig –del tmoogsb
update-rc.d tmoogsb remove#!/bin/bash

# 锁定/boot目录下的随机名病毒文件
path = '/boot'
files = $(ls -a $path)
for filename in $files
do
	file_path=$path/$filename
	if [ -f $file_path ]
	then
		file_md5=$(md5sum $file_path | cut -d ' ' -f1)
		if [ $file_md5=='0B3456561B7942AA67403CDDC1FAD2BD' ]
		then
			echo 'found' $file_path
			rm -f $file_path
		fi
	fi
done

echo "[+] finish"
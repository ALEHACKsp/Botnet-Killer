#!/bin/bash

#　先暂停主机的定时任务服务
service crond stop

# 清除病毒驱动
busybox rm -f /etc/ld.so.preload
busybox rm -f /usr/local/lib/libioset.so
chattr -i /etc/ld.so.preload
busybox rm -f /etc/ld.so.preload
busybox rm -f /usr/local/lib/libioset.so

# 清除病毒文件
busybox rm -f /tmp/watchdogs
busybox rm -f /etc/cron.d/tomcat
busybox rm -f /etc/cron.d/root
busybox rm -f /var/spool/cron/root
busybox rm -f /var/spool/cron/crontabs/root
busybox rm -f /etc/rc.d/init.d/watchdogs
busybox rm -f /usr/sbin/watchdogs

ldconfig

# 清除病毒进程
busybox ps -ef | busybox grep -v grep | busybox egrep 'ksoftirqds' | busybox awk '{print $1}' | busybox xargs kill -9
busybox ps -ef | busybox grep -v grep | busybox egrep 'watchdogs' | busybox awk '{print $1}' | busybox xargs kill -9

# 清理开机启动项
chkconfig watchdogs off
chkconfig –del watchdogs

service crond start

# 恢复系统工具
yum install net-tools
apt-get inst net-tools

echo "Done, Please reboot!"
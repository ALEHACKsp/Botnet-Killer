#!/bin/bash

# 清理木马核心文件
rm -rf /usr/bin/.sshd
rm -rf /usr/bin/bsd-port/getty
rm -rf /usr/bin/bsd-port/getty.lock
rm -rf /usr/bin/bsd-port/conf.n
rm -rf /usr/lib/libamplify.so

# 清理木马残留文件
rm -rf /tmp/moni.lod
rm -rf /tmp/gates.lod
rm -rf /tmp/lang
rm -rf /tmp/*.lock

# 清理木马自启动文件
rm -rf /etc/init.d/selinux
rm -rf /etc/init.d/DbSecuritySpt
rm -rf /etc/rc.local
rm -rf /etc/rc[1-5].d/S97DbSecuritySpt
rm -rf /etc/rc[1-5].d/S99selinux

# 清理木马残留脚本
rm -rf /etc/conf.n
rm -rf /etc/cmd.n

# 恢复系统文件netstat
if [ -f /usr/bin/dpkgd/netstat ]
then
	cp -f /usr/bin/dpkgd/netstat /bin
	cp -f /usr/bin/dpkgd/netstat /usr/bin
	cp -f /usr/bin/dpkgd/netstat /usr/sbin
fi

# 恢复系统文件lsof
if [ -f /usr/bin/dpkgd/lsof ]
then
	cp -f /usr/bin/dpkgd/lsof /bin
	cp -f /usr/bin/dpkgd/lsof /usr/bin
	cp -f /usr/bin/dpkgd/lsof /usr/sbin
fi

# 恢复系统文件ps
if [ -f /usr/bin/dpkgd/ps ]
then
	cp -f /usr/bin/dpkgd/ps /bin
	cp -f /usr/bin/dpkgd/ps /usr/bin
	cp -f /usr/bin/dpkgd/ps /usr/sbin
fi
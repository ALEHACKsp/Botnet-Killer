#!/bin/bash

echo "[+] ddg killer starting"

# 清理病毒母体进程及文件
pkill /tmp/ddg.*
rm -f /tmp/ddg.*

# 清理挖矿病毒进程&文件
pkill /tmp/wnTKYg
rm -f /tmp/wnTKYg
pkill /tmp/imWBR1
rm -f /tmp/imWBR1
pkill /tmp/2t3ik
rm -f /tmp/2t3ik
pkill /tmp/qW3xT*
rm -f /tmp/qW3xT*
pkill /tmp/SzDXM
rm -f /tmp/SzDXM

# 清理病毒脚本
rm -f /tmp/disable.sh
rm -f /tmp/disable

# 清理病毒定时任务
rm -f /var/spool/cron/root
rm -f /var/spool/cron/crontabs/root

# 清理SSH公钥
rm ./authorized_keys

echo "[+] finish"
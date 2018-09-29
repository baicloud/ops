#!/bin/bash

used=`free -m | awk 'NR==2' | awk '{print $3}'`
free=`free -m | awk 'NR==2' | awk '{print $4}'`

echo "===========================" >> /root/mem.log
date >> /root/mem.log
echo "Memory usage | [Use：${used}MB][Free：${free}MB]" >> /root/mem.log

if [ $free -le  2000 ] ; then
    sync && echo 1 > /proc/sys/vm/drop_caches
    sync && echo 2 > /proc/sys/vm/drop_caches
    sync && echo 3 > /proc/sys/vm/drop_caches
    echo "OK" >> /root/mem.log
else
    echo "Not required" >> /root/mem.log
fi

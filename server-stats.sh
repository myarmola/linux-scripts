#!/bin/bash
echo "Current CPU load average:"
uptime | awk -F'load average: ' '{print $2}'
echo "Total, used, free memory:"
free -h | awk '/Mem:/ {print $2,$3,$4}'
echo "Total, used, free disk space:"
df -h | awk '$NF == "/" {print $2,$3,$4}'
echo "Top 5 procecces by CPU usage:"
ps -eo pid,cmd,%cpu --sort=-%cpu | head -6
echo "Top 5 procecces by RAM usage:"
ps -eo pid,cmd,%mem --sort=-%mem | head -6

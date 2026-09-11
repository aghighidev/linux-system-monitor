#!/bin/bash


echo -e "\e[36m==============================\e[0m"
echo -e "     \e[35mLINUX SYSTEM MONITOR\e[0m"
echo -e "\e[36m==============================\e[0m"
echo ""
echo "Host Name : $(hostname)"
echo "OS : $(uname -o)"
echo "Kernel : $(uname -r)"
echo "Uptime : $(uptime -p)"
echo ""
echo "CPU Usage : $(top -bn1 | grep "Cpu" | awk '{print 100 - $8"%"}')"
echo "DISK Usage : $(df -h / | grep "/dev" | awk '{print $5}')"
echo "RAM Usage : $(free -h| awk '/Mem: / {printf "%.1f%%\n", $3 / $2 * 100}')"
echo ""
echo -e "\e[36m==============================\e[0m"
echo -e "     \e[33mPROCESSES\e[0m"
echo -e "\e[36m==============================\e[0m"
echo ""
if [[ $(systemctl is-active docker) == "active" ]]; then
	echo -e "Docker : \e[32mRUNNING :)\e[0m"
else
	echo -e "Docker : \e[31mNOT RUNNING :(\e[0m"
fi
if [[ $(systemctl is-active ssh) == "active" ]]; then
        echo -e "ssh : \e[32mRUNNING :)\e[0m"
else
        echo -e "ssh : \e[31mNOT RUNNING :(\e[0m"
fi
if [[ $(systemctl is-active nginx) == "active" ]]; then
        echo -e "Nginx : \e[32mRUNNING :)\e[0m"
else
        echo -e "Nginx : \e[31mNOT RUNNING :(\e[0m"
fi
echo ""
echo -e "\e[36m==============================\e[0m"
echo -e "     \e[34mHEALTH STATUS\e[0m"
echo -e "\e[36m==============================\e[0m"
echo ""
overall="OK"
cpu=$(top -bn1 | grep "Cpu" | awk '{print int(100 - $8"%")}')
if [[ "$cpu" -lt 80 ]]; then
	echo -e "CPU : \e[32mOK\e[0m"
else
	echo -e "CPU : \e[31mWARNING\e[0m"
	overall="WARNING"
fi
disk=$(df -h / | grep "/dev" | awk '{print int($5)}')
if [[ "$disk" -lt 80 ]]; then
        echo -e "DISK : \e[32mOK\e[0m"
else
        echo -e "DISK : \e[31mWARNING\e[0m"
	overall="WARNING"
fi
ram=$(free | awk '/Mem: / {print int($3 / $2 * 100)}')
if [[ "$ram" -lt 80 ]]; then
        echo -e "RAM : \e[32mOK\e[0m"
else
        echo -e "RAM : \e[31mWARNING\e[0m"
	overall="WARNING"
fi
echo ""
if [[ "$overall" == "OK" ]]; then
    echo -e "Overall Status : \e[32mOK\e[0m"
else
    echo -e "Overall Status : \e[31mWARNING\e[0m"
fi

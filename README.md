# linux-system-monitor
A simple Bash-based system monitoring script for Linux.

Features

The script displays:

Hostname
Operating system
Kernel version
System uptime
CPU usage
RAM usage
Disk usage
Docker service status
SSH service status
Nginx service status
Overall system health status
Health Checks

The script checks CPU, RAM, and disk usage against predefined thresholds and reports their status as:

OK
WARNING

It also checks whether selected system services are running.

Requirements
Linux
Bash
awk
grep
df
free
top
systemctl
Usage

Clone the repository:

git clone https://github.com/YOUR_USERNAME/linux-system-monitor.git
cd linux-system-monitor

Make the script executable:

chmod +x sysmon

Run it:

./sysmon.sh
Example
==============================
     LINUX SYSTEM MONITOR
==============================

Host Name : elessar-VMware-Virtual-Platform
OS : GNU/Linux
Kernel : 6.17.0-41-generic
Uptime : up 1 hour, 22 minutes

CPU Usage : 7%
DISK Usage : 38%
RAM Usage : 17.8%

==============================
     PROCESSES
==============================

Docker : RUNNING :)
ssh : NOT RUNNING :(
Nginx : NOT RUNNING :(

==============================
     HEALTH STATUS
==============================

CPU : OK
DISK : OK
RAM : OK

Overall Status : OK
Purpose

This project was built as a Bash and Linux administration practice project, focusing on command-line tools, shell scripting, system monitoring, variables, command substitution, text processing, and conditional logic.

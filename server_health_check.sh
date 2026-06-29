#!/bin/bash
LOGFILE="/var/log/health_check.log"
echo "======================================" | tee -a $LOGFILE
echo "Server Health Check - $(date)" | tee -a $LOGFILE
echo "======================================" | tee -a $LOGFILE
echo "" | tee -a $LOGFILE
echo "Checking Nginx Service..." | tee -a $LOGFILE
systemctl is-active nginx | tee -a $LOGFILE
echo "" | tee -a $LOGFILE
echo "Checking UFW Firewall..." | tee -a $LOGFILE
ufw status | tee -a $LOGFILE
echo "" | tee -a $LOGFILE
echo "Checking HTTP Response..." | tee -a $LOGFILE
curl -I http://localhost | head -1 | tee -a $LOGFILE
echo "" | tee -a $LOGFILE
echo "Checking Disk Usage..." | tee -a $LOGFILE
df -h | tee -a $LOGFILE
echo "" | tee -a $LOGFILE
echo "Checking Memory Usage..." | tee -a $LOGFILE
free -h | tee -a $LOGFILE
echo "" | tee -a $LOGFILE
echo "Checking Listening Ports..." | tee -a $LOGFILE
ss -tlnp | tee -a $LOGFILE
echo "" | tee -a $LOGFILE
echo "Health Check Completed Successfully." | tee -a $LOGFILE

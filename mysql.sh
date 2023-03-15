#!/bin/bash
# This script checks if MySQL is running or not

# Get the status of MySQL
mysqlStatus=$(systemctl status mysql | grep Active | awk '{print $2}')

# Check if MySQL is running or not
if [ "$mysqlStatus" = "inactive" ]; then
  now=$(date) && echo "is stopped at $now" >> mysql.txt
  service mysql restart
  echo "MySQL is stopped, now restarted."
elif [ "$mysqlStatus" = "failed" ]; then
  now=$(date) && echo "is crashed at $now" >> mysql.txt
  service mysql restart
  echo "MySQL is crashed, now restarted."
else
  echo "MySQL is running."
fi
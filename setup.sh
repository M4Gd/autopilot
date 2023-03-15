#!/bin/sh

mkdir -p /var/cmd/autopilot
cp ./*.sh /var/cmd/autopilot/
rm -f /var/cmd/autopilot/setup.sh

chmod +x /var/cmd/autopilot/*.sh

# get a copy of curent crons
crontab -l > crontabbk
# add new cron jobs
echo "*/1 * * * * cd /var/cmd/autopilot && sh fpm8.sh" >> crontabbk
echo "*/2 * * * * cd /var/cmd/autopilot && sh apache2.sh" >> crontabbk
echo "*/2 * * * * cd /var/cmd/autopilot && sh mysql.sh" >> crontabbk

# install new cron file
crontab crontabbk
rm crontabbk
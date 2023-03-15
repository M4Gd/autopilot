#!/bin/sh

mkdir -p /var/cmd
cp ./*.sh /var/cmd/
chmod +x /var/cmd/*.sh

# get a copy of curent crons
crontab -l > crontabbk
# add new cron jobs
echo "*/1 * * * * cd /var/cmd && sh fpm8.sh" >> crontabbk
echo "*/2 * * * * cd /var/cmd && sh apache2.sh" >> crontabbk
echo "*/2 * * * * cd /var/cmd && sh mysql.sh" >> crontabbk

# install new cron file
crontab crontabbk
rm crontabbk
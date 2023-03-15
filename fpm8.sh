#!/bin/sh

if service php8.0-fpm status | grep running; then
  echo "running .."
else
  service php8.0-fpm restart
  now=$(date) && echo "stopped at $now" >> fpm8.txt
fi
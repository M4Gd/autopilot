#!/bin/sh

if service apache2 status | grep running; then
  echo "running .."
else
  service apache2 restart
  now=$(date) && echo "stopped at $now" >> apache2.txt
fi
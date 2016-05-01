#!/usr/bin/env bash

# test if files exist

if [ -f /var/log/daily.out ]; then
  dStat=$(stat -f "%Sm" -t "%Y-%M-%d %H:%M" /var/log/daily.out)
  echo "Daily file edited on $dStat"
else
  echo -e "\e[31mDaily script has not been run before!\e[39m"
  echo "Please run: sudo periodic daily"
fi

# \e[39m def
# \e[31m red

#! /usr/bin/bash

set -eo pipefail

while true
do
    IFS='' read -r capacity < /sys/class/power_supply/axp20x-battery/capacity
    if test "${capacity}" -eq 100
    then
	capacity=99
    fi
    printf "%s %02d%%\n" "$(date +'%Y-%m-%d%l:%M')" "${capacity}"
    sleep 60
done

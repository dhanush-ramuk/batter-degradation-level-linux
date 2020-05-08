#!/bin/bash


#Made by dhanush on May 8th 2020 to calculate the battery degradation level of your linux system
#My first bash script file.


#BAT0 directory has files that gives the current maximum battery level and maximum battery level when your system was new
cd /sys/class/power_supply/BAT0

#current maximum battery level value
chargeFullCurrent=$(cat charge_full)

#maximum battery level value when your system was new
chargeFullNew=$(cat charge_full_design)

#using bc to do floating division to get the degradation value in percentage
val=`echo "scale=2;$chargeFullCurrent / $chargeFullNew * 100" | bc -l`

echo "Your current maximum battery capacity is at $val percent"

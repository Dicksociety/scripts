#!/bin/bash

#by Dslam edit by Daffy_D

#Use in root

#0.0.1

#Change IP and MAC adress

echo Enter your network interface \(eth0 wlan0 etc...\)
read interface
echo MAC adress is changing...
mac0 = openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//'
ifconfig $interface down
ifconfig $interface hw ether $mac0
echo MAC adress change

echo IP adress is changing...
ip0 = openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//'
ifconfig $interface $ip0
ifconfig $interface up
echo IP adress change

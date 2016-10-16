#!/bin/bash

#Sorry for our english but you can help us to traduct, make a request on github. If you do this we can add your name on the script

#by Daffy_D et Dslam

#Use in root

#0.0.6

#Make some scan on the target's machine

#Be carefull when you use this script because it's illegal and some scan are easily detectable

echo Enter target\'s ip

read ip_target

echo Vuln scan and os detection
nmap --script vuln -O $ip_target -v -oX VulnResult.xml > VulnResult.txt

echo Xmas scan
#Work bad on a windows target
nmap -sX -p- -Pn $ip_target -v -oX XmasResult.xml > XmasResult.txt

echo Null scan
nmap -sN -p- -Pn $ip_target -v -oX NullResult.xml > NullResult.txt

echo Scan UDP
#Easily detectable and very long
nmap -sUV $ip_target -v -oX UDPResult.xml > UDPResult.txt

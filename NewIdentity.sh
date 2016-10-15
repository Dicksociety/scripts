#!/bin/bash

#Développé par Dslam édité par Daffy_D

#A utiliser en root

#0.0.1

#Change l'adresse ip et l'adresse mac

echo Quelle est votre interface reseau \(eth0 wlan0 etc...\)
read interface
echo Changement adresse mac...
mac0 = openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//'
ifconfig $interface down
ifconfig $interface hw ether $mac0
echo Adresse mac changé

echo Changement de l\'adresse ip...
ip0 = openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//'
ifconfig $interface $ip0
ifconfig $interface up
echo Adresse ip changé

#!/bin/bash

#Développé par Dslam édité par Daffy_D

#A utiliser en root

#Change l'adresse ip et l'adresse mac

echo Changement adresse mac...
ifconfig eth0 down 
ifconfig eth0 hw ether #adresse mac

echo Adresse mac changé

echo Changement de l\'adresse ip...
ifconfig eth0 #adresse ip 
ifconfig eth0 up
echo Adresse ip changé:
ifconfig eth0





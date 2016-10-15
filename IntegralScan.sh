#!/bin/bash

#script développé par Daffy_D et Dslam

#A utiliser en root

#0.0.5

#Réalise de nombreux scans sur la machine cible

#A utiliser avec precaution car certains scans sont facilement detectable

echo Entrez l\'ip de la machine cible

read ip_cible
echo Scan TCP
nmap -sS -p- -Pn $ip_cible -oX TCPResult.xml
echo Scan UDP
#Attention plus facilement detectable
nmap -sUV $ip_cible -oX UDPResult.xml
echo Scan Xmas
#Pas très efficace sur une machine windows
nmap -sX -p- -Pn $ip_cible -oX XmasResult.xml
echo Scan Null
nmap -sN -p- -Pn $ip_cible -oX NullResult.xml
echo Scan OS
nmap -o -p- -Pn $ip_cible -oX OSResult.xml
echo Test de vulnérabilité
nmap --script vuln $ip_cible -oX VulnResult.xml

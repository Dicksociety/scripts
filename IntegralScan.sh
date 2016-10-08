#!/bin/bash

#script développé par Daffy_D

#A utiliser en root

#0.0.4

#Réalise de nombreux scans sur la machine cible

#A utiliser avec precaution car certains scans sont facilement detectable, ceci seront notifié et vous pourrez ainsi facilement les commentez

#change  mac
#pour rentrer une foi dans la boucle
a='2'
while [ $a == '2' ]
do
echo Voulez vous changez votre adresse mac \(oui=1 non=0\)?
read macsyn
a=macsyn
if [ $macsyn = '1' ]
then
	 #pour rentrer une foi dans la boucle
	 quoi=0
	while [ $quoi !=  '1' ] || [ $quoi !=  '2' ] #boucle pour recomencer si c'est diferrent de 1 ou 2
	do
		echo 1\)adresse random 
		echo 2\)choix adresse
		read quoi0
		
		quoi=quoi0
	
	
		echo Quelle est votre interface reseau \(eth0 wlan0 etc...\)
		read interface
	
		if [ $quoi = '1' ]
		then
			mac0 = openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//'
			ifconfig $interface down
			ifconfig $interface hw ether $mac0
			ifconfig $interface up
	
		elif [ $quoi = '2' ]
		then
			echo votre nouvelle adresse mac:
			read mac1
			ifconfig $interface down
			ifconfig $interface hw ether $mac1
			ifconfig $interface up
		else
			echo choix compris entre 1 et 2 recommencé
		fi
	
	done
elif [ $macsyn = '0' ]
then
	a=$macsyn
	echo c est risqué de ne pas changer mais c vous le chef!
else
	echo choix 1 ou 0 pas autre chose!!
fi
done


# pareil qu'au dessus mais pour ip
#echo Voulez vous changez votre adresse ip ?
#echo 1)adresse random 
#echo 2)choix adresse

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
echo Test de vulnérabilité
nmap --script vuln $ip_cible -oX VulnResult.xml

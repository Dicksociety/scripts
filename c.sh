echo Entrez l\'ip de la machine cible

read ip_cible

echo Test de vulnérabilité et os
nmap --script vuln -O $ip_cible -v -oX VulnResult.xml > VulnResult.txt

echo Scan Xmas
#Pas très efficace sur une machine windows
nmap -sX -p- -Pn $ip_cible -v -oX XmasResult.xml > XmasResult.txt

echo Scan Null
nmap -sN -p- -Pn $ip_cible -v -oX NullResult.xml > NullResult.txt


echo Scan UDP
#Attention plus facilement detectable
nmap -sUV $ip_cible -v -oX UDPResult.xml > UDPResult.txt

#!/bin/bash

if [[ "$(id -u)" != "0" ]]
then
	echo "Executa aquet script como root"
	exit 1
fi
resposta="y"
while [[ $resposta == 'y' ]]
do
clear

comprova(){
DIR="/mnt/cpseg"
if [ -d "$DIR" ]; then
   echo "'$DIR' el directori existeix....."
else
   echo "Warning: '$DIR' no existeix"
   mkdir $DIR
fi
}

copia(){
    cp /etc/crontab /mnt/cpseg
    cp /etc/hosts /mnt/cpseg
    tar -cvf /mnt/cpseg/backup$(date +"%Y%m%d%H%M").tar.gz /etc/crontab /etc/hosts
    echo "el fitxer s'ha copiat amb exit!"
    ls /mnt/cpseg
    
}

esborra(){
    rm -r /mnt/cpseg/crontab
    rm -r /mnt/cpseg/hosts
    echo "esborrant fitxers ......."
    ls /mnt/cpseg
}

comprova
copia
esborra

exit 0
done

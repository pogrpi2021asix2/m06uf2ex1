#!/bin/bash

if [[ "$(id -u)" != "0" ]]
then
	echo "Executa aquet script como root"
	exit 1
fi

bucle="c"
while [[ $bucle == 'c' ]]
do
	clear

	echo "Servei a deshabilitar: "
	read servei > /dev/null 2>&1

	systemctl disable $servei
	systemctl status $servei --no-pager
	
	echo "Vols continuar(c/altre caracter):"
	read bucle
	
done

exit 10
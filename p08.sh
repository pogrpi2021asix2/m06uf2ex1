#!/bin/bash

resposta="y"
while [[ $resposta == 'y' ]]
do
	clear

	echo "Usuari a eliminar: "
	read user > /dev/null 2>&1
	
	echo "Estas segur? (y/n):"
	read resposta

	userdel -r $user
	
    exit 1
done
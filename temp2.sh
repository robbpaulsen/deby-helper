#!/usr/bin/env bash

NORMAL='\033[0m'
RED='\033[00;31m'
GREEN='\033[00;32m'
YELLOW='\033[00;33m'
BLUE='\033[00;34m'
PURPLE='\033[00;35m'
CYAN='\033[00;36m'
LIGHTGRAY='\033[00;37m'
LRED='\033[01;31m'
LGREEN='\033[01;32m'
LYELLOW='\033[01;33m'
LBLUE='\033[01;34m'
LPURPLE='\033[01;35m'
LCYAN='\033[01;36m'
WHITE='\033[01;37m'
UNDERLINE='\033[04m'

deb_update() {
	sudo apt-get --assume-yes update &&
		sudo apt-get --assume-yes full-upgrade &>/dev/null
}

menu() {
	clear
	while true; do
		echo ""
		echo ""
		echo -e "\n${LBLUE}$1 1[[+]]${NORMAL}${LCYAN} Actualizar Sistema ...${NORMAL}\n"
		echo -e "\n${LBLUE}$2 2[[+]]${NORMAL}${LCYAN} Salir ...${NORMAL}\n"
		echo ""
		echo ""
		read -p "Elige la opcion deseada: " numero
		case $numero in
		1)
			deb_update
			;;
		2)
			exit
			;;
		esac
	done
}
menu

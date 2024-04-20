#!/usr/bin/env bash

#########################################################################################
#########################################################################################
##
## Author:   Robbpaulsen
## GitHub:   github.com/robbpaulsem
##
#########################################################################################
## Author:	Robbpaulsen
## Website:	https://github.com/robbpaulsen
## Email:	ozymandias.1987@protonmail.com
#########################################################################################
##
## Descripcion:
##
## Script for a more unattended, headless setup and configurationg for the basic things
## on any new linux installation.
##
#########################################################################################
#########################################################################################

source ./.assets/colors/colors.sh
source ./.assets/workflow/workflow.sh

deb_update() {
	clear

	tput setaf 3
	echo -e "\nIniciando Actualizacion del Sistema\n"
	tput sgr0
	sudo apt-get --assume-yes update &&
		sudo apt-get --assume-yes full-upgrade

	tput setaf 3
	echo -e "\nFinalizo la Actualizacion del Sistema\n"
	tput sgr0
}

flat_update() {
	clear

	tput setaf 3
	echo -e "\nActualizando Flatpaks\n"
	tput sgr0
	flatpak update --system --assumeyes
}

plangs_update() {
	clear

	cargo liner ship
}

cleanse() {
	clear

	tput setaf 3
	echo -e "\nIniciandi Borrado de Cache y Temproales\n"
	tput sgr0
	sleep 2

	sudo apt-get --assume-yes autoremove &&
		sudo apt-get --assume-yes clean &&
		sudo apt autoclean -y &&
		sudo updatedb &&
		sudo sync
	sleep 2
}

sys_reboot() {
	clear

	tput setaf 2
	echo -e "\nEl Sistema se reiniciara en 5 Segundos\n"
	tput sgr0
	sleep 6
	systemctl reboot
}

exit_script() {
	clear

	tput setaf 8
	echo -e "\n[!] Saliendo ...\n"
	sleep 2
	tput sgr0
	exit
}

menu() {
	clear
	while true; do
		echo ""
		echo ""
		source ./.assets/colors/debian
		echo ""
		echo -e "\n${LBLUE}$1 1 [+]${NORMAL}${LCYAN} Actualizar Sistema ...${NORMAL}\n"
		echo -e "\n${LBLUE}$1 2 [+]${NORMAL}${LCYAN} Actualizar Flatpaks ...${NORMAL}\n"
		echo -e "\n${LBLUE}$2 3 [+]${NORMAL}${LCYAN} Actualizar aplicaciones instaladas con lenguajes de Programacion${NORMAL}\n"
		echo -e "\n${LBLUE}$3 4 [+]${NORMAL}${LCYAN} Borrar Cache de Apt y limpieza general${NORMAL}\n"
		echo -e "\n${LBLUE}$4 5 [+]${NORMAL}${LCYAN} Reiniciar Sistema${NORMAL}\n"
		echo -e "\n${LBLUE}$5 6 [!]${NORMAL}${LCYAN} Salir ...${NORMAL}\n"
		echo ""
		echo ""
		read -p "Elige la opcion deseada: " numero
		case $numero in
		1)
			deb_update
			clear
			;;
		2)
			flat_update
			clear
			;;
		3)
			plangs_update
			clear
			;;
		4)
			cleanse
			clear
			;;
		5)
			sys_reboot
			;;
		6)
			exit_script
			exit
			;;
		esac
	done
}
menu

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

ctrl_c() {
	echo ""
	tput setaf 3
	echo -e "\n\t[!] Saliendo ..."
	tput sgr 0
	exit
}
trap ctrl_c INT

unknown() {
	clear
	echo ""
	tput setaf 1
	echo -e "\n\t[!] No existe esa Opcion, Intentar de Nuevo ...\n"
	tput sgr 0
	sleep 2
}

deb_update() {
	clear
	echo ""
	tput setaf 3
	echo -e "\nIniciando Actualizacion del Sistema\n"
	tput sgr0
	sudo apt-get --assume-yes update &&
		sudo apt-get --assume-yes full-upgrade
	echo ""
	tput setaf 3
	echo -e "\nFinalizo la Actualizacion del Sistema\n"
	tput sgr0
}

flat_update() {
	clear
	echo ""
	tput setaf 3
	echo -e "\nActualizando Flatpaks\n"
	tput sgr0
	flatpak update --system --assumeyes
}

plangs_update() {
	clear
	bash
	cargo liner ship
	sleep 1
}

cleanse() {
	clear
	echo ""
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

one_shotscript() {
	DEEBIAN_FRONTEND="noninteractive"
	DEBIAN_PRIORITY="critical"
	DEBCONF_NOWARNINGS="yes"
	export DEEBIAN_FRONTEND DEBIAN_PRIORITY DEBCONF_NOWARNINGS
	clear
	echo ""
	tput setaf 3
	echo -e "\n\t[+] Si esto no rescata tu sistema la culpa la tiene spooler.exe\n"
	tput sgr 0
	echo ""
	tput setaf 3
	sudo apt --assume-yes update || echo -e "\nNo se pudo actualizar el indice actualizaciones\n"
	sudo dpkg --configure -a || echo -e "\nNo se pudo recuperar de la actualizacion interrumpida\n"
	sudo apt --assume-yes --fix-missing install || echo -e "\nLos conflictos por dependendencias/librerias no se arreglaron\n"
	sudo apt --assume-yes --fix-broken --fix-missing full-upgrade
	sudo apt --assume-yes full-upgrade
	tput sgr 0
}

sys_reboot() {
	clear
	echo ""
	tput setaf 3
	echo -e "\n[!] El Sistema se reiniciara en 5 Segundos\n"
	tput sgr0
	sleep 6
	systemctl reboot
}

exit_script() {
	clear
	tput setaf 3
	echo -e "\n[!] Saliendo ...\n"
	sleep 1
	tput sgr0
	exit
}

menu() {
	clear
	while true; do
		echo ""
		source ./.assets/colors/debian
		echo ""
		echo -e "\n${LBLUE}$1 1 [+]${NORMAL}${LCYAN} Actualizar Sistema ...${NORMAL}\n"
		echo -e "\n${LBLUE}$1 2 [+]${NORMAL}${LCYAN} Actualizar Flatpaks ...${NORMAL}\n"
		echo -e "\n${LBLUE}$2 3 [+]${NORMAL}${LCYAN} Actualizar aplicaciones instaladas con lenguajes de Programacion${NORMAL}\n"
		echo -e "\n${LBLUE}$3 4 [+]${NORMAL}${LCYAN} OneShot para salvar tu Sistema${NORMAL}\n"
		echo -e "\n${LBLUE}$3 5 [+]${NORMAL}${LCYAN} Borrar Cache de Apt y limpieza general${NORMAL}\n"
		echo -e "\n${LBLUE}$4 6 [+]${NORMAL}${LCYAN} Reiniciar Sistema${NORMAL}\n"
		echo -e "\n${LBLUE}$5 7 [!]${NORMAL}${LCYAN} Salir ...${NORMAL}\n"
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
			one_shotscript
			;;
		5)
			cleanse
			clear
			;;
		6)
			sys_reboot
			;;
		7)
			exit_script
			exit
			;;
		*)
			unknown
			;;
		esac
	done
}
menu

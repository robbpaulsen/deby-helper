#!/usr/bin/env bash

source ../colors/colors.sh

trap ctrl_c INT

ctrl_c() {
	echo -e "\n\t${LYELLOW}[!!]${NORMAL}${YELLOW} Saliendo ...!${NORMAL}\n"
	exit &>/dev/null
}

#!/usr/bin/env bash
#
# scp-remoto.sh - Transfer file to remote servers
#
# Autor:  Renato Alexandre da Rocha
# E-mail: renato.alexandre.da.rocha1@ibm.com / ralex.sbc@hotmail.com
#
# --------------------------------------------------------------------------------------- #
#  Transfer files to remote servers added in a list
#
#  Examples:
#      $ ./scp-remoto.sh
# --------------------------------------------------------------------------------------- #
# Histórico:
#
#   v1.0 03/07/2022, Renato Alexandre da Rocha:
#       - Script developed
# --------------------------------------------------------------------------------------- #
# Tested in:
# 	RedHat Enterprise Linux Server 7.9
# 	Suse Linux Enterprise Server 12.5
# --------------------------------------------------------------------------------------- #
#
# ------------------------------- VARIABLES ------------------------------------------------------- #
_SERVER_LIST=server_list.txt
_REMOTE_USER=
_REMOTE_DIR=/tmp
_FILE_NAME=
_GREEN_COLOR="\033[32;1m"
_RED_COLOR="\033[31;1m"
_RESET_COLOR="\033[0m"
_VERSION="v1.0"
# --------------------------------------------------------------------------------------- #
#
# ------------------------------- VALIDATIONS ----------------------------------------------------- #

# server_list.txt exist?
[ ! -f $_SERVER_LIST ] && echo -e "${_RED_COLOR}ERROR.:${_RESET_COLOR} File $_SERVER_LIST don't exit. Please contact the System Admin." && exit 1

# server_list.txt has read permission?
[ ! -r $_SERVER_LIST ] && echo -e "${_RED_COLOR}ERROR.:${_RESET_COLOR} File $_SERVER_LIST does haven't read permission. Please contact the System Admin." && exit 1

# server_list.txt is empty?
[ ! -s $_SERVER_LIST ] && echo -e "${_RED_COLOR}ERROR.:${_RESET_COLOR} File $_SERVER_LIST is empty. Please contact the System Admin." && exit 1

# --------------------------------------------------------------------------------------- #
#
# ------------------------------- FUNCTIONS ------------------------------------------------------- #

welcome_message () {
	echo
	echo "######################################################################################"
	echo "#"
	echo "# SCP Remote Transfer - Transfer file to remover servers"
	echo "# "
	echo "# Version: $_VERSION"
	echo "#"
	echo "######################################################################################"
	echo
}

user_input () {

	clear
	welcome_message

	echo "Inform the file name (with full path) of file to transfer: "
	read _FILE_NAME
	echo
	echo "Inform the remote user id: "
	read _REMOTE_USER
	echo
	echo "By default, the file will be transferred to /tmp in the remote server."
        sleep 2
	echo

	file_exist
}

file_exist () {

	if [ -f $_FILE_NAME ]
	then
		echo "Starting file transfer to remote servers"
		echo
		sleep 2
		file_transfer
	else
		echo -e "${_RED_COLOR}ERROR.:${_RESET_COLOR} File $_FILE_NAME don't exit. Please inform the file name again"
		sleep 3
		user_input
	fi		

}

file_transfer () {

	while read _SERVER
	do
		echo "Server: $_SERVER"
		scp -o 'StrictHostKeyChecking no' $_FILE_NAME $_REMOTE_USER@$_SERVER:$_REMOTE_DIR
		if [ $? -eq 0 ];
		then
			echo -e "${_GREEN_COLOR}SUCCESS.:${_RESET_COLOR} File $_FILE_NAME transferred successfully to $_SERVER"
			echo
		else
			echo -e "${_RED_COLOR}ERROR.:${_RESET_COLOR} File $_FILE_NAME wasn't transferred. Please contact the System Admin."
			echo
		fi
	done < $_SERVER_LIST

}

help_message () {

	[ $1 = "-h" ] || [ $1 = "--help" ] && echo "\
	 teste

	"
}

# --------------------------------------------------------------------------------------- #
#
# ------------------------------- EXECUTION ------------------------------------------------------- #

user_input

# --------------------------------------------------------------------------------------- #


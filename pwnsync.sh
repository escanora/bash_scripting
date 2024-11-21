Help() {

	BLUE="\e[34m"
	ENDCOLOR="\e[0m"

	echo "Usage : pwnsync [OPTION]"
	echo "File synchronization between remote server and local folder"
	echo
	echo -e "${BLUE}Options :${ENDCOLOR}"
	echo "--src <path> 		specify the local source directory"
	echo "--dest <path> 		specify the remote source directory"
	echo "--deploy  		synchronize file from local to remote (no delete)"
	echo "--daemon  		enable automatic synch monitoring"
	echo "--help (-h)  		display the help and exit"

}

if [[ "--help" == "$1" || "-h" == "$1" ]]; then
	Help
	exit
fi

if [[ "--deploy" == "$1" && "--src" == "$2" && "--dest" == "$4" ]]; then
	rsync -azvp -e "ssh -i /home/esca/.ssh/id_ed25519" $3 $5:$6
elif [[ "--deploy" == "$1" && "--dest" == "$2" && "--src" == "$5" ]]; then
	rsync -azvp -e "ssh -i /home/esca/.ssh/id_ed25519"  $3:$4 $6
fi
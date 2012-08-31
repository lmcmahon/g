CCD_DICTIONARY_PATH="/home/liam/Documents/code/ccd/dictionary.txt"

function ccd() {
    if [[ $1 == "add" ]]; then
	#$2 is the name to give to the current directory
	echo "$2 $(pwd)" >> $CCD_DICTIONARY_PATH
    elif [[ $1 == "--help" || $1 == "help" ]]; then
	echo "Usage: "
	echo "ccd add [shortcut]"
	echo "    creates a ccd shortcut for the current directory"
	echo "ccd [shortcut]"
	echo "    cds to the directory for the specified shortcut"
	echo "ccd list"
	echo "    prints the mapping of shortcuts to directories"
    elif [[ $1 == "list" || $1 == "--list" ]]; then
	cat $CCD_DICTIONARY_PATH
    else
        #$1 is the destination name
	temp0="^$1 "
	temp1=("$(grep $temp0 /home/liam/Documents/code/ccd/dictionary.txt)")

	temp2=($temp1)
	cd ${temp2[1]}
    fi
}

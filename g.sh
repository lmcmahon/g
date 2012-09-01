## We keep the mappings of shortcuts to directories in this file.
## It has one mapping per line, and each line is in the format
## "<shortcut> <directory path>". Theres actually no need to keep
## this file in the same place as the dictionary if you want to put
## it somewhere else.
G_DICTIONARY_PATH="/home/$USER/Documents/code/g/dictionary.txt"

## This is implemented as a function rather than a script since
## running a script would fork a new process, so we couldn't change
## the original shell's environment. Since thats the whole point,
## we do it as a build in function in the original shell.

function g() {
    if [[ $1 == "add" ]]; then
	#$2 is the name to give to the current directory
	echo "$2 $(pwd)" >> $G_DICTIONARY_PATH
    elif [[ $1 == "--help" || $1 == "help" ]]; then
	echo "Usage: "
	echo "g add [shortcut]"
	echo "    creates a g shortcut for the current directory"
	echo "g [shortcut]"
	echo "    cds to the directory for the specified shortcut"
	echo "g list"
	echo "    prints the mapping of shortcuts to directories"
    elif [[ $1 == "list" || $1 == "--list" ]]; then
	cat $G_DICTIONARY_PATH
    else
        #$1 is the destination name
	temp1=("$(grep ^$1 $G_DICTIONARY_PATH)")

	temp2=($temp1)
	cd ${temp2[1]}
    fi
}

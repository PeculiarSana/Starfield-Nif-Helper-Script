#!/bin/bash

# CHANGE THIS V
STARFIELD_DATA="D:\Games\Steam\steamapps\common\Starfield\Data"



usage() {
 echo "Usage: $0 [OPTIONS]"
 echo " $0              The directory of extracted .nif files to loop through."
 echo "Options:"
 echo " -h, --help      Display this help message"
 echo " -t, --text      Scan through a txt file instead of a directory. Takes the txt file name as a paramter"
}

has_argument() {
    [[ ("$1" == *=* && -n ${1#*=}) || ( ! -z "$2" && "$2" != -*)  ]];
}


extract_argument() {
  echo "${2:-${1#*=}}"
}


while [ $# -gt 0 ]; do
	case $1 in
		-h | --help)
			usage
			exit
			;;
		-t | --text*)
			if ! has_argument $@; then
				echo "File not specified." >&2
				exit 1
			fi
			
			File=./$(extract_argument $@)
			Lines=$(cat $File)
			for LINE in $Lines
			do
				LINE=${LINE//$'\r'}
				echo "Processing $LINE"
				s=${LINE##*/}
				if [ ! -d ./converted ]; then
					mkdir -p ./converted;
				fi
				./nif_info.exe -obj "$STARFIELD_DATA" "${LINE##*/}" > ./converted/${s%.nif}.obj
			done
			exit
			;;
		*)
			dir=$1
			for FILE in "$dir"/*.nif
			do 
				echo "Processing ${FILE##*/}"
				s=${FILE##*/}
				if [ ! -d ./converted ]; then
					mkdir -p ./converted;
				fi
				./nif_info.exe -obj "$STARFIELD_DATA" "${FILE##*/}" > ./converted/${s%.nif}.obj
			done
			exit
			;;
	esac
done

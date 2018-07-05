#!/usr/bin/env bash

# The master list of your AV processes
av_list="./av_master.txt"

# Store user input under a more readable name
tasklist="${1}"

# Vars to hold the color formatting
Red='\033[0;31m'
NoClr='\033[0m'

function usage(){
	echo "[!] Script takes one (1) argument, a file containg the output of a Windows 'tasklist' command."
	exit 1
}

# Check if an argument is supplied and bail out if not.
if [ $# -ne 1 ]; then
	usage
fi

cat "${tasklist}" | while read current_line
do
	# All entires in the AV master list are a single string with no white space, so that's all I care about.
	process=`printf "${current_line}" | awk '{print $1}'`
	match=`grep -i "${process}" "${av_list}"`
	if [ $? -eq 0 ]; then
		match=`printf "${match}"`
		echo -e "${Red}[+] ${match}${NoClr} matched with ${process}"
	else
		echo "[-] ${process}"
	fi
done

#!/usr/bin/env bash

# The master list of your AV processes
av_list="./av_master.txt"

# Specify the file to parse.
#tasklist="./sample_tasklist.txt"
# Can use a command line argument instead. Comment the var above and uncomment this one.
tasklist="${1}"

# Vars to hold the color formatting
Red='\033[0;31m'
NoClr='\033[0m'

cat "${tasklist}" | while read current_line
do
	process=`printf "${current_line}" | awk '{print $1}'`
	match=`grep -i "${process}" "${av_list}"`
	if [ $? -eq 0 ]; then
		match=`printf "${match}"`
		echo -e "${Red}[+] ${match}${NoClr} matched with ${process}"
	else
		echo "[-] ${process}"
	fi
done

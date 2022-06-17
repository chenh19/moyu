#!/bin/bash
# This script clearly does nothing

# set terminal font color
TEXT_YELLOW='\e[1;33m'
TEXT_GREEN='\e[1;32m'
TEXT_RESET='\e[0m'

unset scripturl
echo -e " \n"
read -p "$(echo -e $TEXT_YELLOW'Please specify an online script to moyu: '$TEXT_RESET)"$' \n' scripturl
echo $scripturl
wget -O ~/.moyu.txt $scripturl

unset runningmin
until [[ $runningmin == +([0-9]) ]] ; do
    read -r -p "$(echo -e $TEXT_YELLOW'Please specify a time duration to moyu (minutes): '$TEXT_RESET)"$' \n' runningmin
done
endtime=$(( $(date +%M) + $runningmin ))

while [ $(date +%M) -lt $endtime ]; do
    echo -e " \n${TEXT_YELLOW}Proceeding to the next step... ${TEXT_RESET}"$' \n' && sleep 3
    while read line; do echo $line && sleep 0.05; done < ~/.moyu.txt
    echo -e " \n${TEXT_GREEN}Step finished! ${TEXT_RESET}"$' \n' && sleep 3
done

rm ~/.moyu.txt
echo -e " \n${TEXT_YELLOW}Finalizing and exporting results... ${TEXT_RESET} \n" && sleep 15
echo -e " \n${TEXT_GREEN}All done! ${TEXT_RESET} \n" && sleep 0.3

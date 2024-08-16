#!/bin/bash
# This script clearly does nothing

# set terminal font color
TEXT_YELLOW='\e[1;33m'
TEXT_GREEN='\e[1;32m'
TEXT_RESET='\e[0m'

# get a script URL
echo ""
unset scripturl
until [[ "$scripturl" == *git* ]] ; do
    read -p "$(echo -e $TEXT_YELLOW'Please specify a github script to moyu: '$TEXT_RESET)"$' \n' scripturl
done
echo ""
curl $scripturl -o ~/.moyu.txt

# get running time
unset runningmin
until [[ $runningmin == +([0-9]) ]] ; do
    read -r -p "$(echo -e $TEXT_YELLOW'Please specify a time duration to moyu (minutes): '$TEXT_RESET)"$' \n' runningmin
done

# run
endtime=$(( $(date +%M) + $runningmin ))
while [ $(date +%M) -lt $endtime ]; do
    echo -e " \n${TEXT_YELLOW}Proceeding to the next step... ${TEXT_RESET}"$' \n' && sleep 3
    while read line; do echo $line && sleep 0.05; done < ~/.moyu.txt
    echo -e " \n${TEXT_GREEN}Finished! ${TEXT_RESET}"$' \n' && sleep 3
done

# cleanup and exit
rm ~/.moyu.txt
echo -e " \n${TEXT_YELLOW}Finalizing and exporting results... ${TEXT_RESET} \n" && sleep 15
echo -e " \n${TEXT_GREEN}All done! ${TEXT_RESET} \n" && sleep 0.3

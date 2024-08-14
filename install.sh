#!/bin/bash
#date 			:	220
#author			:	batan
#description		:	the script moves lc-cd-cuts-list and lc-cd-cuts-global-echo to /usr/bin/ and
#				assigns appropriate permissions.
#			:	It then moves a list of directories to $HOME/.lc-cd
#			:	and modifies the bashrc ### only if needed!!
#			:	Removes clutter and exits
#---------------------------------------------------------------------------------------#
clear
sudo mv /home/$USER/lc-cd/lc-cd-cuts-list /usr/bin/
sudo mv /home/$USER/lc-cd/lc-cd-cuts-global-echo /usr/bin/
sudo chmod a+x /usr/bin/lc-cd-cuts-list
sudo chmod a+x /usr/bin/lc-cd-cuts-global-echo
sudo mv /home/$USER/lc-cd/lc-cd /home/$USER/.lc-cd
clear
abc=$(cat /home/$USER/.bashrc|grep "# TEST #")
if [[ -z "$abc" ]]; then
cat /home/$USER/lc-cd/echo_bashrc >> /home/$USER/.bashrc
else
clear
echo -e "\033[32mYour \033[31mbashrc\033[32m has been already modified\033[0m"
fi
read -e -p 'remove the klutter?   >>>   Y/N ' -i 'Y' bcd
if [[ "$bcd" == Y ]]; then
sudo trash /home/$USER/lc-cd/
clear
echo -e "DONE"
exit 0
else
exit 0
fi

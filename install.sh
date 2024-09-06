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
sudo mv /home/batan/lc-cd/lc-cd-cuts-list /usr/bin/
sudo mv /home/batan/lc-cd/lc-cd-cuts-global-echo /usr/bin/
sudo chmod a+x /usr/bin/lc-cd-cuts-list
sudo chmod a+x /usr/bin/lc-cd-cuts-global-echo
sudo mv /home/batan/lc-cd/lc-cd /home/batan/.lc-cd
clear
abc=$(cat /home/batan/.bashrc.aliases|grep "# TEST #")
if [[ -z "$abc" ]]; then
cat /home/batan/lc-cd/echo_bashrc >> /home/batan/.bashrc.aliases
sudo trash /home/batan/lc-cd
clear
echo -e "\033[47mScript run Succesfully\033[0m"
echo -e "Modified \033[31m.bashrc.aliases\033[0m"
echo -e "Moved \033[31mlc-cd-cuts-list \033[0mto\033[31m/usr/bin/ \033[0m "
echo -e "Moved \033[31mlc-cd-cuts-global-echo \033[0mto \033[31m /usr/bin/ \033[0m"
echo -e "Moved \033[31mlc-cd \033[0mto \033[31m $HOME \033[0m"
read -n1 -p "Enter [ANY] to exit..." lol
exit 0
else
clear
echo -e "\033[47mScript run Succesfully\033[0m"
echo -e "\033[32mYour \033[31m.bashrc.aliases \033[32m has been already modified\033[0m"
echo -e "Moved \033[31mlc-cd-cuts-list \033[0mto\033[31m/usr/bin/ \033[0m "
echo -e "Moved \033[31mlc-cd-cuts-global-echo \033[0mto \033[31m /usr/bin/ \033[0m"
echo -e "Moved \033[31mlc-cd \033[0mto \033[31m $HOME \033[0m"
read -n1 -p "Enter [ANY] to exit..." lol
fi

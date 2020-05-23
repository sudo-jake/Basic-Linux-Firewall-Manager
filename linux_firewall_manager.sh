#!/bin/bash

#---------------------------------#
# Linux Firewall Manager 0.1      #
# Created by                      #
# Jacob Silva                     #
#---------------------------------#

clear

# For While loop
loop="0"

# While Loop
while [ $loop -ne "1" ]
do

 # Function that allows traffic
 function allow {
 clear
 read -p "Please type the port or service name you want to allow: " portallow
 sudo ufw allow $portallow
 }

 # Function that denies traffic
 function deny {
 clear
 read -p "Please type the port or service name you want to deny: " portdeny
 sudo ufw deny $portdeny
 }

clear
echo "Welcome to Linux Firewall Manager 0.1"
echo
echo "1) Manage Rules"
echo "2) View Firewall Status"
echo "3) Reset Firewall"
echo "4) Install and Setup Dependencies"
echo "5) Quit"
echo
read -p "Please select your option: " option

 # First if statement to Allow or Deny Traffic
 if [ $option =  1 ]
 then
    clear
    read -p "Allow or Deny Incoming/Outgoing Connections (Allow|Deny): " AllowDeny
    # Case Statement 
    case $AllowDeny in
         Allow|allow ) allow;;
        Deny|deny ) deny;;
    esac
    continue
 fi

 # Second if statement to check Firewall Status
 if [ $option =  2 ]
  then
    clear
    sudo ufw status
    read -p "Press Enter to Return to Menu. "
    continue
 fi

 # Third if statement to reset firewall
 if [ $option =  3 ]
 then
    clear
    ufw reset
    read -p "Press Enter to Return to Menu. "
    sudo ufw enable
 fi

 # Fourth if statement to install dependencies
 if [ $option =  4 ]
 then
    clear
    sudo apt-get update
    sudo apt-get install ufw
    ufw enable

 fi

 # Fifth if statement to break loop
 if [ $option =  5 ]
 then
    clear
    break 
 fi

done
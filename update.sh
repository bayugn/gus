#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.co);
IZIN=$( curl https://github.com/ohhmaigot/setupid/ipvps.conf | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo -e "${green}Permission Accepted...${NC}"
else
echo -e "${red}Permission Denied!${NC}";
echo "Please Contact Admin"
echo "Telegram t.me/bosok69"
rm -f setup.sh
exit 0
fi
versi=$(cat /home/ver)
if [[ $versi == 1.2 ]]; then
echo "You Have The Latest Version"
exit 0
fi
echo "Start Update"
cd /usr/bin
wget -O menu "https://github.com/ohhmaigot/setupid/menu.sh"
wget -O usernew "https://github.com/ohhmaigot/setupid/usernew.sh"
wget -O trial "https://github.com/ohhmaigot/setupid/trial.sh"
wget -O change-port "https://github.com/ohhmaigot/setupid/change.sh"
wget -O port-ovpn "https://github.com/ohhmaigot/setupid/port-ovpn.sh"
wget -O port-ssl "https://github.com/ohhmaigot/setupid/port-ssl.sh"
wget -O port-wg "https://github.com/ohhmaigot/setupid/port-wg.sh"
wget -O port-tr "https://github.com/ohhmaigot/setupid/port-tr.sh"
wget -O port-sstp "https://github.com/ohhmaigot/setupid/port-sstp.sh"
wget -O port-squid "https://github.com/ohhmaigot/setupid/port-squid.sh"
wget -O port-ws "https://github.com/ohhmaigot/setupid/port-ws.sh"
wget -O port-vless "https://github.com/ohhmaigot/setupid/port-vless.sh"
wget -O wbmn "https://github.com/ohhmaigot/setupid/webmin.sh"
wget -O xp "https://github.com/ohhmaigot/setupid/xp.sh"
wget -O limit-speed "https://github.com/ohhmaigot/setupid/limit-speed.sh"
wget -O add-sstp "https://github.com/ohhmaigot/setupid/add-sstp.sh"
wget -O add-ws "https://github.com/ohhmaigot/setupid/add-ws.sh"
wget -O add-vless "https://github.com/ohhmaigot/setupid/add-vless.sh"
wget -O add-tr "https://github.com/ohhmaigot/setupid/add-tr.sh"
chmod +x change-port
chmod +x port-ovpn
chmod +x port-ssl
chmod +x port-wg
chmod +x port-sstp
chmod +x port-tr
chmod +x port-squid
chmod +x port-ws
chmod +x port-vless
chmod +x wbmn
chmod +x xp
chmod +x limit-speed
echo "0 0 * * * root clear-log && reboot" > /etc/crontab
echo "0 0 * * * root xp" > /etc/crontab
cd
echo "1.2" > /home/ver
clear
echo " Fix minor Bugs"
echo " Now You Can Change Port Of Some Services"
echo " Reboot 5 Sec"
sleep 5
rm -f update.sh
reboot

termux-setup-storage
yes "" | pkg upgrade -y
yes "" | pkg install openssh ffmpeg htop -y
user=$(whoami)
ip_addr=$(ifconfig | grep 'inet 192' | awk '{print $2}')
sshd
echo "ssh service restarted"
echo "1. Change password first using command 'passwd'"
printf "2. Then login via SSH by the cmd below:\n   ssh $user@$ip_addr -p8022"
echo ""
read -p "Script paused. \nNext part of this script will attempt to install pubkey on remote (Termux) machine.\nReady? Press enter to continue..." </dev/tty

read -p "Please generate ssh-keygen from your host machine (where to connect to). Command:\n\nssh-keygen -t rsa -b 2048 -f id_rsa\n\nHost machine id_rsa: " id_rsa_host </dev/tty

ssh-copy-id -p 8022 -i $id_rsa_host $ip_addr

printf "\n\nSuccess! Try login via SSH by the cmd below:\n   ssh $user@$ip_addr -p8022\nIt should not prompt for password, means success."
echo "Input password for SSH Login later on:"
termux-setup-storage
yes "" | pkg upgrade -y
yes "" | pkg install openssh ffmpeg htop -y
user=$(whoami)
ip_addr=$(ifconfig | grep 'inet 192' | awk '{print $2}')
sshd
echo "ssh service restarted"
echo "1. Change password first using command 'passwd'"
printf "2. Then login via SSH by\n  $user@$ip_addr -p8022"
echo ""
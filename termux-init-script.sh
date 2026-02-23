echo "Input password for SSH Login later on:" && \
passwd && \
termux-setup-storage && \
yes "" | pkg upgrade -y && \
yes "" | pkg install openssh iproute2 ffmpeg -y && \
user=whoami && \
ip_addr=$(ip -4 addr show dev wlan0 2>/dev/null | awk '/inet/ {print $2}' | cut -d/ -f1) && \
sshd && \
echo "ssh service restarted" && \
printf "login via ssh by\n $user@$ip_addr -p8022"
yes "" | pkg upgrade -y && \
yes "" | pkg install openssh iproute2 ffmpeg -y && \
user=whoami && \
ip_addr=$(ip -4 addr show dev wlan0 2>/dev/null | awk '/inet/ {print $2}' | cut -d/ -f1) && \
passwd && \
sshd && \
echo ssh service restarted && \
echo "login via ssh by\n $user@$ip_addr -p8022"
echo "Set SSH login password for the current user"
user=$(whoami)

while true; do
	read -s -p "Enter new password: " PW
	echo
	read -s -p "Confirm new password: " PW2
	echo
	[ "$PW" = "$PW2" ] && break
	echo "Passwords do not match. Try again."
done

# Try chpasswd if available (non-interactive)
if command -v chpasswd >/dev/null 2>&1; then
	echo "$user:$PW" | chpasswd
else
	# Fallback: attempt to feed the password to passwd; if passwd reads /dev/tty this may fail
	if printf "%s\n%s\n" "$PW" "$PW" | passwd "$user" 2>/dev/null; then
		true
	else
		echo "Could not set the password automatically. Please run 'passwd' manually now."
		passwd
	fi
fi

termux-setup-storage
yes "" | pkg upgrade -y
yes "" | pkg install openssh iproute2 ffmpeg -y

ip_addr=$(ip -4 addr show dev wlan0 2>/dev/null | awk '/inet/ {print $2}' | cut -d/ -f1)
sshd
echo "ssh service restarted"
printf "login via ssh by\n $user@$ip_addr -p8022"
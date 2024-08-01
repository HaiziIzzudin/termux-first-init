# termux-first-init
Just installed termux fresh? Here's some guide before you get started on using termux.

# 1. Installing termux
[here](https://github.com/termux/termux-app/releases)

# 2. change repo
```bash
termux-change-repo
```

# 3. Install openssh and setup for ssh
```bash
pkg upgrade -y && \
pkg install openssh -y && \
passwd && \
whoami && \
ifconfig && \
sshd
```
On your pc, please enter your ssh command like so: 
```bash
ssh <username>@<lan_ip_addr> -p8022
```

Select mirror group, and the one on europe.

# 4. Once entered, install tmux
```bash
pkg upgrade && \
pkg install tmux -y && \
tmux
```

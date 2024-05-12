# termux-first-init
Just installed termux fresh? Here's some guide before you get started on using termux.

# 1. Installing termux
[here](https://github.com/termux/termux-app/releases)

# 2. Install openssh and setup for ssh
```bash
pkg upgrade && \
pkg install openssh -y && \
passwd && \
whoami && \
ifconfig
```
On your pc, please enter your ssh command like so: 
```bash
ssh <username>@<lan_ip_addr> -p8022
```

# 3. Optimizing termux
Please enter commands below in order:
```bash
pkg upgrade && \
termux-change-repo
```
Select mirror group, and the one on europe.

# 4. Once entered, install tmux
```bash
pkg upgrade && \
pkg install tmux -y && \
tmux
```

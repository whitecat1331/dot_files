terminate='&> /dev/null&'
browser='brave-browser'
alias aliases='sudo nvim ${HOME}/.bash_aliases'
alias cherrytree='cherrytree > /dev/null 2> /dev/null&'
#alias vb='virtualbox &> /dev/null&'
alias pytest='python3 -m unittest'
alias pytestd='python3 -m unittest discover'
alias pyserver="sudo -- sh -c 'ifconfig && python -m http.server 80'"
alias vmnet='sudo vmware-netcfg'
alias fe='xdg-open .'
alias thm="${browser} tryhackme.com ${terminate}"
alias htb="${browser} hackthebox.com ${terminate}"
alias paliases='cat ~/.bash_aliases'
alias burpsuite='/opt/BurpSuiteCommunity/BurpSuiteCommunity'
alias sdn='shutdown now'
alias python='python3'
alias phpserver='php -S localhost:1234'
alias python='python3'
alias rm='trash -v'
alias evim="cd ~/.config/lvim/"
alias chrome="silence_command 'google-chrome' '$1'"
alias ff="silence_command 'firefox' '$1'"
# alias brave="silence_command 'brave-browser' '$1'"
alias bat='batcat'

silence_command() {
	if [ -z "$2" ]
	then 
	  "$1" &> /dev/null &
	else
	  "$1" &> /dev/null &
	fi
}

fprocess() {
	ps -aux | grep $1
}

listen() {
	sudo ifconfig && sudo nc -nvlp $1
}

lscan() {
	sudo arp-scan -I $1 -l
}

chdir() {
  if [ ! -d $1 ]; then
    mkdir "$1"
  fi
  cd "$1"
}

rh() {
	export rhost=$1
}

lh() {
	export lhost=`ip -f inet addr show $1 | sed -En -e 's/.*inet ([0-9.]+).*/\1/p'` && echo $lhost;
}

vm() {
	if [ -z "$1" ] 
	then 
		vmware &> /dev/null&
	else
		for i in `seq $1`; do vmware &> /dev/null& done
	fi
}

# setxkbmap -option "caps:swapescape"
# xmodmap -e "clear Lock"
# xmodmap -e "keycode 9 = Caps_Lock NoSymbol Caps_Lock"   #this will make Esc to act as Caps Lock
# xmodmap -e "keycode 66 = Escape NoSymbol Escape"        #this will make Caps Lock to act as Esc
set -o vi
# set terminal to display working directory
export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
[[ -s /usr/share/autojump/autojump.sh ]] && source /usr/share/autojump/autojump.sh
# [[ -d /home/$USER/.cargo ]] &&  export PATH=/home/$USER/.cargo/bin:$PATH
# [[ -s $HOME/bin/start_tmux.sh ]] && source $HOME/bin/start_tmux.sh
bind -x '"\C-l": clear'
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

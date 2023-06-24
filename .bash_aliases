terminate='&> /dev/null&'
browser='brave-browser'
alias aliases='sudo nvim ${HOME}/.bash_aliases'
alias cherrytree='cherrytree > /dev/null 2> /dev/null&'
alias pytest='python3 -m unittest'
alias pytestd='python3 -m unittest discover'
alias pyserver="sudo -- sh -c 'ifconfig && python -m http.server 80'"
alias vmnet='sudo vmware-netcfg'
alias fe='xdg-open .'
alias paliases='cat ~/.bash_aliases'
alias sdn='shutdown now'
alias python='python3'
alias mgdrive="$(which google-drive-ocamlfuse) ~/googledrive"
alias ugdrive="$(which fusermount) ~/googledrive"
alias python='python3'
alias rm='trash -v'
alias cat="/usr/bin/batcat"
alias zoom="zoom $terminate"
alias picdump="cp -r ~/Pictures/Screenshots/* Screenshots/"
alias malinit="cp -r $HOME/.Malware_Analysis/Template/* ."
alias xclip='xclip -selection clipboard'

mkdir() {
  if [ ! -d $1 ]; then
    /usr/bin/mkdir "$1"
  fi
  cd "$1"
}

rh() {
	export rhost=$1
}

lh() {
	export lhost=`ip -f inet addr show $1 | sed -En -e 's/.*inet ([0-9.]+).*/\1/p'` && echo $lhost;
}

_copy(){
    cat | xclip -selection clipboard
}

_paste(){
    xclip -selection clipboard -o
}

# Use Gnome tweaks to swap caps::esc
set -o vi
# set terminal to display working directory
export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
[[ -s /usr/share/autojump/autojump.sh ]] && source /usr/share/autojump/autojump.sh
[[ -d /home/$USER/.cargo ]] &&  export PATH=/home/$USER/.cargo/bin:$PATH
bind -x '"\C-l": clear'
export PATH="$HOME/Development/python/bin:$HOME/bin:$HOME/.local/bin:$PATH"

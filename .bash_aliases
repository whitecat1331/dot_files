terminate='&> /dev/null&'
browser='brave-browser'
alias fsu='sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y'
alias aliases='nvim ${HOME}/.bash_aliases'
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
alias rm='trash -v'
alias cat="/usr/bin/batcat"
alias zoom="zoom $terminate"
alias picdump="cp -r ~/Pictures/Screenshots/* Screenshots/"
alias malinit="cp -r $HOME/.Malware_Analysis/Template/* ."
alias xclip='xclip -selection clipboard'

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

# xfreerdp(){ 
#   sudo xfreerdp /v:$1 /u:$2 /p:$3 /cert:ignore +clipboard /dynamic-resolution &> /dev/null &
# }

gorename(){
    reg="s/$1/$2/g"
    grep -rl $1 * | xargs sed -i $reg
}

# Use Gnome tweaks to swap caps::esc
set -o vi
# set terminal to display working directory
export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
[[ -s /usr/share/autojump/autojump.sh ]] && source /usr/share/autojump/autojump.sh
[[ -d /home/$USER/.cargo ]] &&  export PATH=/home/$USER/.cargo/bin:$PATH
[[ -f ~/.keys ]] && source ~/.keys
bind -x '"\C-L": clear'
# set default editor to nvim
export VISUAL="vim"
export EDITOR="vim"
# add go to path
export GOPATH=$HOME/go
export PATH="$PATH:$GOPATH/bin"
export PATH=$PATH:/usr/local/go/bin
# add python to path
export PATH="$HOME/Development/python/bin:$HOME/bin:$HOME/.local/bin:$PATH"
# add rust to path
export PATH="$PATH:~/.cargo/bin"
# add nvim to path
export PATH="$PATH:/opt/nvim-linux64/bin"
# fix history mismatch with split
export PROMPT_COMMAND='history -a; history -r'
# start tmux session
[[ $TERM != "screen" ]] && exec tmux new-session -A -s main

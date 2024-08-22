#!/bin/bash

# ensure root
if [ "$EUID" != 0 ] 
then 
  echo "Please run as root"
  exit
fi

# disable sudo password
echo "%sudo ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers

# change home path to sudo user that called this script
if [ -n "$SUDO_USER" ] ; then HOME="/home/$SUDO_USER" ; fi

# link config files
ln -s ~/dot_files/.bash_aliases ~/.bash_aliases

# source ~/.bash_aliases

# update and upgrade
apt update && apt upgrade -y

# install google-chrome
wget -qP ~/Downloads https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
chmod +x ~/Downloads/google-chrome-stable_current_amd64.deb
apt install -y ~/Downloads/google-chrome-stable_current_amd64.deb
rm -f ~/Downloads/google-chrome-stable_current_amd64.deb

# install apt packages
declare -a apt_packages=$(sed -z 's/\n/ /g' apt_packages.txt)

apt install --allow-downgrades -y ${apt_packages[@]}

# packages setup

# TLDR setup
mkdir -p ~/.local/share/tldr
git clone https://github.com/tldr-pages/tldr ~/.local/share/tldr

# Install languages
# npm, nodejs, and python3 are installed through apt packages

# Install yarn
npm install --global yarn

# link python to python3
ln /bin/python3 /bin/python

# install rust 
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > ~/Downloads/rustup.rs
chmod +x ~/Downloads/rustup.rs
yes 1 | ~/Downloads/rustup.rs
rm -rf ~/Downloads/rustup.rs
PATH="$PATH:~/.cargo/bin"
rustup update stable

# install go
wget -qP ~/Downloads https://go.dev/dl/go1.22.5.linux-amd64.tar.gz
tar -C /usr/local -xzf ~/Downloads/go1.22.5.linux-amd64.tar.gz
rm -f ~/Downloads/go1.22.5.linux-amd64.tar.gz
PATH="$PATH:/usr/local/go/bin"


# Install Powershell
# Install pre-requisite packages.
apt-get install -y wget apt-transport-https software-properties-common
# Download the Microsoft repository GPG keys
wget -q "https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb"
# Register the Microsoft repository GPG keys
dpkg -i packages-microsoft-prod.deb
# Delete the the Microsoft repository GPG keys file
rm packages-microsoft-prod.deb
# Update the list of packages after we added packages.microsoft.com
apt-get update
# Install PowerShell
apt-get install -y powershell


# install Neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
tar xzvf nvim-linux64.tar.gz
mv nvim-linux64/ /opt
rm -rf nvim-linux64.tar.gz
ln -s /opt/nvim-linux64/bin/nvim /usr/bin/nvim

# Install Astrovim

# Install pre-requisites

cargo install tree-sitter-cli

# ripgrep installed by apt (rg)

# goDiskUsage() installed by apt (gdu)

cargo install bottom --locked # (btm)

# python and node installed by apt

# Make a backup
mv ~/.config/nvim ~/.config/nvim.bak
# Clean neovim folders
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
# Clone the repo 
# git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim
# rm -rf ~/.config/nvim/.git
# add mappings to ~/.config/nvim
git clone https://github.com/whitecat1331/astronvim_nvim.git ~/.config/nvim




# give time for everything to catch up
sleep 3
# update and upgrade again
apt update && apt upgrade -y
# end
echo "Successfully Installed"

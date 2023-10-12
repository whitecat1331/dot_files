#!/bin/bash

# ensure root
if [ "$EUID" != 0 ] 
then 
  echo "Please run as root"
  exit
fi

# update and upgrade
apt update && apt upgrade -y

# install apt packages
declare -a apt_packages=$(sed -z 's/\n/ /g' apt_packages.txt)

apt install -y ${apt_packages[@]}

# install Astrovim

# install Neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
tar xzvf nvim-linux64.tar.gz
mv nvim-linux64/ /opt
rm -rf nvim-linux64.tar.gz
ln -s /opt/nvim-linux64/bin/nvim /usr/bin/nvim

# install Astrovim config on Neovim
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
git clone https://github.com/whitecat1331/AstroCat.git ~/.config/nvim/lua/user

# install google-chrome
wget -P /opt https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
chmod +x /opt/google-chrome-stable_current_amd64.deb
apt install -y /opt/google-chrome-stable_current_amd64.deb

# install VMWare
wget -P /opt https://download3.vmware.com/software/WKST-1702-LX/VMware-Workstation-Full-17.0.2-21581411.x86_64.bundle
chmod +x /opt/VMware-Workstation-Full-17.0.2-21581411.x86_64.bundle
/opt/./VMware-Workstation-Full-17.0.2-21581411.x86_64.bundle

# install zoom
wget -P /opt https://cdn.zoom.us/prod/5.14.7.2928/zoom_amd64.deb
chmod +x /opt/zoom_amd64.deb
apt install -y /opt/zoom_amd64.deb

# install and link config files
git clone https://github.com/whitecat1331/dot_files.git /opt/dot_files
users=$(cat /etc/passwd | awk -F: '{if($3>=1000) print $1}')
for user in $users
do
  ln -s /opt/dot_files/.bash_aliases /home/$user/.bash_aliases
  source /home/$user/.bashrc
done

# Install yarn
npm install --global yarn

# link python to python3
ln /bin/python3 /bin/python

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
# TLDR setup
$(which mkdir) -p /root/.local/share/
$(which tldr) -u
# disable sudo password
echo "%sudo ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers
# update and upgrade again
apt update && apt upgrade -y
# end
echo "Successfully Installed"

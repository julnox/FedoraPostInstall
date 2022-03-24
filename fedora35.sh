#!/bin/bash

## Updating System
sudo dnf upgrade;

## Adding Additional RPM repositories
sudo dnf sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm;
sudo dnf upgrade

## External Program Downloading
mkdir /home/$USER/Downloads/programs
cd /home/$USER/Downloads/programs

wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm

sudo dnf install *.rpm

## Installing Repositories Programs
sudo dnf install libreoffice akmod-nvidia gthumb vlc rhythmbox virtualbox torbrowser-launcher gpick piper gparted gnome-tweaks qbittorrent steam lutris easyeffects octave drawing gimp ffmpegthumbnailer python3 gcc g++ make cmake java-11-openjdk java-11-openjdk-devel neofetch ufw zsh mariadb-server
sudo systemctl enable ufw
sudo systemctl disable mariadb

## Installing Flatpak Programs
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak update
flatpak install flathub com.visualstudio.code com.discordapp.Discord org.telegram.desktop

## Installing PIP3 Programs
sudo pip3 install gallery-dl yt-dlp youtube-dl pylint

## Removing leftover files
sudo cd ..
sudo rm -r ./programs

## Changing default shell to ZSH
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s $(which zsh)


#!/bin/bash

# add.repositories for apps and themes below
##############################

printf "\n\ninstalling apt-fast repository\n"
sudo add-apt-repository -y ppa:apt-fast/stable
printf "\n\ninstalling ubuntu-tweak repository\n"
sudo add-apt-repository -y ppa:tualatrix/ppa
printf "\n\ninstalling y-ppa repository\n"
sudo add-apt-repository -y ppa:webupd8team/y-ppa-manager
printf "\n\ninstalling faenza-icon repository\n"
sudo add-apt-repository -y ppa:tiheum/equinox
printf "\n\ninstalling webupd8team repository\n"
sudo add-apt-repository -y ppa:webupd8team/themes
printf "\n\ninstalling noobslab repository\n"
sudo add-apt-repository -y ppa:noobslab/themes
printf "\n\ninstalling canonical partner repository\n"
sudo add-apt-repository -y "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
printf "\n\ninstalling sublime text the 3rd repository\n"
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
printf "\n\ninstalling libre office repository\n"
sudo add-apt-repository -y ppa:libreoffice/ppa
printf "\n\ninstalling spotify repository\n"
sudo add-apt-repository -y "deb http://repository.spotify.com stable non-free"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59
printf "\n\ninstalling nuvola player stable repository\n"
sudo add-apt-repository -y ppa:nuvola-player-builders/stable
printf "\n\ninstalling typhoon repository\n"
sudo add-apt-repository -y ppa:apandada1/typhoon
printf "\n\ninstalling tlp repository, start by writing --tlp start--\n"
sudo add-apt-repository -y ppa:linrunner/tlp
 
# now let's install everything
##############################
 
printf "\n\nabout to update package list\n"
sudo apt-get update
 
printf "\n\ninstall apt-fast\n"
sudo apt-get install apt-fast
 
# gnome-desktop-item-edit utility
sudo apt-fast install --no-install-recommends gnome-panel
 
# show all startup applications
sudo sed -i "s/NoDisplay=true/NoDisplay=false/g" /etc/xdg/autostart/*.desktop

# create context menu article in file manager - open terminal here
sudo apt-fast install nautilus-open-terminal && nautilus -q

# get minimize and maximize button back on the gnome-shell titlebar / no "sudo"
gsettings set org.gnome.shell.overrides button-layout 'menu:minimize,maximize,close'

# remove overlay scrollbars
sudo apt-get --purge autoremove overlay-scrollbar*

# Turn gedit into programming mode
gsettings set org.gnome.gedit.preferences.editor auto-indent true
gsettings set org.gnome.gedit.preferences.editor bracket-matching true
gsettings set org.gnome.gedit.preferences.editor display-line-numbers true
gsettings set org.gnome.gedit.preferences.editor display-right-margin true
gsettings set org.gnome.gedit.preferences.editor highlight-current-line true
gsettings set org.gnome.gedit.preferences.editor scheme 'oblivion'
 
# appearence
############
 
sudo apt-fast install faenza-icon-theme faience-* 
sudo apt-fast install gnome-cupertino-gtk-theme
sudo apt-fast install zukitwo-theme zukitwo zukiwi
 
# applications
##############
sudo apt-fast install chromium
sudo apt-fast install darktable
sudo apt-fast install ubuntu-tweak
sudo apt-fast install gnome-tweak-tool
sudo apt-fast install synaptic
sudo apt-fast install bleachbit
sudo apt-fast install y-ppa-manager
sudo apt-fast install skype
sudo apt-fast install flashplugin-installer
sudo apt-fast install vlc
sudo apt-fast install sublime-text-installer
sudo apt-fast install hamster-applet
sudo apt-fast install hamster-indicator
sudo apt-fast install gtg
sudo apt-fast install libreoffice
sudo apt-fast install gedit
sudo apt-fast install osmo
sudo apt-fast install spotify-client
sudo apt-fast install nuvolaplayer
sudo apt-fast install calibre
sudo apt-fast install typhoon
sudo apt-fast install deluge
sudo apt-fast install filezilla
sudo apt-fast install mypaint
sudo apt-fast install speedcrunch
sudo apt-fast install gimp
sudo apt-fast install p7zip-full
sudo apt-fast install p7zip-rar
sudo apt-fast install pinta
sudo apt-fast install gparted
sudo apt-fast install nautilus-dropbox
sudo apt-fast install synaptic
sudo apt-fast install deborphan
sudo apt-fast install synapse
sudo apt-fast install pidgin
sudo apt-fast install ubuntu-restricted-extras
sudo apt-fast install libavformat-extra-53
sudo apt-fast install libavcodec-extra-53
sudo apt-fast install gstreamer0.10-plugins-ugly
sudo apt-fast install gstreamer0.10-ffmpeg
sudo apt-fast install aspell-ru
sudo apt-fast install tlp
sudo apt-fast install tlp-rdw
sudo apt-fast install docky
 
# clean up
##########

sudo apt-get clean
sudo apt-get autoclean
sudo apt-get autoremove
 
sudo apt-get update
sudo apt-fast upgrade
sudo apt-fast dist-upgrade
 
# whoopsie is an error reporting daemon, takes a lot of ram, crashes trying to send reports to canonical
sudo apt-get --purge autoremove whoopsie

# deja dup is a very powerful backup tool included with ubuntu
sudo apt-get --purge autoremove deja-dup

# java is an ongoing security nightmare, this is how you get rid of it
sudo apt-get --purge autoremove openjdk-\* icedtea-\* icedtea6-\* icedtea7-\*

# xapian - another useless piece of functionality
sudo apt-get --purge autoremove apt-xapian-index

# ubuntuone-syncd - ubuntu one cloud, eats a lot of ram even without authorization; dropbox is better
dpkg -l | grep ubuntuone 
sudo apt-get --purge autoremove gir1.2-ubuntuoneui-3.0 libubuntuoneui-3.0-1 python-ubuntuone-client python-ubuntuone-control-panel python-ubuntuone-storageprotocol rhythmbox-ubuntuone ubuntuone-client ubuntuone-client-gnome ubuntuone-control-panel ubuntuone-couch ubuntuone-installer
rm -fr ~/.local/share/ubuntuone ~/.config/ubuntuone ~/.cache/ubuntuone/

# empathy... unstable as hell im, especially with icq acc
sudo apt-get --purge autoremove empathy
sudo apt-get --purge autoremove indicator-messages
sudo apt-get --purge autoremove telepathy-indicator
sudo apt-get --purge autoremove telepathy-idle

# worthless apps; brasero, gnome-media, gnome-calculator should be there too, but they are catching whole gnome-desktop with dem, need to remove manual 1 by 1
sudo apt-get --purge autoremove gnome-orca
sudo apt-get --purge autoremove transmission-gtk transmission-common
sudo apt-get --purge autoremove cheese cheese-common
sudo apt-get --purge autoremove shotwell
sudo apt-get --purge autoremove totem totem-common totem-plugins totem-mozilla
sudo apt-get --purge autoremove aisleriot
sudo apt-get --purge autoremove gnome-mines
sudo apt-get --purge autoremove gnome-sudoku
sudo apt-get --purge autoremove gnome-mahjongg

sudo apt-get clean
sudo apt-get autoclean
sudo apt-get autoremove
 
sudo apt-get update
sudo apt-fast upgrade
sudo apt-fast dist-upgrade

# download & cp to /home directory pompom_gnome.sh file, then:
#################################
# open terminal
# sudo chmod +x pompom_gnome.sh
# sudo ./pompom_gnome.sh
#################################


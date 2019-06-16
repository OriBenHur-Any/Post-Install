#!/bin/bash
[ -f /etc/apt/sources.list.d/teamviewer.list ] && sudo rm /etc/apt/sources.list.d/teamviewer.list
sudo rm /usr/share/ubuntu-web-launchers/amazon-launcher
sudo apt-get remove --purge -y mozc-data mozc-server mozc-utils-gui ibus-mozc transmission-gtk transmission-common aisleriot thunderbird gnome-mahjongg gnome-todo gnome-todo-common gnome-sudoku gnome-mines ubiquity-slideshow-ubuntu ubuntu-web-launchers
sudo apt-get update
sudo apt-get install --no-install-recommends -y software-properties-common curl gpg-agent gcc make build-essential linux-headers-$(uname -r)  
echo "deb http://linux.teamviewer.com/deb stable main" | sudo tee -a /etc/apt/sources.list.d/teamviewer.list
echo "deb http://linux.teamviewer.com/deb preview main" | sudo tee -a /etc/apt/sources.list.d/teamviewer.list
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo curl -fsSL https://download.teamviewer.com/download/linux/signature/TeamViewer2017.asc | sudo apt-key add -
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo curl -fsSL https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo apt-key add -
sudo curl -fsSL https://www.virtualbox.org/download/oracle_vbox.asc | sudo apt-key add -
sudo curl -fsSL https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo curl -fsSL https://packages.microsoft.com/keys/microsoft.asc  | sudo apt-key add -
sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo add-apt-repository -y "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib"
sudo add-apt-repository -y ppa:qbittorrent-team/qbittorrent-stable
sudo add-apt-repository -y ppa:linuxuprising/java
sudo add-apt-repository universe
sudo apt update

sudo apt-get install --no-install-recommends -y docker-ce oracle-java11-installer apt-transport-https unzip gzip xdotool xvfb rsync imagemagick iotop iftop less autossh lsof mtools nano nmap telnet curl v4l-utils vim vlc wget gimp ntfs-3g ntpdate hwdata hardinfo exfat-fuse exfat-utils simplescreenrecorder gedit htop ssh tmux avahi-discover net-tools gparted git geany aptitude sysstat inotify-tools ffmpeg teamviewer terminator chrome-gnome-shell code trminator qbittorrent chrome-gnome-shell gnome-tweak-tool google-chrome-stable openvpn virtualbox-6.0 jq pv
wget -qO /tmp/zoom.deb https://zoom.us/client/latest/zoom_amd64.deb
sudo apt install -y /tmp/zoom.deb
sudo rm -f /tmp/zoom*
sudo rm -rf /var/cache/oracle-jdk11-installer
wget -qO- https://github.com/tonikelope/megadown/archive/master.zip | busybox unzip - -d /home/$(logname)
wget -qO- http://jdownloader.org/jdownloader2 | grep 'Download Installer (x64)'  | grep -Po '(?<=href=")[^"]*(?=")' | uniq | xargs bash /home/$(logname)/megadown-master/megadown -o /tmp/JD2Setup_x64.sh
chmod +x /tmp/JD2Setup_x64.sh
bash /tmp/JD2Setup_x64.sh -q -dir /home/ori/jd2 -overwrite
wget -O /home/$(logname)/vmware.bin https://www.vmware.com/go/getworkstation-linux
sudo bash /home/$(logname)/vmware.bin --console --required --eulas-agreed

sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo groupadd docker
sudo usermod -aG docker $(logname)
gsettings set org.gnome.desktop.wm.keybindings switch-input-source "['<Shift>Alt_L']"
gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward "['<Alt>Shift_L']"
gsettings set org.gnome.settings-daemon.plugins.media-keys terminal '[]'
gsettings set org.gnome.settings-daemon.plugins.media-keys calculator '[]'
gsettings set org.gnome.settings-daemon.plugins.media-keys home '<Super>e'
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'Launch Terminal'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command '/usr/bin/terminator'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Primary><Alt>t'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name 'Launch Calculator'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command '/snap/bin/gnome-calculator'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ binding '<Shift><Super>c'
grep -q "options snd-hda-intel model=generic" /etc/modprobe.d/alsa-base.conf
[[ $? != 0 ]] && echo "options snd-hda-intel model=generic" | sudo tee -a /etc/modprobe.d/alsa-base.conf

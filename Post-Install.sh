#!/usr/bin/env bash
[ -f /etc/apt/sources.list.d/teamviewer.list ] && sudo rm /etc/apt/sources.list.d/teamviewer.list
sudo rm /usr/share/ubuntu-web-launchers/amazon-launcher
sudo apt remove --purge -y mozc-data mozc-server mozc-utils-gui ibus-mozc transmission-gtk transmission-common aisleriot thunderbird gnome-mahjongg gnome-todo gnome-todo-common gnome-sudoku gnome-mines ubiquity-slideshow-ubuntu ubuntu-web-launchers
sudo apt install --no-install-recommends -y software-properties-common curl gpg-agent gcc make build-essential apt-transport-https linux-headers-$(uname -r)  
echo "deb http://linux.teamviewer.com/deb stable main" | sudo tee -a /etc/apt/sources.list.d/teamviewer.list
echo "deb http://linux.teamviewer.com/deb preview main" | sudo tee -a /etc/apt/sources.list.d/teamviewer.list
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo curl -fsSL https://download.teamviewer.com/download/linux/signature/TeamViewer2017.asc | sudo apt-key add -
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo curl -fsSL https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo curl -fsSL https://packages.microsoft.com/keys/microsoft.asc  | sudo apt-key add -
sudo curl -fsSL https://swupdate.openvpn.net/repos/openvpn-repo-pkg-key.pub | sudo apt-key add -
sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
curl -fsSL "https://swupdate.openvpn.net/community/openvpn3/repos/openvpn3-$(lsb_release -cs).list" | sed 's/\<deb\>/& [arch=amd64]/' | sudo tee /etc/apt/sources.list.d/openvpn3.list >/dev/null
sudo add-apt-repository -y ppa:qbittorrent-team/qbittorrent-stable
sudo add-apt-repository universe
sudo apt update

sudo apt install --no-install-recommends -y docker-ce unzip gzip xdotool xvfb rsync imagemagick iotop iftop less autossh lsof mtools \
    nmap telnet v4l-utils vim vlc wget gimp ntfs-3g ntpdate hwdata hardinfo exfat-fuse exfat-utils simplescreenrecorder gedit htop \ 
    ssh tmux avahi-discover net-tools gparted git geany aptitude sysstat inotify-tools ffmpeg teamviewer terminator chrome-gnome-shell \ 
    code qbittorrent chrome-gnome-shell gnome-tweak-tool google-chrome-stable openvpn3 jq pv
sudo snap refresh
sudo snap install spotify 
sudo snap install slack --classic
sudo snap install authy --beta
wget -qO /tmp/zoom.deb https://zoom.us/client/latest/zoom_amd64.deb
sudo apt install -y /tmp/zoom.deb
sudo rm -f /tmp/zoom*
wget -qO- https://dl.pstmn.io/download/latest/linux | sudo tar -xzf  - -C /opt
sudo ln -s /opt/Postman/Postman /usr/bin/postman
cat > /home/$(logname)/.local/share/applications/postman.desktop <<EOL
[Desktop Entry]
Name=Postman
Exec=postman
Icon=/opt/Postman/app/resources/app/assets/icon.png
Terminal=false
Type=Application
Comment=Postman GUI
Categories=Development;Code;
EOL
wget -qO- https://github.com/tonikelope/megadown/archive/master.zip | busybox unzip - -d /home/$(logname)
wget -qO- http://jdownloader.org/jdownloader2 | grep 'Download Installer (x64)'  | grep -Po '(?<=href=")[^"]*(?=")' | uniq | xargs bash /home/$(logname)/megadown-master/megadown -o /tmp/JD2Setup_x64.sh
chmod +x /tmp/JD2Setup_x64.sh
bash /tmp/JD2Setup_x64.sh -q -dir /home/ori/jd2 -overwrite
curl -fSL -o /home/$(logname)/vmware.bin https://www.vmware.com/go/getworkstation-linux
sudo bash /home/$(logname)/vmware.bin --console --required --eulas-agreed
curl -fsSL  https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.18.7455.tar.gz?_ga=2.150207414.185355059.1601594832-672691879.1601594832| tar -zxvf - -C  /home/$(logname)/jetbrains-toolbox
sudo curl -L https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m) -o /usr/bin/docker-compose && sudo chmod +x /usr/bin/docker-compose
sudo curl -L https://raw.githubusercontent.com/docker/compose/1.27.4/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose 
sudo groupadd docker
sudo usermod -aG docker $(logname)
gsettings set org.gnome.desktop.wm.keybindings switch-input-source "['<Shift>Alt_L']"
gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward "['<Alt>Shift_L']"
gsettings set org.gnome.settings-daemon.plugins.media-keys terminal '[]'
gsettings set org.gnome.settings-daemon.plugins.media-keys calculator '[]'
gsettings set org.gnome.settings-daemon.plugins.media-keys home "['<Super>e']"
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'Launch Terminal'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command '/usr/bin/terminator'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Primary><Alt>t'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name 'Launch Calculator'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command '/snap/bin/gnome-calculator'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ binding '<Shift><Super>c'


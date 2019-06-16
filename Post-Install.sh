#!/bin/bash
sudo su -
sudo yum install -y epel-release

## EPEL Repository
wget https://rpms.remirepo.net/enterprise/remi-release-7.rpm
sudo yum localinstall -y --nogpgcheck remi-release-7.rpm
rm remi-release-7.rpm

## RPMFusion Repository
sudo yum localinstall  -y --nogpgcheck https://download1.rpmfusion.org/free/el/rpmfusion-free-release-7.noarch.rpm
sudo yum localinstall -y --nogpgcheck https://download1.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-7.noarch.rpm


## ELRepo Repository
sudo rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
sudo yum localinstall -y --nogpgcheck https://www.elrepo.org/elrepo-release-7.0-3.el7.elrepo.noarch.rpm

## NUX-dextop Repository
sudo yum localinstall -y --nogpgcheck http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm

## GhettoForge Repository
sudo yum localinstall -y --nogpgcheck http://mirror.ghettoforge.org/distributions/gf/gf-release-latest.gf.el7.noarch.rpm

## Psychotic Ninja Repository
sudo rpm --import http://wiki.psychotic.ninja/RPM-GPG-KEY-psychotic
sudo yum localinstall -y --nogpgcheck http://packages.psychotic.ninja/6/base/i386/RPMS/psychotic-release-1.0.0-1.el6.psychotic.noarch.rpm

## IUS Community Repository
sudo yum localinstall -y --nogpgcheck https://centos7.iuscommunity.org/ius-release.rpm

## RPMFusin Repository
sudo yum localinstall -y --nogpgcheck https://download1.rpmfusion.org/free/el/rpmfusion-free-release-7.noarch.rpm
sudo yum localinstall -y --nogpgcheck https://download1.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-7.noarch.rpm

## Webtatic Repository
sudo yum localinstall -y --nogpgcheck http://repo.webtatic.com/yum/el7/webtatic-release.rpm

sudo yum install -y curl gnupg2 gcc gcc-c++ make cmake3 kernel-headers yum-utils device-mapper-persistent-data lvm2

sudo rpm --import https://www.virtualbox.org/download/oracle_vbox.asc
sudo rpm --import http://linux.teamviewer.com/pubkey/TeamViewer2017.asc
sudo rpm --import https://www.virtualbox.org/download/oracle_vbox_2016.asc
sudo rpm --import https://www.virtualbox.org/download/oracle_vbox.asc
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo rpm --import https://dl-ssl.google.com/linux/linux_signing_key.pub 


sudo tee  /etc/yum.repos.d/teamviewer.repo <<'EOF'
[teamviewer]
name=TeamViewer - $basearch
baseurl=http://linux.teamviewer.com/yum/stable/main/binary-$basearch/
gpgkey=http://linux.teamviewer.com/pubkey/TeamViewer2017.asc
gpgcheck=1
enabled=1
type=rpm-md
failovermethod=priority
EOF

sudo tee /etc/yum.repos.d/google-chrome.repo<<'EOF'
[google-chrome]
name=google-chrome
baseurl=http://dl.google.com/linux/chrome/rpm/stable/$basearch
enabled=1
gpgcheck=1
gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub
EOF


sudo tee /etc/yum.repos.d/vscode.repo <<'EOF'
[code]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
EOF

sudo yum-config-manager -y --add-repo https://download.virtualbox.org/virtualbox/rpm/el/virtualbox.repo
sudo yum-config-manager -y --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum install -y http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-1.el7.nux.noarch.rpm
sudo yum install -y http://opensource.wandisco.com/centos/7/git/x86_64/wandisco-git-release-7-2.noarch.rpm

sudo yum update -y

sudo yum install -y docker-ce docker-ce-cli containerd.io unzip gzip xdotool rsync ImageMagick iotop iftop less autossh lsof mtools nano nmap telnet curl v4l-utils vim vlc wget gimp ntfs-3g ntpdate hwdata hardinfo exfat-utils fuse-exfat simplescreenrecorder gedit htop tmux net-tools gparted git geany sysstat inotify-tools ffmpeg teamviewer terminator  code qbittorrent gnome-tweak-tool google-chrome-stable openvpn VirtualBox-6.0 jq pv ncurses-devel
sudo systemctl start docker
sudo systemctl enable docker

git clone https://github.com/GNOME/chrome-gnome-shell.git /home/$(logname)/chrome-gnome-shell
cd /home/$(logname)/chrome-gnome-shell
mkdir build
cd build
cmake3 -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_EXTENSION=OFF ../
sudo make install 

wget -qO /tmp/zoom.rpm https://zoom.us/client/latest/zoom_x86_64.rpm
sudo yum localinstall -y /tmp/zoom.rpm
sudo rm -f /tmp/zoom*
sudo wget -qO /usr/bin/busybox https://busybox.net/downloads/binaries/1.30.0-i686/busybox
sudo chmod +x /usr/bin/busybox
wget -qO- https://github.com/tonikelope/megadown/archive/master.zip | busybox unzip - -d /home/$(logname)
wget -qO- http://jdownloader.org/jdownloader2 | grep 'Download Installer (x64)'  | grep -Po '(?<=href=")[^"]*(?=")' | uniq | xargs bash /home/$(logname)/megadown-master/megadown -o /tmp/JD2Setup_x64.sh
sudo chmod +x /tmp/JD2Setup_x64.sh
bash /tmp/JD2Setup_x64.sh -q -dir /home/$(logname)/jd2 -overwrite
wget -O /home/$(logname)/vmware.bin https://www.vmware.com/go/getworkstation-linux
sudo bash /home/$(logname)/vmware.bin --console --required --eulas-agreed

sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo groupadd docker
sudo usermod -aG docker $(logname)
sudo usermod -aG vboxusers $(logname)
su $(logname)
gsettings set org.gnome.desktop.wm.keybindings switch-input-source "['<Shift>Alt_L']"
gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward "['<Alt>Shift_L']"

gsettings set org.gnome.settings-daemon.plugins.media-keys home '<Super>e'
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'Launch Terminal'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command '/usr/bin/terminator'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Primary><Alt>t'
#grep -q "options snd-hda-intel model=generic" /etc/modprobe.d/alsa-base.conf
#[[ $? != 0 ]] && echo "options snd-hda-intel model=generic" | sudo tee -a /etc/modprobe.d/alsa-base.conf

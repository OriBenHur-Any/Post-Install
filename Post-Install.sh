#!/bin/bash
echo "Delete /etc/apt/sources.list.d/teamviewer.list"
[ -f /etc/apt/sources.list.d/teamviewer.list ] && sudo rm /etc/apt/sources.list.d/teamviewer.list
echo
echo
echo "Remove amazone-launcher"
sudo rm /usr/share/ubuntu-web-launchers/amazon-launcher
echo 
echo 
echo "Remove unnecessary apps"
sudo apt-get remove --purge -y mozc-data mozc-server mozc-utils-gui ibus-mozc transmission-gtk transmission-common aisleriot thunderbird gnome-mahjongg gnome-todo gnome-todo-common gnome-sudoku gnome-mines ubiquity-slideshow-ubuntu ubuntu-web-launchers
echo 
echo 
sudo apt-get update
echo 
echo 
echo "Install programs"
sudo apt-get install --no-install-recommends -y software-properties-common curl gpg-agent
echo "deb http://linux.teamviewer.com/deb stable main" | sudo tee -a /etc/apt/sources.list.d/teamviewer.list
echo "deb http://linux.teamviewer.com/deb preview main" | sudo tee -a /etc/apt/sources.list.d/teamviewer.list
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo curl -fsSL https://download.teamviewer.com/download/linux/signature/TeamViewer2017.asc |  sudo apt-key add -
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
sudo curl -fsSL https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo add-apt-repository -y ppa:graphics-drivers/ppa
sudo add-apt-repository -y ppa:graphics-drivers
sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
distribution=$(. /etc/os-release;echo $ID$VERSION_ID) && sudo curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt update
echo
echo
echo 
echo "Install programs"
sudo apt-get install --no-install-recommends -y nvidia-driver-410  apt-transport-https ca-certificates nvidia-docker2 docker-ce software-properties-common gpg-agent unzip gzip xdotool xvfb rsync imagemagick iotop iftop less autossh lsof mtools nano nmap telnet curl v4l-utils vim vlc wget gimp ntfs-3g ntpdate hwdata hardinfo exfat-fuse exfat-utils simplescreenrecorder gedit htop ssh tmux avahi-discover net-tools gparted git geany aptitude sysstat inotify-tools ffmpeg teamviewer google-chrome-stable

sudo curl -L https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose && sudo chmod +x /usr/bin/docker-compose
 sudo curl -L https://raw.githubusercontent.com/docker/compose/1.23.2/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose 
sudo chmod +x /usr/local/bin/docker-compose
sudo groupadd docker
sudo usermod -aG docker $(logname)

sudo tee /etc/docker/daemon.json <<'EOF'
{
    "default-runtime": "nvidia",
    "runtimes": {
        "nvidia": {
            "path": "/usr/bin/nvidia-container-runtime",
            "runtimeArgs": []
        }
    }
}
EOF
 
sudo pkill -SIGHUP dockerd
reboot -h now

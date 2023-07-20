#!/bin/bash

# Check for the root privileges
if [ $EUID -ne 0 ]; then
    echo "This script must be run as root" 1>&2
    exit 1
fi

# Check for and install lsb-release package if necessary
if ! command -v lsb_release > /dev/null; then
    if [ -f /etc/debian_version ]; then
        apt-get update
        apt-get install -y lsb-release
    elif [ -f /etc/redhat-release ]; then
        yum install -y redhat-lsb-core
    else
        echo "Cannot determine the package manager. Please install 'lsb-release' manually and run the script again."
        exit 1
    fi
fi

# Detect the distribution and OS
DISTRO=$(lsb_release -is | tr '[:upper:]' '[:lower:]')
OS=$DISTRO

echo ":: OS: $OS"
echo ":: Distro: $DISTRO"

# Stop Ajenti service
sudo /etc/init.d/ajenti stop
sudo systemctl stop ajenti

# Uninstall Ajenti plugins
/usr/bin/yes | $(which pip) uninstall ajenti-panel ajenti.plugin.dashboard ajenti.plugin.settings ajenti.plugin.plugins ajenti.plugin.notepad ajenti.plugin.terminal ajenti.plugin.filemanager ajenti.plugin.packages ajenti.plugin.services || exit 1

# Uninstall initscript and remove files
echo ":: Uninstalling initscript"

if [ -f /etc/init/ajenti.conf ]; then
    sudo rm /etc/init/ajenti.conf /lib/systemd/system/ajenti.service /etc/init.d/ajenti /var/run/ajenti.pid 2>/dev/null
    sudo rm -fr /etc/ajenti /var/log/ajenti /sys/fs/cgroup/pids/system.slice/ajenti.service /sys/fs/cgroup/devices/system.slice/ajenti.service /sys/fs/cgroup/systemd/system.slice/ajenti.service 2>/dev/null
fi

echo ':: Ajenti Successfully Uninstalled.'

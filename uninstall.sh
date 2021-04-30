#!/bin/bash
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

DISTRO=
OS=

if grep 'Debian' /etc/issue > /dev/null 2>&1 ; then
    OS=debian
    DISTRO=debian
fi

if grep 'Ubuntu' /etc/issue > /dev/null 2>&1 ; then
    OS=debian
    DISTRO=ubuntu
fi

if grep 'ubuntu' /etc/os-release > /dev/null 2>&1 ; then
    OS=debian
    DISTRO=ubuntu
fi

echo ":: OS: $OS"
echo ":: Distro: $DISTRO"

/etc/init.d/ajenti stop
systemctl stop ajenti

echo ":: Uninstalling Ajenti"
/usr/bin/yes | `which pip` uninstall ajenti-panel ajenti.plugin.dashboard ajenti.plugin.settings ajenti.plugin.plugins ajenti.plugin.notepad ajenti.plugin.terminal ajenti.plugin.filemanager ajenti.plugin.packages ajenti.plugin.services || exit 1

# ----------------

echo ":: Uninstalling initscript"

if [ -f /etc/init/ajenti.conf ] ; then
    rm /etc/init/ajenti.conf /lib/systemd/system/ajenti.service /etc/init.d/ajenti /var/run/ajenti.pid 2>/dev/null
    rm -fr /etc/ajenti /var/log/ajenti /sys/fs/cgroup/pids/system.slice/ajenti.service /sys/fs/cgroup/devices/system.slice/ajenti.service /sys/fs/cgroup/systemd/system.slice/ajenti.service 2>/dev/null
fi

echo ':: Ajenti Uninstalled.'

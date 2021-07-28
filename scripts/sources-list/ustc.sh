#!/usr/bin/env bash

if [[ -f /home/vagrant/.homestead-features/change-software-source ]]; then
    echo "Software Source Is Changed."
    exit 0
fi

sudo touch /home/vagrant/.homestead-features/change-software-source
sudo chown -Rf vagrant:vagrant /home/vagrant/.homestead-features

sudo mv /etc/apt/sources.list /etc/apt/sourses.list.backup

block="#中科大源
deb https://mirrors.ustc.edu.cn/ubuntu/ bionic main restricted universe multiverse
deb https://mirrors.ustc.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse
deb https://mirrors.ustc.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse
deb https://mirrors.ustc.edu.cn/ubuntu/ bionic-security main restricted universe multiverse
deb https://mirrors.ustc.edu.cn/ubuntu/ bionic-proposed main restricted universe multiverse
deb-src https://mirrors.ustc.edu.cn/ubuntu/ bionic main restricted universe multiverse
deb-src https://mirrors.ustc.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse
deb-src https://mirrors.ustc.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse
deb-src https://mirrors.ustc.edu.cn/ubuntu/ bionic-security main restricted universe multiverse
deb-src https://mirrors.ustc.edu.cn/ubuntu/ bionic-proposed main restricted universe multiverse"

# shellcheck disable=SC2024
sudo echo "$block" > "/etc/apt/sources.list"

sudo apt-get update

#!/bin/bash
apt-get update -y
apt-get install debian-archive-keyring curl gnupg apt-transport-https git -y
mkdir /etc/apt/keyrings
curl -fsSL https://packagecloud.io/github/git-lfs/gpgkey | gpg --dearmor > /etc/apt/keyrings/github_git-lfs-archive-keyring.gpg
echo <<EOF > /etc/apt/sources.list.d/github_git-lfs.list
    deb [signed-by=/etc/apt/keyrings/github_git-lfs-archive-keyring.gpg] https://packagecloud.io/github/git-lfs/debian buster main
    deb-src [signed-by=/etc/apt/keyrings/github_git-lfs-archive-keyring.gpg] https://packagecloud.io/github/git-lfs/debian buster main
EOF
apt-get update -y
apt-get install git-lfs -y

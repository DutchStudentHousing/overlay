#!/bin/bash
apt-get update -y
apt-get install -y git debian-archive-keyring curl gnupg apt-transport-https
mkdir -p /etc/apt/keyrings
curl -fsSL https://packagecloud.io/github/git-lfs/gpgkey | gpg --dearmor > /etc/apt/keyrings/github_git-lfs-archive-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/github_git-lfs-archive-keyring.gpg] https://packagecloud.io/github/git-lfs/debian buster main' > /etc/apt/sources.list.d/github_git-lfs.list
echo 'deb-src [signed-by=/etc/apt/keyrings/github_git-lfs-archive-keyring.gpg] https://packagecloud.io/github/git-lfs/debian buster main' >> /etc/apt/sources.list.d/github_git-lfs.list
apt-get update -y
apt-get install -y git-lfs

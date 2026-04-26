#!/bin/bash

set -e

sudo apt update && sudo apt upgrade -y

sudo apt install -y \
curl \
git \
unzip \
build-essential \
ca-certificates \
gnupg \
software-properties-common \
python3 \
python3-pip \
htop \
net-tools \
openssh-server

echo "Base system installed successfully."
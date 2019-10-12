#!/bin/bash

echo "setup-ubuntu.sh: starting"

echo "setup-ubuntu.sh: apt update"
apt update

PACKAGES=htop nano git curl wget
echo "setup-ubuntu.sh: apt install $PACKAGES"
apt install -y $PACKAGES

echo "setup-ubuntu.sh: download zsh"
setup-scripts/download-zsh

echo "setup-ubuntu.sh: done"

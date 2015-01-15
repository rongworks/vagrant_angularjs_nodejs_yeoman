#!/usr/bin/env bash

user="vagrant"
home="/home/$user"

echo "## APT update"
apt-get -qq update

echo "## Add ppa for nodejs"
apt-get -qq -y install python-software-properties
add-apt-repository -y ppa:chris-lea/node.js

echo "## APT update"
apt-get -qq update

echo "## Install utils (git, tree, vim, unzip)"
apt-get -qq -y install git
apt-get -qq -y install vim
apt-get -qq -y install tree
apt-get -qq -y install unzip

echo "## Install nodejs"
apt-get -qq -y install nodejs 
  
echo "### Install Yeoman"
echo "## Patch system for installing npm packages globally without sudo"
cd $home
mkdir ".npm-packages"
chown $user ".npm-packages"
NPM_PACKAGES="$home/.npm-packages"
echo prefix=$home/.npm-packages >> .npmrc
echo NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH" >> .bashrc
echo PATH="$NPM_PACKAGES/bin:$PATH" >> .bashrc
echo MANPATH="$NPM_PACKAGES/share/man:$(manpath)" >> .bashrc
source ~/.bashrc
chown $user ".npmrc"

echo "## Install yeoman toolbelt"
npm install --global yo bower grunt-cli
npm install --global generator-angular@0.9.2

echo "git version"
git --version

echo "nodejs, npm version"
node --version && npm --version

echo "yo, bower, grunt-cli version"
yo --version && bower --version && grunt --version
  
  

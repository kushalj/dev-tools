#!/bin/bash

# prepare for installs...
sudo apt-get update

# install tree
sudo apt-get install tree

# vim
sudo apt-get install vim

# Version control
sudo apt-get install git 
sudo apt-get install mercurial
sudo apt-get install subversion

# Pip / Python
sudo apt-get install python python-dev
sudo apt-get install python-pip 

md $HOME/.pip
cat pip-conf >> $HOME/.pip/pip.conf

# Bash tools
sudo apt-get install curl


# Dev tools
sudo apt-get install ruby2.1.1
sudo app-get install virtualenv
sudo apt-get install libmysqlclient-dev
sudo apt-get install libxml2-dev
sudo apt-get install libxslt1-dev


# NVM install
curl https://raw.github.com/creationix/nvm/master/install.sh | sh
echo ""
echo "nvm install 0.10"
echo "nvm alias default 0.10"
echo "(may help)"
echo ""

# CSS and JS
sudo gem install sass
sudo gem install compass
sudo npm install -g grunt-cli


# TEMPORARY node.js, node tools and BASH setup:
cd $HOME
git clone https:/github.com/kushalj/setup-node
echo ""
echo " use: cd ~/setup-node"
echo " ./git_setup.sh [username] [email]"
echo "for git setup"
echo ""
cd setup-node
./setup.sh

echo "Public RSA key for BitBucket and Github:"
cat $HOME/.ssh/id_rsa.pub

# SUBLIME Text 3
sudo add-apt-repository ppa:webupd8team/sublime-text-3
sudo apt-get update
sudo apt-get install sublime-text-installer


# HIVE STUFF

# Custom shortcuts
echo "source ~/hive-dev/shortcuts.sh" >> ~/.bashrc_custom
echo "source ~/hive-dev/acd_func.sh" >> ~/.bashrc_custom
echo "source ~/hive-dev/hive-aliases.sh" >> ~/.bashrc_custom



# Ruby setup
\curl -sSL https://get.rvm.io | bash
source ~/.rvm/scripts/rvm
#rvm install 2.0.0
sudo gem update


# Dev tools
sudo gem install compass
npm

# Tmuxinator setup
sudo gem install tmuxinator



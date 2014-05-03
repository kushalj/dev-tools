#!/bin/bash
# Simple setup.sh for configuring Ubuntu instances
# for headless setup. 

# prepare for installs...
sudo apt-get update

# install tree
sudo apt-get -y install tree


# Version control
sudo apt-get install -y git-core 
sudo apt-get install -y mercurial
sudo apt-get install -y subversion

# Pip / Python
sudo apt-get install -y python python-dev python-software-properties
sudo apt-get install -y python-pip 


# Dev tools
pip install virtualenv
sudo apt-get install -y virtualenvwrapper
sudo apt-get install -y libmysqlclient-dev
sudo apt-get install -y libxml2-dev
sudo apt-get install -y libxslt1-dev

# Bash tools
sudo apt-get install -y curl



# git pull and install dotfiles as well
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi
if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d~
fi
git clone https://github.com/kushalj/dotfiles.git
ln -sb dotfiles/.screenrc .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .
ln -sf dotfiles/.emacs.d .
ln -sf dotfiles/.vimrc .
ln -sf dotfiles/.tmux.conf .

# Install NPM
curl http://npmjs.org/install.sh | sh
#npm install -g nvm

# Install nvm: node-version manager
# https://github.com/creationix/nvm
#curl https://raw.github.com/creationix/nvm/master/install.sh | sh
curl https://raw.githubusercontent.com/creationix/nvm/v0.5.1/install.sh | sh

echo ""
echo "nvm install 0.10"
echo "nvm alias default 0.10"
echo "(may help)"
echo ""


# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install v0.10.12
nvm use v0.10.12

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
npm install -g jshint

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
sudo apt-add-repository -y ppa:cassou/emacs
sudo apt-get update
sudo apt-get install -y emacs24 emacs24-el emacs24-common-non-dfsg

# vim
sudo apt-get install -y vim

# Amazon EC2 metadata tools
# echo "wget http://s3.amazonaws.com/ec2metadata/ec2-metadata"
# echo "chmod u+x ec2-metadata"

# this can set the git to push over SSH instead of HTTP
# git remote set-url origin git@github.com:kushalj/edt.git


echo "Public RSA key for BitBucket and Github:"
if [ -f $HOME/.ssh/id_rsa.pub ]; then
    cat $HOME/.ssh/id_rsa.pub
else
   echo "You need to run ssh-keygen"
fi

# SUBLIME Text 3
#sudo add-apt-repository ppa:webupd8team/sublime-text-3
#sudo apt-get update
#sudo apt-get install sublime-text-installer


# Custom shortcuts
echo "source ~/edt/shortcuts.sh" >> ~/.bashrc_custom
echo "source ~/edt/acd_func.sh" >> ~/.bashrc_custom


# Ruby setup
sudo apt-get install -y libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
\curl -L https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
source ~/.profile
rvm requirements
rvm install 2.1.1
rvm use 2.1.1 --default
# get folder PATHs from .bash_profile
source ~/.bash_profile
ruby -v
rvm rubygems current
gem update


# Dev tools
gem install compass
npm install -g gulp
npm install -g grunt-cli


# Tmuxinator setup
sudo apt-get install tmux
gem install tmuxinator


# fixes alt-3 on UK Mac keyboards to get a '#'
source ~/edt/mac_uk_hashfix.sh

source ~/edt/vim-packages.sh


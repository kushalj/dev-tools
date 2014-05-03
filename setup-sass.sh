#!/bin/bash

# bash-tools.sh
source bash-tools.sh

# install tree
dirMaker "$HOME/apps"
dirMaker "$HOME/apps/tree"
cp tree.sh ~/apps/tree/
cd ~/apps/tree
    chmod u+x tree.sh

    dirMaker "/usr/local/bin/tree"
    ln -s ~/apps/tree/tree.sh /usr/local/bin/tree
    echo "PATH=/usr/local/bin:\${PATH}" >> ~/.bash_profile
cd ~/dev-tools


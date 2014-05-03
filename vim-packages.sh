#!/bin/bash

isdirectory() {
  if [ -d "$1" ]
  then
    return 0
  else
    return 1
  fi
}

isfile() {
  if [ -f "$1" ]
  then
    return 0
  else
    return 1
  fi
}

# Check folders
if isdirectory ~/.vim/bundle; then
    echo "~/.vim/bundle exists"
else
    echo "Making autoload and bundle folders for vim"
    mkdir -p ~/.vim/autoload ~/.vim/bundle; \
fi


# Pathogen
if isfile ~/.vim/autoload/pathogen.vim; then
    echo "Pathogen already installed"
else
    "Installing Pathogen"
    curl -LSso ~/.vim/autoload/pathogen.vim \
        https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
fi


# Vundle
if isdirectory ~/.vim/bundle/Vundle.vim; then
    echo "Vundle already installed"
else
    echo "Installing Vundle"
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi


# ctrlp
if isdirectory ~/.vim/bundle/ctrlp.vim; then
    echo "ctrlp already installed"
else
    echo "Installing ctrlp"
    git clone https://github.com/kien/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim
fi

# nerdtree
if isdirectory ~/.vim/bundle/nerdtree; then
    echo "nerdtree already installed"
else
    echo "Installing nerdtree"
    git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
fi

# syntastic
if isdirectory ~/.vim/bundle/syntastic; then
    echo "syntastic already installed"
else
    echo "Installing syntastic"
    git clone https://github.com/scrooloose/syntastic.git ~/.vim/bundle/syntastic
fi

# tern_for_vim
if isdirectory ~/.vim/bundle/tern_for_vim; then
    echo "tern_for_vim already installed"
else
    echo "Installing tern_for_vim"
    git clone https://github.com/marijnh/tern_for_vim.git ~/.vim/bundle/tern_for_vim
fi

# vim-indent-guides
if isdirectory ~/.vim/bundle/vim-indent-guides; then
    echo "vim_indent_guides already installed"
else
    echo "Installing vim-indent-guides"
    git clone git://github.com/nathanaelkane/vim-indent-guides.git ~/.vim/bundle/vim-indent-guides
fi

# vim-surround 
if isdirectory ~/.vim/bundle/vim-surround; then
    echo "vim-surround already installed"
else
    echo "Installing vim-surround"
    git clone git://github.com/tpope/vim-surround.git ~/.vim/bundle/vim-surround
fi



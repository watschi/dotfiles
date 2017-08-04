#!/bin/bash
# Install vim plugins and link .vimrc

# Install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Run vim with plugin.vim to install all plugins
vim -u plugins.vim +BundleInstall +qall

# Link all needed files to the homedirectory
rm ~/.vimrc
ln -rs ../.vimrc ~/.vimrc
ln -rs plugins.vim ~/.vim/plugins.vim
ln -rs homesettings.vim ~/.vim/homesettings.vim

# Create undodir
mkdir -p ~/.vim/undo

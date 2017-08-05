#!/bin/bash
# Install vim plugins and link .vimrc

# Change directory to where this script is stored
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $dir

# Check for -y parameter and prompt for confirmation if '-y' is not set
if [[ ! $1 =~ ^-[Yy] ]]
then
    read -p "This will override your current .vimrc! Continue? (y/[n]) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
        [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1 # handle exits from shell or function but don't exit interactive shell
    fi
fi

# Remove old vim configurations
rm ~/.vimrc
rm -rf ~/.vim

# Install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Run vim with plugin.vim to install all plugins
vim -u plugins.vim +BundleInstall +qall

# Link all needed files to the homedirectory
ln -rs ../.vimrc ~/.vimrc
ln -rs plugins.vim ~/.vim/plugins.vim
ln -rs homesettings.vim ~/.vim/homesettings.vim

# Create undodir
mkdir -p ~/.vim/undo

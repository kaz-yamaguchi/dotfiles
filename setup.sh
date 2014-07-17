#!/bin/sh

if [ ! -d ~/.vim/bundle ]; then
    mkdir -p ~/.vim/bundle
    git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
    git clone https://github.com/Shougo/vimproc ~/.vim/bundle/vimproc
    cd ~/.vim/bundle/vimproc; make; cd -
fi

ln -sf ~/git/dotfiles/bash/.bashrc ~/.bashrc
ln -sf ~/git/dotfiles/vim/.vimrc ~/.vimrc
ln -sf ~/git/dotfiles/vim/.vimrc.neobundle ~/.vim/vimrc.neobundle

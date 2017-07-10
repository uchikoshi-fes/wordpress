#!/usr/local/bin/bash
git clone https://github.com/vim/vim.git $1/vim
cd $1/vim/src
./configure --prefix=$2 --enable-multibyte
make
make install

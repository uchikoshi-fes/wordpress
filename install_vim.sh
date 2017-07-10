#!/usr/local/bin/bash
git clone https://github.com/vim/vim.git $1
$1/vim/src/configure --prefix=$2 --enable-multibyte
make -C $1/vim/src
make -C $1/vim/src install

#!/bin/bash

# First, install Pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Second, make the bundle directory, and go there
mkdir -p ~/.vim/bundle
cd ~/.vim/bundle

# Third, install your glorious plugins!
git clone https://github.com/scrooloose/nerdtree
git clone https://github.com/altercation/vim-colors-solarized
git clone https://github.com/bling/vim-airline
git clone https://github.com/godlygeek/tabular
git clone https://github.com/mattn/emmet-vim
git clone https://github.com/tpope/vim-commentary
git clone https://github.com/tomtom/tlib_vim.git
git clone https://github.com/MarcWeber/vim-addon-mw-utils.git
git clone https://github.com/garbas/vim-snipmate.git
git clone https://github.com/honza/vim-snippets.git










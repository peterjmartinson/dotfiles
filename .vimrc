"  
"  Author: Peter Martinson
"  Create Date: September 1, 2015
"  
"  type 'vim --version' to see where to save this file

"  Plugin manager
execute pathogen#infect()
filetype plugin on

set tabstop=2                       " Tab is 2 spaces
set softtabstop=2                   " Tab is 2 spaces
set shiftwidth=2                    " Autoindent is 2 spaces
set expandtab                       " All tabs are spaces
set number                          " Turn on line numbers
set wrap                            " Wrap text
set linebreak                       " Don't break words at the wrap
set nolist                          " Don't show eol and other chars
set scrolloff=5                     " Scroll when 5 lines from top or bottom
set showcmd                         " Show current command & selection length
set t_Co=256                        " Use 256 colors
set hlsearch                        " Highlight all occurrences of a search
syntax enable                       " Turn on syntax highlighting
au FileType * set fo-=c fo-=r fo-=o " kill the auto commenting!!
set background=dark                 " Dark Solarize colorscheme
let g:solarized_termcolors=256      " Make Solarize use built in color palatte
colorscheme solarized               " Colorscheme = solarized
set laststatus=2                    " Show statusline always
set statusline=\<%n\>\ %t\ \%m\%=\%c\ \|\ %l\ of\ %L

"  Highlight current line when in Insert mode
hi CursorLine ctermbg=232 cterm=none
au InsertEnter * set cursorline     " Insert mode line highlighting
au InsertLeave * set nocursorline   " End highlighting outside of Insert mode

" Keybindings
let mapleader=","                   " Remap the leader key to ,
nmap <Leader>j :w<CR>:make<CR><CR>:copen<CR>  " ,j runs the linter
nmap <Leader>n :nohl<CR>            " ,h removes search result highlights
nmap <Leader>w <C-w><C-w>           " Switch windows in split-window mode
nnoremap <C-n> :bnext<CR>           " Ctrl-n = next buffer
nnoremap <C-p> :bprevious<CR>       " Ctrl-p = previous buffer
nnoremap <C-c> :bp\|bd #<CR>        " Ctrl-c = close current buffer

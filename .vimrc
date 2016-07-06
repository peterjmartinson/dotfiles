"  
"  Author:      Peter Martinson
"  Create Date: September 1, 2015
"  
"  type 'vim --version' to see where to save this file

set nocompatible

"  Plugin manager
execute pathogen#infect()
filetype plugin on

set tabstop=2                       " Tabs are 2 columns long
set expandtab                       " Typing Tab produces spaces, not tabs
set softtabstop=2                   " Typing Tab produces 2 spaces
set shiftwidth=2                    " '>' and '<' indents 2 spaces
set autoindent                      " Smart indenting
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
set statusline+=\ \ \[%{strftime('%I:%M\ %p')}\]
let g:netrw_liststyle=3

"  Highlight current line when in Insert mode
hi CursorLine ctermbg=232 cterm=none
au InsertEnter * set cursorline     " Insert mode line highlighting
au InsertLeave * set nocursorline   " End highlighting outside of Insert mode

"""""""""""""""
" Keybindings "
"""""""""""""""

" ,j->jslint | ,n->nohl | ,w->switch window
" ctrl-n->next buffer   | ctrl-p->previous buffer | ctrl-c->close buffer
" ,ev->edit .vimrc      | ,sv->reload .vimrc      | ,'->quote 'word'
" > -> indent, stay in visual | < -> deindent, stay in visual
" ,c->"clip" delete last character in line | ;=:
let mapleader=','
nmap <leader>j :w<cr>:make<cr><cr>:copen<cr>
nmap <leader>n :nohl<cr>
nmap <leader>w <C-w><C-w>
nmap <leader>v :90vsplit<cr>
nmap <leader>d :20Lexplore<cr>
nnoremap <C-n> :bnext<cr>
nnoremap <C-p> :bprevious<cr>
" close the buffer, but not the split
nnoremap <C-c> :bp\|bd #<cr>
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
vmap > >gv
vmap < <gv
nnoremap <leader>c $x0
nnoremap <leader><space> 0d$
nnoremap ; :

"  move screen lines with arrow keys
imap <up> <C-O>gk
imap <down> <C-O>gj
nmap <up> gk
nmap <down> gj
vmap <up> gk
vmap <down> gj

"""""""""""""""""""""""""
" SQL specific bindings "
"""""""""""""""""""""""""

"  E.ENC_DATE -> trunc(E.ENC_DATE,'DDD')
nnoremap <leader>str viW<esc>a,'DDD')<esc>Bitrunc(<esc>%%
"  01/01/2010 -> to_date('01/01/2010','MM/DD/YYYY')
nnoremap <leader>std viW<esc>a','MM/DD/YYYY')<esc>Bito_date('<esc>%%
"  TABLE_NAME -> drop table TABLE_NAME;
nnoremap <leader>sdt viw<esc>a;<esc>hbidrop table <esc>lel
"  TABLE_NAME -> create table TABLE_NAME nologging as
nnoremap <leader>sct viw<esc>a nologging as<esc>bbbicreate table <esc>
"  Centers text into a comment line
nnoremap <leader>sl :center 80<cr>hhv0llr_hvhs/*<esc>lvey$A <esc>pA*/<esc>0


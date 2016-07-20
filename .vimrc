"  
"  Author:      Peter Martinson
"  Create Date: September 1, 2015
"  
"  type 'vim --version' to see where to save this file
"
"  desired functionality:
"    simplify statusbar when window is small

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
set statusline+=\ \ \[\ %{strftime('%m\/%d\/%Y')}
set statusline+=\ %{strftime('%I:%M\ %p')}\]
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
let mapleader="\<tab>"
nmap <leader>j :w<cr>:make<cr><cr>:copen<cr>
nmap <leader>; :nohl<cr>
nmap <leader>v :90vsplit<cr>
nmap <leader>t :NERDTree<cr>
nmap <leader>d :20Vexplore<cr>
nmap <leader>- O<esc>80i-<esc>j0
nnoremap <C-n> :bnext<cr>
nnoremap <C-p> :bprevious<cr>
" close the buffer, but not the split
nnoremap <C-c> :bprevious\|bwipeout #<cr>
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>' viw<esc>a'<esc>hBi'<esc>lE
nnoremap <leader>( viW<esc>a)<esc>hBi(<esc>lE
"  Centers text into a comment line
nnoremap <leader>cl :center 80<cr>hhv0llr_hvhs/*<esc>lvey$A <esc>pA*/<esc>0
vmap > >gv
vmap < <gv
nnoremap <leader>, $x0
nnoremap <leader><space> 0d$
nnoremap <leader>o O<esc>j
nnoremap ; :

"  move screen lines with arrow keys
imap <up> <C-O>gk
imap <down> <C-O>gj
nmap <up> gk
nmap <down> gj
vmap <up> gk
vmap <down> gj

"  Switch windows using CTRL-<motion key>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nmap <leader>1 :NERDTree<cr><c-w><c-w>:90vsplit<cr>:25split<cr><c-w>h

"""""""""""""""""""""""""
" SQL specific bindings "
"""""""""""""""""""""""""

"  01/01/2010 -> to_date('01/01/2010','MM/DD/YYYY')
nnoremap <leader>std viW<esc>a','MM/DD/YYYY')<esc>Bito_date('<esc>%%
"  TABLE_NAME -> drop table TABLE_NAME;
nnoremap <leader>sdt viw<esc>a;<esc>hbidrop table <esc>lel
"  TABLE_NAME -> create table TABLE_NAME nologging as
nnoremap <leader>sct viw<esc>a nologging as<esc>bbbicreate table <esc>
"  puts a column into a comma-separated pair of parentheses
"    make sure there's a blank line underneath the list!!
nnoremap <leader>s( mm}kk:'m,.s/\n/, /<cr>:nohl<cr>I(<esc>A)<esc>0

""""""""""""""""""""""""""
" Simplenote Integration "
""""""""""""""""""""""""""
" let g:SimplenoteUsername = "username"
" let g:SimplenotePassword = "password"

source ~/.simplenoterc

nnoremap <leader>nl :Simplenote -l<cr>
nnoremap <leader>nn :Simplenote -n<cr>
nnoremap <leader>nt :Simplenote -t<cr>

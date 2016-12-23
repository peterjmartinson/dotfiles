"  
"  Author:      Peter Martinson
"  Create Date: September 1, 2015
"  
"  type 'vim --version' to see where to save this file
"

set nocompatible

"  Plugin manager
execute pathogen#infect()
filetype plugin on

" Current plugins:
"   NERDTree
"   Ctrl-P
"   Tabular
"   Emmet
"   Solarized Colorscheme
"   Commentary
"   Snipmate
"   Airline

autocmd FileType sql setlocal commentstring=--\ %s

set tabstop=2                       " Tabs are 2 columns long
set expandtab                       " Typing Tab produces spaces, not tabs
set softtabstop=2                   " Typing Tab produces 2 spaces
set shiftwidth=2                    " '>' and '<' indents 2 spaces
set autoindent                      " Smart indenting
set number                          " Turn on line numbers
set wrap                            " Wrap text
set linebreak                       " Don't break words at the wrap
set nolist                          " Don't show eol and other chars
set ignorecase                      " Ignore case while searching
set incsearch                       " Start highlighting as you type in search
set scrolloff=5                     " Scroll when 5 lines from top or bottom
set showcmd                         " Show current command & selection length
set t_Co=256                        " Use 256 colors
set nohlsearch                      " Do not highlight all occurrences of a search
syntax enable                       " Turn on syntax highlighting
au FileType * set fo-=c fo-=r fo-=o " kill the auto commenting!!
set background=dark                 " Dark Solarize colorscheme
let g:solarized_termcolors=256      " Make Solarize use built in color palatte
colorscheme solarized               " Colorscheme = solarized
let g:netrw_liststyle=3

""""""""""""""
" Statusline "
""""""""""""""

" testing out a statusline wordcount
" it messes up INSERT mode for some reason...
" function WordCount()
"   let s:old_status = v:statusmsg
"   exe "silent normal g\<c-g>"
"   let s:word_count = str2nr(split(v:statusmsg)[11])
"   let v:statusmsg = s:old_status
"   return s:word_count
" endfunction
" set statusline=\<%n\>\ %t\ \%m\ %{WordCount()}\ words\%=

set laststatus=2                    " Show statusline always
"   Trying out vim-airline...
let g:airline#extensions#wordcount#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#wordcount#filetypes = 'md'
" set statusline=\<%n\>\ %t\ \%m\%=
" set statusline+=C\%c\ \|\ L%l\:%L
" set statusline+=\ \ \[%{strftime('%m\/%d')}
" set statusline+=\ %{strftime('%I:%M\ %p')}\]

"  Highlight current line when in Insert mode
hi CursorLine ctermbg=232 cterm=none
au InsertEnter * set cursorline     " Insert mode line highlighting
au InsertLeave * set nocursorline   " End highlighting outside of Insert mode

"""""""""""""""
" Keybindings "
"""""""""""""""

" no more leader key!  it's all <space>
" let mapleader="<tab>"
nmap <space>; :nohl<cr>
nmap <space>v :90vsplit<cr>
nmap <space>t :NERDTree<cr>
nmap <space>d :20Vexplore<cr>
nmap <space>- O<esc>80i-<esc>j0
nmap <space>u viwu
nnoremap <space>ev :split $MYVIMRC<cr>
nnoremap <space>sv :source $MYVIMRC<cr>
nnoremap <space>' viW<esc>a'<esc>hBi'<esc>lE
nnoremap <space>( viW<esc>a)<esc>hBi(<esc>lE
"  Centers text into a comment line
nnoremap <space>l :center 80<cr>hhv0llr_hvhs/*<esc>lvey$A <esc>pA*/<esc>0
"  Another type of comment line
nnoremap <space>5 O<esc>80i%<esc>jo<esc>80i%<esc>k:center 80<cr>3hv0r%vey$A  <esc>p0k<c-v>ljjr-}
nnoremap <space>, $geld$0
nnoremap <space><space> 0d$
nnoremap <space>o O<esc>
" nmap <space>j :w<cr>:make<cr><cr>:copen<cr>

nnoremap <C-t> :tabnew<cr>:NERDTree<cr>
nnoremap <C-n> :bnext<cr>
" close the buffer, but not the split
nnoremap <C-c> :bprevious\|bwipeout #<cr>
vmap > >gv
vmap < <gv
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

"  Special window layouts
nmap <space>1 :only<cr>:NERDTree<cr><c-w><c-w>:90vsplit<cr>:25split<cr><c-w>t<c-w>l
nmap <space>2 :only<cr>:NERDTree<cr><c-w><c-w>:split<cr><c-w>t<c-w>l
nmap <space>3 :only<cr>:NERDTree<cr><c-w><c-w>:vsplit<cr>:split<cr><c-w>t<c-w>l
nmap <space>4 :only<cr>:NERDTree<cr><c-w><c-w>:vsplit<cr>:split<cr><c-w>l:split<cr><c-w>t<c-w>l

"  Folding keybindings
"  note, requires :set foldmethod=marker
" nnoremap <space>f yiw{o/* <esc>pA {{{ */<esc>:center 80<cr>}O/* }}} */<esc>:center 80<cr>{j
" set foldmethod=marker

"""""""""""""""""""""""""
" SQL specific bindings "
"""""""""""""""""""""""""

"  01/01/2010 -> to_date('01/01/2010','MM/DD/YYYY')
nnoremap <space>std viW<esc>a','MM/DD/YYYY')<esc>Bito_date('<esc>%%
"  TABLE_NAME -> drop table TABLE_NAME;
nnoremap <space>sdt yiwO<esc>pviw<esc>a;<esc>hbidrop table <esc>lel
"  TABLE_NAME -> create table TABLE_NAME nologging as
nnoremap <space>sct viw<esc>a nologging as<esc>bbbicreate table <esc>
"  TABLE_NAME -> drop table/create table TABLE_NAME
nnoremap <space>st viw<esc>a NOLOGGING AS<esc>bbbiCREATE TABLE <esc>wyiwO<esc>pviw<esc>a;<esc>hbiDROP TABLE <esc>j0
"  puts a column into a comma-separated pair of parentheses
"    make sure there's a blank line underneath the list!!
nnoremap <space>s( {jV}kk:s/\n/, /<cr>:nohl<cr>I(<esc>A)<esc>0
"  format list of values to -> ('a', 'b', 'c', etc.)
nnoremap <space>s' vip:s/^/'/<cr>vipk:s/\n/', /<cr>I(<esc>A')<esc>0
"  get the next/previous SQL 'paragraph' to the top of the screen
"  note, overrides tab-switching, which can be done with ctrl-pgdn/pgup
nnoremap gt /select<cr>:nohl<cr>zt
nnoremap gT ?select<cr>:nohl<cr>zt

""""""""""""""""""""""""""""""
" Markdown Specific Bindings "
""""""""""""""""""""""""""""""

" underline with =
nnoremap <space>m= yypVr=o<esc>

" underline with -
nnoremap <space>m- yypVr-o<esc>







""""""""""""""""""""""""""
" Simplenote Integration "
""""""""""""""""""""""""""
" let g:SimplenoteUsername = "username"
" let g:SimplenotePassword = "password"

" source ~/.simplenoterc

" nnoremap <space>nl :Simplenote -l<cr>
" nnoremap <space>nn :Simplenote -n<cr>
" nnoremap <space>nt :Simplenote -t<cr>

"""""""""""""""""""""""""""""""""""
" Abbreviations / Typo correction "
"""""""""""""""""""""""""""""""""""

iabbrev   pateint   patient
iabbrev   PATEINT   PATIENT
iabbrev   patietn   patient
iabbrev   PATIETN   PATIENT
iabbrev   patient_lname  patient_lname
iabbrev   patient_fname  patient_fname
iabbrev   patietn_lname  patient_lname
iabbrev   patietn_fname  patient_fname
iabbrev   patient_lnaem  patient_lname
iabbrev   patient_fnaem  patient_fname
iabbrev   PATIENT_LNAME  PATIENT_LNAME
iabbrev   PATIENT_FNAME  PATIENT_FNAME
iabbrev   PATIETN_LNAME  PATIENT_LNAME
iabbrev   PATIETN_FNAME  PATIENT_FNAME
iabbrev   PATIENT_LNAEM  PATIENT_LNAME
iabbrev   PATIENT_FNAEM  PATIENT_FNAME
iabbrev   adn       and
iabbrev   ADN       AND
iabbrev   soem      some
iabbrev   teh       the





























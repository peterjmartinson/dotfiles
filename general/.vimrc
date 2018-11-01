"  
"  Author:      Peter Martinson
"  Create Date: September 1, 2015
"  
"  type 'vim --version' to see where to save this file
"

set nocompatible

"  Plugin manager
execute pathogen#infect()
execute pathogen#helptags()
filetype plugin on

autocmd FileType sql setlocal commentstring=--\ %s

set tabstop=2                       " Tabs are 2 columns long
set expandtab                       " Typing Tab produces spaces, not tabs
set softtabstop=2                   " Typing Tab produces 2 spaces
set shiftwidth=2                    " '>' and '<' indents 2 spaces
set autoindent                      " Smart indenting
set number                          " Turn on line numbers
set nowrap                          " Do not wrap text
set linebreak                       " Don't break words at the wrap
set nolist                          " Don't show eol and other chars
set ignorecase                      " Ignore case while searching
set incsearch                       " Start highlighting as you type in search
set scrolloff=5                     " Scroll when 5 lines from top or bottom
set showcmd                         " Show current command & selection length
set t_Co=256                        " Use 256 colors
set nohlsearch                      " Do not highlight all occurrences of a search
set history=200                     " Keep history of 200 commands
syntax enable                       " Turn on syntax highlighting
au FileType * set fo-=c fo-=r fo-=o " kill the auto commenting!!
set makeprg=make\ %<

colorscheme gruvbox
set background=dark                 " Dark colorscheme

if &term =~ '256color'  
  " disable Background Color Erase (BCE) so that color schemes  
  " render properly when inside 256-color tmux and GNU screen.  
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html  
  set t_ut=  
endif

set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif



""""""""""""""
" Statusline "
""""""""""""""

set laststatus=2                    " Show statusline always
set statusline=\ %t\ %{fugitive#statusline()}\%m\%=
set statusline+=\ \%c\ \|\ %l\/%L\ 

"""""""""""""""
" Keybindings "
"""""""""""""""

"  slap in a shebang
nnoremap ! i#!/bin/sh<cr><esc>

"  open a file manager
nnoremap <space>e :Explore<cr>
nnoremap <space>v :Vexplore!<cr>
nnoremap <C-t> :Texplore<cr>

"  Put in the current date
nnoremap gp "=strftime('%B %d, %Y')<cr>p
" 80 character rule above current line
nnoremap <space>- O<esc>80i-<esc>j0
"  Centers text into a comment line
nnoremap <space>l :center 80<cr>hhv0llr_hvhs/*<esc>lvey$A <esc>pA*/<cr><esc>
"  Delete current line but leave a blank line there
nnoremap <space><space> 0d$
"  Copy an entire paragraph
nnoremap , yip

"  move screen lines with arrow keys
imap <up> <C-O>gk
imap <down> <C-O>gj
nmap <up> gk
nmap <down> gj
vmap <up> gk
vmap <down> gj

"  Switch splits using CTRL-<motion key>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"  Fugitive bindings
nnoremap gs :Gstatus<cr>

"  Cycle through splits with \ -> save left pinky!
nnoremap \ <C-w>w
nnoremap <C-\> :tabnext<cr>
nnoremap <C-6> <C-^>

"  toggle wrap
nnoremap [w :set wrap<cr>
nnoremap ]w :set nowrap<cr>




"""""""""""""
" Compiling "
"""""""""""""

"  Write and compile
nnoremap <space>c :w<cr>:make<cr>

"  Toggle the Quickfix window open and close
nnoremap <space>q :call QuickfixToggle()<cr>

let g:quickfix_is_open = 0

function! QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
        execute g:quickfix_return_to_window . "wincmd w"
    else
        let g:quickfix_return_to_window = winnr()
        copen
        let g:quickfix_is_open = 1
    endif
endfunction



"""""""""""""""""""""""""
" SQL specific bindings "
"""""""""""""""""""""""""

"  01/01/2010 -> to_date('01/01/2010','MM/DD/YYYY')
nnoremap <space>sd viW<esc>a','MM/DD/YYYY')<esc>Bito_date('<esc>%%
"  TABLE_NAME -> drop table/create table TABLE_NAME
nnoremap <space>st viw<esc>a nologging as<esc>bbbicreate table <esc>wyiwO<esc>pviw<esc>a;<esc>hbidrop table <esc>j0

"  format list of values to -> (a, b, c, etc.)
nnoremap <space>s( vip:sort un<cr>vipk:s/\n/, /<cr>I(<esc>A)<esc>0
"  format list of values to -> ('a', 'b', 'c', etc.)
nnoremap <space>s' vip:sort un<cr>vip:s/^/'/<cr>vipk:s/\n/', /<cr>I(<esc>A')<esc>0

""""""""""""""""""""""""""""""
" Markdown Specific Bindings "
""""""""""""""""""""""""""""""

" underline with =
nnoremap <space>m= yypVr=o<esc>

" underline with -
nnoremap <space>m- yypVr-o<esc>

" Title a journal entry with the date
nnoremap <space>mt ggi# <esc>:put =strftime(\"%A\")<cr>ggJo<cr># <esc>:put =strftime(\"%B\ %d\,\ %Y\")<cr>kJkddyypVr-o<esc>


"""""""""""""""""""""""""""""""""""
" Abbreviations / Typo correction "
"""""""""""""""""""""""""""""""""""

iabbrev   pateint   patient
iabbrev   PATEINT   PATIENT
iabbrev   patietn   patient
iabbrev   PATIETN   PATIENT
iabbrev   patient_name  patient_name
iabbrev   PATIENT_NAME  PATIENT_NAME
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
iabbrev   joni      join





"  here you can put your custom SQL syntax changes
"  ~/.vim/after/syntax/sql.vim
syn keyword sqlStatement join inner outer left right full
syn keyword sqlKeyword   when over partition
syn keyword sqlFunction  row_number datediff dateadd
syn keyword sqlFunction  datepart substring charindex
syn keyword sqlType      year quarter month dayofyear day week
syn keyword sqlType      weekday hour minute second millisecond 

" hi Statement ctermfg=33
" hi Special   ctermfg=33
" hi Function  ctermfg=166
" hi String    ctermfg=136

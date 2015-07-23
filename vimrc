" run pathogen for plugins
execute pathogen#infect()

" remap leader key to ,
let mapleader=","

" turn syntax highlighting on
syntax on

" turn filetype indentation on
filetype plugin indent on

" shortcut to toggle showing invisible characters
nmap <leader>l :set list!<CR>
" set symbols for new line and tab characters
set listchars=tab:▸\ ,eol:¬

" show line numbers
set number

" set tabs and spaces
set ts=4 sts=4 sw=4 noexpandtab

" auto commands
if has("autocmd")

  " automatically set tab spacing according to filetype
  " Enable file type detection
  filetype on
  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
  " Customisations based on house-style (arbitrary)
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
  autocmd FileType python setlocal ts=4 sts=4 sw=4 noexpandtab
  " Treat .rss files as XML
  autocmd BufNewFile,BufRead *.rss setfiletype xml

endif

" run pathogen for plugins
execute pathogen#infect()

" set compatibility off
set nocompatible

" remap leader key to ,
let mapleader=","

" turn syntax highlighting on
syntax on

" turn filetype indentation on
filetype plugin indent on

" shortcut to toggle showing invisible characters
nmap <silent><leader>l :set list!<CR>
" set symbols for new line and tab characters
set listchars=tab:▸\ ,eol:¬

" show line numbers
set number

" set ex history to a lot more
set history=10000

" allow switching between buffers more easy
set hidden

" toggle spell checking
nmap <silent><leader>s :set spell!<CR>

" set tabs and spaces
set ts=4 sts=4 sw=4 noexpandtab

" strip whitespace {{{
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>
" }}}

" set a column ruler
set cc=79

" set appearance to use solarized colorscheme
set background=dark
colorscheme solarized

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" easy indentation mappings
nmap <C-[> <<
nmap <C-]> >>
vmap <C-[> <gv
vmap <C-]> >gv

" visually select last edited/pasted text mapping
nmap gV `[v`]

" quick window focus change mappings
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" mapping to expand current file's path with the edit command
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

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

	" automatically strip trailing whitespace on save
	autocmd BufWritePre *.py,*.js :call <SID>StripTrailingWhitespaces()	

	" source vimrc after saving
	autocmd BufWritePost .vimrc source $MYVIMRC

endif

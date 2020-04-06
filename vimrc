call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'godlygeek/tabular'
Plug 'mileszs/ack.vim'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'preservim/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'valloric/youcompleteme'
Plug 'vim-airline/vim-airline'
call plug#end()

" incremental search
set hlsearch
set incsearch

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

" set invisible characters
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
syntax enable
set background=dark

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

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
	autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
	" Treat .rss files as XML
	autocmd BufNewFile,BufRead *.rss setfiletype xml

	" automatically strip trailing whitespace on save
	autocmd BufWritePre *.py,*.js :call <SID>StripTrailingWhitespaces()	

	" source vimrc after saving
	autocmd BufWritePost .vimrc source $MYVIMRC

endif

" gvim font
set guifont=Input\ Mono\ 10

" airline fonts
let g:airline_powerline_fonts = 1
" backspace fix
set backspace=2

"let g:ycm_global_ycm_extra_conf = '/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_server_keep_logfiles = 1
"let g:ycm_server_log_level = 'debug'

" netrw tweaks
let g:netrw_banner = 0
let g:netrw_liststyle = 3

" 
if has('nvim')
	tnoremap <C-v><Esc> <C-\><C-n>
endif

" search highlighting QOL
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" keep cursor centered in file
set scrolloff=999

" set ack.vim to use ag when available
if executable('ag')
	let g:ackprg = 'ag --vimgrep'
endif

" disable netrw
let loaded_netrwPlugin = 1

" ctrl-p tweaks
let g:ctrlp_custom_ignore = '\v[\/](node_modules)|\.(git|hg|svn)$'

set nocompatible
filetype plugin indent on
syntax on

colorscheme unokai
set t_Co=256

set number
set relativenumber
set tabstop=4
set shiftwidth=4
set colorcolumn=80
set textwidth=80
set cursorline
set ignorecase
set smartcase

set listchars=tab:>-,space:\\xB7,trail:\\xB7,lead:\\xB7,
set list

set splitright
set splitbelow
set nohlsearch
set clipboard=unnamedplus

" Code formater for school 42
" https://github.com/42school/norminette
" Norminette requires Python >=3.10.
function Norm42()
	update
	set errorformat =%P%f:\ Error!
	set errorformat +=Error%.%#(line:%*[\ ]%l\\,\ col:%*[\ ]%c)%.%m
	set errorformat +=%-G%.%#
	let out = system('norminette --no-colors '..expand('%'))
	cgetexpr out
	copen
	cc
endfunction

function BuildC()
	update
	set makeprg=gcc\ -Wall\ -Wextra\ -Werror
	compiler gcc
	make %
	copen
endfunction

"Mappings
let mapleader=" "
map <F5> :call BuildC()<CR>
map <F6> :call Norm42()<CR>
nmap <leader>ev :vs $MYVIMRC<CR>
nmap <leader>so :up %<CR> :so %<CR>
nmap <leader>q :q<CR>
nmap <leader>/ gcc
nmap <leader>t :vs \| :term <CR> 
nmap <leader>w :vs<CR>
nmap <leader>W :sp<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Visal mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv



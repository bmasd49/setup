filetype plugin indent on
call plug#begin()
Plug 'Valloric/YouCompleteMe'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree' 
Plug 'itchyny/lightline.vim'
call plug#end()

set visualbell
set shiftwidth=4
set softtabstop=4
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark='hard'
set autoindent
set splitbelow splitright
set number
set relativenumber
syntax on
set tabstop=4
set mouse+=a
set laststatus=2
set cursorline

if &term =~ '256color'
	    " Disable Background Color Erase (BCE) so that color schemes
		"     " work properly when Vim is used inside tmux and GNU screen.
set t_ut=
endif

let mapleader= " "
nnoremap <leader>rr <ESC>:w<CR>:!python3 %<CR>
nnoremap <leader>rt <ESC>:w<CR>:!pdflatex %<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>sv :wincmd v <bar> :Ex <CR>
nnoremap <leader>sh :wincmd s <bar> :Ex <CR>
nnoremap <leader>= :wincmd =<CR>
inoremap jj <ESC>

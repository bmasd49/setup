filetype plugin indent on
syntax on

call plug#begin()
Plug 'Valloric/YouCompleteMe'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree' 
Plug 'kien/ctrlp.vim'
Plug 'itchyny/lightline.vim'
call plug#end()

colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark='hard'
set visualbell
set shiftwidth=4
set softtabstop=4
set autoindent
set splitbelow splitright
set number
set relativenumber
set tabstop=4
set mouse+=a
set laststatus=2
set cursorline
set clipboard=unnamedplus

if &term =~ '256color'
	    " Disable Background Color Erase (BCE) so that color schemes
		" work properly when Vim is used inside tmux and GNU screen.
set t_ut=
endif

let mapleader= " "
nnoremap <leader>rr <ESC>:w<CR>:!python3 %<CR>
nnoremap <leader>e :NERDTreeToggle<CR>
inoremap jj <ESC>
nnoremap <Enter> o<ESC>





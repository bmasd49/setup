filetype plugin indent on
syntax on

call plug#begin()
Plug 'Valloric/YouCompleteMe'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree' 
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lervag/vimtex'
Plug 'preservim/nerdcommenter'
call plug#end()

if &term =~ '256color'
    set t_ut=
endif

set bg=dark
let g:gruvbox_contrast_dark='medium'

colorscheme gruvbox

"set visualbell
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
let g:tex_flavor= 'latex'
set clipboard=unnamedplus

silent !mkdir -p /tmp/vimUndo
set undodir=/tmp/vimUndo
set undofile

let mapleader= " "
autocmd FileType python nnoremap <leader>r <ESC>:w<CR>:!python3 %<CR>
autocmd FileType c nnoremap <leader>r <ESC>:w<CR>:!gcc % -o %<.out && ./%<.out <CR>
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>t :terminal<CR>:vert resize 20<CR>
inoremap jj <ESC>
nnoremap <Enter> o<ESC>

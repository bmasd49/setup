filetype plugin indent on
syntax on

call plug#begin()
Plug 'Valloric/YouCompleteMe'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree' 
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

"if &term =~ '256color'
"    set t_ut=
"endif

set bg=dark
let g:gruvbox_contrast_dark='hard'

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
set clipboard=unnamedplus

let mapleader= " "
nnoremap <leader>rr <ESC>:w<CR>:!python3 %<CR>
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>t :terminal<CR>:vert resize 20<CR>
inoremap jj <ESC>
nnoremap <Enter> o<ESC>





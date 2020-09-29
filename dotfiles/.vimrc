syntax on
filetype plugin indent on

call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree' 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lervag/vimtex'
Plug 'preservim/nerdcommenter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

" Disable Background Color Erase to avoid annoying ``color bleeding" on 256color terminal
if &term =~ '256color'
	set t_ut=
endif

" set colorscheme
set bg=dark
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

" some basic settings
set noerrorbells visualbell t_vb=
set shiftwidth=4
set softtabstop=4
set tabstop=4
set updatetime=300
set cmdheight=2
set cursorline
set nowrap
set autoindent
set splitbelow splitright
set number
set relativenumber
set hidden
set mouse+=a
set laststatus=2
set spell
setlocal spell spelllang=en_us

set clipboard=unnamedplus
xnoremap <silent> p p:let @+=@0<CR>:let @"=@0<CR> "enable multiple pasting from clipboard in visual mode:

"creating undo files, here I chose /tmp to store them
call mkdir("/tmp/vimUndo", "p", 0700)
set undodir=/tmp/vimUndo
set undofile

"set latex as tex flavor
let g:tex_flavor= 'latex'


let mapleader=" "
autocmd FileType python nnoremap <leader>r <ESC>:w<CR>:!python3 %<CR>
autocmd FileType c nnoremap <leader>r <ESC>:w<CR>:!gcc % -o %<.out && ./%<.out <CR>
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>t :terminal<CR>:vert resize 20<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :GFiles<CR>
inoremap jj <ESC>
nnoremap <Enter> o<ESC>
inoremap <c-k> <up>
inoremap <c-j> <down>
inoremap <c-h> <left>
inoremap <c-l> <right>

" COC stuff:
"
" Go to definition
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction


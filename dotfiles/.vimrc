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
"
if &term =~ '256color'
	set t_ut=
endif

" set colorscheme
set bg=dark
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

"Color column
set colorcolumn=80
" some basic settings
set noerrorbells visualbell t_vb=
set noswapfile
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
"set relativenumber
set hidden
set mouse+=a
set laststatus=2
set incsearch

" spellcheck
set spell spelllang=en_us
hi clear SpellBad                                                
hi SpellBad cterm=underline                                      
hi clear SpellRare                                               
hi SpellRare cterm=underline                                     
hi clear SpellCap                                                
hi SpellCap cterm=underline                                      
hi clear SpellLocal
hi SpellLocal cterm=underline

set clipboard=unnamedplus
xnoremap <silent> p p:let @+=@0<CR>:let @"=@0<CR> "enable multiple pasting from clipboard in visual mode:

"creating undo files, here I chose /tmp to store them
call mkdir("/tmp/vimUndo", "p", 0700)
set undodir=/tmp/vimUndo
set undofile

"set latex as tex flavor
let g:tex_flavor= 'latex'

let mapleader=" "
inoremap jj <ESC>

augroup LatexStuff
	autocmd!
	autocmd FileType tex setlocal wrap nolist linebreak breakat=\ 
	autocmd FileType tex nnoremap j gj
	autocmd FileType tex nnoremap k gk
	autocmd FileType tex vnoremap j gj
	autocmd FileType tex vnoremap k gk
	autocmd FileType tex nnoremap <leader>r \\ll
	autocmd FileType tex nnoremap <leader>a <ESC>i\begin{align*}<CR><CR>\end{align*}<ESC>ki<TAB>
	autocmd FileType tex nnoremap <leader>if <ESC>i\begin{figure}[!ht]<CR>\centering<CR>\includegraphics[width=0.7\textwidth]{}<CR>\caption{}<CR>\end{figure}<ESC>2k$i
	autocmd FileType tex nnoremap <leader>ic <ESC>i$^\circ$C
	autocmd FileType tex nnoremap <leader>r <ESC>:w<CR>
	autocmd FileType tex nnoremap <leader>z <ESC>1z=w
	autocmd FileType tex nnoremap <leader>& <ESC>?=<CR>i&<ESC>$
augroup END

autocmd FileType python nnoremap <leader>r <ESC>:w<CR>:!clear;python3 %<CR>
autocmd FileType c,cpp nnoremap <leader>r <ESC>:w<CR>:!clear;g++ % -o %<.out && ./%<.out <CR>
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :GFiles<CR>
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

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

let g:coc_global_extensions = [
			\'coc-git', 
			\'coc-yank', 
			\'coc-marketplace', 
			\'coc-fzf-preview', 
			\'coc-vimtex', 
			\'coc-sh', 
			\'coc-python', 
			\'coc-clangd', 
			\'coc-json',
			\]

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

"Coc Yank stuff
"
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
let g:vimtex_imaps_leader = ';'


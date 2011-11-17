
set encoding=utf8

filetype plugin on
filetype indent on

syntax on
set hlsearch

set number
set numberwidth=3
set ruler
set cursorline
set title

set t_Co=256
color molokai

set smartindent
set autoindent

set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab

inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

autocmd BufWritePre * :%s/\s\+$//e

"gvim
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guifont=UbuntuMono

"pydiction plugin
let g:pydiction_location = '/home/noxan/.vim/vimfiles/ftplugin/pydiction/complete-dict'


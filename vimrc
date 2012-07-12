
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
color wombat256i

set smartindent
set autoindent

set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab

autocmd BufWritePre * :%s/\s\+$//e

if has('statusline')
    set laststatus=2
    " Broken down into easily includeable segments
    set statusline=%<%f\   " Filename
    set statusline+=%w%h%m%r " Options
    set statusline+=\ [%{&ff}/%Y]            " filetype
    set statusline+=%{fugitive#statusline()} "  Git Hotness
    set statusline+=\ [%{getcwd()}]          " current dir
    set statusline+=\ [A=\%03.3b/H=\%02.2B] " ASCII / Hexadecimal value of char
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%
    " Right aligned file nav info
endif

"completion
set wildmenu
set wildignore+=*.pyc,*.fcgi,*.sock,*.db,*.swp,*.swo,*.meta
set wildmode=list:longest

"folding
set foldmethod=indent
set fillchars=vert:\|,fold:\ ,diff:-

set foldlevel=3
set foldnestmax=3
set foldcolumn=2

"disable dangerous fold commands
noremap zf <Nop>
noremap zF <Nop>
noremap zd <Nop>
noremap zD <Nop>
noremap zE <Nop>

"disable normal arrow-keys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc

"gvim
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guifont=UbuntuMono

"pydiction plugin
let g:pydiction_location = '/home/noxan/.vim/vimfiles/ftplugin/pydiction/complete-dict'


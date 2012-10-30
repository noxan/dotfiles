set nocompatible               " be iMproved, required!
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required!
Bundle 'gmarik/vundle'

" python
Bundle 'klen/rope-vim'
Bundle 'kevinw/pyflakes-vim'

" python-django
Bundle 'gerardo/vim-django-support'

" git
Bundle 'tpope/vim-fugitive'

" coffee-script
Bundle 'kchmck/vim-coffee-script'

set encoding=utf8
set fileformat=unix

filetype plugin on
filetype indent on

let python_highlight_all=1
syntax on
set hlsearch

set number
set numberwidth=3
set ruler
set cursorline
set title

set t_Co=256
color jellybeans

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

" keybindings
nmap <F3> :make %<cr>
nmap <F4> :w<CR>:make<CR>:cc<CR>

"gvim
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guifont=UbuntuMono\ 12

" python bad whitespaces
highlight BadWhitespace ctermbg=red
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Folding based on indentation:
set foldmethod=indent
set nofoldenable

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS


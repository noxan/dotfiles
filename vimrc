" Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'flazz/vim-colorschemes'
Plugin 'wavded/vim-stylus'
Plugin 'digitaltoad/vim-jade'
Plugin 'elzr/vim-json'
Plugin 'mattn/emmet-vim'

call vundle#end()
filetype plugin indent on

" Encoding
set encoding=utf8
set fileformat=unix

" Syntax highlight
syntax on

" Tabs to spaces
set expandtab
" Smart tabs
set smarttab
" Tabs size=2, only python size=4
set shiftwidth=2
set tabstop=2
set softtabstop=2
autocmd FileType python setl shiftwidth=4 tabstop=4 softtabstop=4 et

" Wipe trailing whitespaces, see http://vim.wikia.com/wiki/Remove_unwanted_spaces#Automatically_removing_all_trailing_whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Paste mode
set pastetoggle=<F2>

" allow backspacing over everything in insert mode
" http://stackoverflow.com/questions/3534028/mac-terminal-vim-will-only-use-backspace-when-at-the-end-of-a-line
"set backspace=indent,eol,start

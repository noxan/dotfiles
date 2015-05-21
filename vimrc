" Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'wavded/vim-stylus'
Plugin 'digitaltoad/vim-jade'

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

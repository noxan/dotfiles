" Plugins
call plug#begin('~/.vim/plugged')

" Better js hightlight
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] } " 'branch': 'develop',
" Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
" Plug 'gavocanov/vim-js-indent'
" Plug 'othree/es.next.syntax.vim', { 'for': 'javascript' }
"
" Plug 'sheerun/vim-polyglot'

Plug 'rust-lang/rust.vim'

" Oceanic next color scheme
Plug 'mhartington/oceanic-next'
" Base 16
" Plug 'chriskempson/base16-vim'


" Ctrl-P to find files like in sublime
Plug 'kien/ctrlp.vim'
" Airline, the better status line
Plug 'bling/vim-airline'
" Stylus syntax
Plug 'wavded/vim-stylus', { 'for': 'stylus' }
" Typescript syntax
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
" Git
Plug 'airblade/vim-gitgutter'
" Syntax checker
Plug 'neomake/neomake'
" Plug 'benjie/neomake-local-eslint.vim'
" Handlebars
Plug 'joukevandermaas/vim-ember-hbs', { 'for': 'handlebars' }
" Plug 'mustache/vim-mustache-handlebars', { 'for': 'html.handlebars' }
" Elm
Plug 'lambdatoast/elm.vim'
" Jade / Pug
Plug 'digitaltoad/vim-pug'

call plug#end()

let g:jsx_ext_required = 0

" Color scheme
"let base16colorspace=256
"colorscheme base16-default-light
if (has("termguicolors"))
  set termguicolors
endif
colorscheme OceanicNext
set background=dark

" Syntax enabled
syntax enable

" Line numbers (on the left side)
set number

" Matching brackets
set showmatch

" Line and column numbers in status line
set ruler

" Start scrolling before reaching the end (horizontal and vertical)
set scrolloff=5
set sidescrolloff=5

" Insert spaces instead of tab characters
set expandtab
" Length of one tab in spaces
set tabstop=2
" Indention amount for < and > commands
set shiftwidth=2

" Display trailing and other possible dangerous whitespaces or special characters
set listchars=tab:»\ ,trail:~,extends:>,precedes:<,nbsp:+
set list
" This is excessive mode for whitespace highlighting, useful for debugging
"set listchars=eol:¬,tab:»·,trail:~,extends:>,precedes:<,space:␣

" Highlight trailing whitespaces with a red background in addition
highlight ExtraWhitespace ctermbg=darkred guibg=darkred
match ExtraWhitespace /\s\+$\|\t/

" CtrlP
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Airline
let g:airline_left_sep=''  " Slightly fancier than '>'
let g:airline_right_sep='' " Slightly fancier than '<'
let g:airline_theme='oceanicnext'

" Auto remove trailing whitespaces on save
" http://vim.wikia.com/wiki/Remove_unwanted_spaces<Paste>
autocmd BufWritePre * :%s/\s\+$//e

" Neomake
autocmd! BufWritePost * Neomake
" let g:neomake_verbose=3
let g:neomake_open_list=2
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'
let g:neomake_jsx_enabled_makers = ['eslint']

" Maintain undo history between sessions
set undofile

" Transparent background
highlight Normal ctermbg=none guibg=none

" Paste mode
set pastetoggle=<F3>

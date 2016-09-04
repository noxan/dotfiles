" Plugins
call plug#begin('~/.vim/plugged')

" Better js hightlight
" Plug 'pangloss/vim-javascript', { 'for': 'javascript' } " 'branch': 'develop',
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'mxw/vim-jsx'
Plug 'othree/es.next.syntax.vim', { 'for': 'javascript' }
" Oceanic next color scheme
Plug 'mhartington/oceanic-next'
" Ctrl-P to find files like in sublime
Plug 'kien/ctrlp.vim'
" Airline, the better status line
Plug 'bling/vim-airline'
" Stylus syntax
Plug 'wavded/vim-stylus', { 'for': 'stylus' }
" Typescript syntax
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
" Syntax checker
Plug 'scrooloose/syntastic'

call plug#end()

" Color scheme
if (has("termguicolors"))
  set termguicolors
endif

" Syntax enabled
syntax enable

" Color scheme, part 2
colorscheme OceanicNext
set background=dark

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

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_typescript_checkers = ['tslint']
let g:syntastic_typescript_tslint_exec = './node_modules/.bin/tslint'

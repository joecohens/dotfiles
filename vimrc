set encoding=utf-8
set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My bundles here:
"
" original repos on GitHub
Bundle 'mileszs/ack.vim'
" Vim Extras
Bundle 'kien/ctrlp.vim'
Bundle 'ddollar/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'Lokaltog/vim-powerline'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'jeetsukumaran/vim-buffergator'
Bundle 'tpope/vim-unimpaired'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
" Snippets
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'chrisbra/NrrwRgn'
Bundle 'vim-scripts/ZoomWin'
Bundle 'skalnik/vim-vroom'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tsaleh/vim-matchit'
Bundle 'sjl/gundo.vim'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'tpope/vim-endwise'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'vim-scripts/vimwiki'
Bundle 'ap/vim-css-color'
Bundle 'rgarver/Kwbd.vim'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-dispatch'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'thinca/vim-visualstar'
" vim-scripts repos
" non-GitHub repos
" Git repos on your local machine (i.e. when working on your own plugin)
" a bunch of colorschemes + a gui menu listing them
Bundle 'chriskempson/base16-vim'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'vim-scripts/xoria256.vim'
Bundle "daylerees/colour-schemes", { "rtp": "vim-themes/" }
" Langs
Bundle 'tpope/vim-haml.git'
Bundle 'pangloss/vim-javascript.git'
Bundle 'tpope/vim-cucumber.git'
Bundle 'tpope/vim-markdown.git'
Bundle 'ajf/puppet-vim.git'
Bundle 'rosstimson/scala-vim-support.git'
Bundle 'nono/vim-handlebars.git'
Bundle 'kchmck/vim-coffee-script.git'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-git.git'
Bundle 'timcharper/textile.vim.git'
Bundle 'skwp/vim-rspec.git'
Bundle 'cakebaker/scss-syntax.vim.git'
Bundle 'chrisbra/csv.vim.git'
Bundle 'mmalecki/vim-node.js.git'
Bundle 'vim-ruby/vim-ruby.git'
Bundle 'vim-scripts/Arduino-syntax-file.git'
Bundle 'groenewege/vim-less.git'
Bundle 'wlangstroth/vim-haskell.git'
Bundle 'slim-template/vim-slim.git'
Bundle 'jimenezrick/vimerl.git'
Bundle 'sunaku/vim-ruby-minitest.git'
" Bundle 'guns/vim-clojure-static.git'
" Bundle 'elixir-lang/vim-elixir.git'
Bundle 'jnwhiteh/vim-golang.git'
Bundle 'hhvm/vim-hack.git'
" Snippets
Bundle 'joecohens/joe-snippets-vim'
Bundle 'markwu/vim-laravel4-snippets'
" ...

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.

set t_Co=256
let base16colorspace=256  " Access colors present in 256 colorspace
set background=dark
colorscheme xoria256
syntax on

set guifont=Menlo\ for\ Powerline:h14
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set go-=L " Removes left hand scroll bar
set linespace=15
 
set showmode                    " always show what mode we're currently editing in
set nowrap                      " don't wrap lines
set tabstop=4                   " a tab is four spaces
set smarttab
set smartindent
"set tags=tags
set tags=.tags
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set number                      " always show line numbers
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
set timeout timeoutlen=200 ttimeoutlen=100
set visualbell           " don't beep
set noerrorbells         " don't beep
set autowrite  "Save on buffer switch
set mouse=a
 
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","
 
" Fast saves
nmap <leader>w :w!<cr>
 
" Down is really the next line
nnoremap j gj
nnoremap k gk
 
"Easy escaping to normal model
imap jj <esc>
 
"Auto change directory to match current file ,cd
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
 
"easier window navigation
 
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
 
"Resize vsplit
nmap <C-v> :vertical resize +5<cr>
nmap 25 :vertical resize 40<cr>
nmap 50 <c-w>=
nmap 75 :vertical resize 120<cr>
 
nmap <C-b> :NERDTreeToggle<cr>
let NERDTreeShowHidden=1

"Load the current buffer in Chrome
nmap ,c :!open -a Google\ Chrome<cr>
 
"Show (partial) command in the status line
set showcmd
 
" Create split below
nmap :sp :rightbelow sp<cr>
 
" Quickly go forward or backward to buffer
nmap :bp :BufSurfBack<cr>
nmap :bn :BufSurfForward<cr>
 
highlight Search cterm=underline
 
" Swap files out of the project root
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

" Easy motion stuff
" let g:EasyMotion_leader_key = '<Leader>'
 
" Powerline (Fancy thingy at bottom stuff)
let g:Powerline_symbols = 'fancy'
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

" Surround Vim
vmap s S

" BufferGator
let g:buffergator_suppress_keymaps = 1

autocmd cursorhold * set nohlsearch
autocmd cursormoved * set hlsearch
 
" Remove search results
command! H let @/=""
 
" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Run PHPUnit tests
map <Leader>t :!phpunit %<cr>
 
" Abbreviations
abbrev pft PHPUnit_Framework_TestCase
 
abbrev gm !php artisan generate:model
abbrev gc !php artisan generate:controller
abbrev gmig !php artisan generate:migration
 
" Auto-remove trailing spaces
autocmd BufWritePre *.php :%s/\s\+$//e
 
" Edit todo list for project
nmap ,todo :e todo.txt<cr>

" Laravel framework commons
nmap <leader>lr :e app/routes.php<cr>
nmap <leader>lca :e app/config/app.php<cr>81Gf(%O
nmap <leader>lcd :e app/config/database.php<cr>
nmap <leader>lc :e composer.json<cr>
 
" Concept - load underlying class for Laravel
function! FacadeLookup()
    let facade = input('Facade Name: ')
    let classes = {
\       'Form': 'Html/FormBuilder.php',
\       'Html': 'Html/HtmlBuilder.php',
\       'File': 'Filesystem/Filesystem.php',
\       'Eloquent': 'Database/Eloquent/Model.php'
\   }
 
    execute ":edit vendor/laravel/framework/src/Illuminate/" . classes[facade]
endfunction
nmap ,lf :call FacadeLookup()<cr>
 
" CtrlP Stuff
 
" Familiar commands for file/symbol browsing
map <D-p> :CtrlP<cr>
" map <C-r> :CtrlPBufTag<cr>
 
" I don't want to pull up these folders/files when calling CtrlP
set wildignore+=*/vendor/**
set wildignore+=*/public/forum/**
set wildignore+=*/app/assets/vendor/components/**
 
" Open splits
nmap vs :vsplit<cr>
nmap sp :split<cr>
 
" Create/edit file in the current directory
nmap :ed :edit %:p:h/
 
" Prepare a new PHP class
function! Class()
    let name = input('Class name? ')
    let namespace = input('Any Namespace? ')
 
    if strlen(namespace)
        exec 'normal i<?php namespace ' . namespace . ';
    else
        exec 'normal i<?php
    endif
 
    " Open class
    exec 'normal iclass ' . name . ' {^M}^[O^['
    
    exec 'normal i^M    public function __construct()^M{^M ^M}^['
endfunction
nmap ,1  :call Class()<cr>
 
" Add a new dependency to a PHP class
function! AddDependency()
    let dependency = input('Var Name: ')
    let namespace = input('Class Path: ')
 
    let segments = split(namespace, '\')
    let typehint = segments[-1]
 
    exec 'normal gg/construct^M:H^Mf)i, ' . typehint . ' $' . dependency . '^[/}^>O$this->^[a' . dependency . ' = $' . dependency . ';^[?{^MkOprotected $' . dependency . ';^M^[?{^MOuse ' . namespace . ';^M^['
 
    " Remove opening comma if there is only one dependency
    exec 'normal :%s/(, /(/g
'
endfunction
nmap ,2  :call AddDependency()<cr>


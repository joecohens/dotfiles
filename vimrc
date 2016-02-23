set encoding=utf-8
set nocompatible
filetype off

"---------Vundle--------"
" set the runtime path to include Vundle and initialize
set rtp+=~/.dotfiles/vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"---------Plugins--------"
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-powerline'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'tpope/vim-unimpaired'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'mattn/gist-vim'
Plugin 'ap/vim-css-color'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-dispatch'
Plugin 'terryma/vim-multiple-cursors'
"---------Themes--------"
Plugin 'chriskempson/base16-vim'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'vim-scripts/xoria256.vim'
Plugin 'daylerees/colour-schemes', { 'rtp': 'vim-themes/' }
"---------Lang Support--------"
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-markdown'
Plugin 'nono/vim-handlebars'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-git'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'chrisbra/csv.vim.git'
Plugin 'mmalecki/vim-node.js'
Plugin 'vim-ruby/vim-ruby'
Plugin 'groenewege/vim-less'
Plugin 'jimenezrick/vimerl'
Plugin 'guns/vim-clojure-static'
Plugin 'elixir-lang/vim-elixir'
Plugin 'jnwhiteh/vim-golang'
Plugin 'hhvm/vim-hack'
"---------Snippets--------"
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'joecohens/joe-snippets-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"---------Theme--------"
syntax enable
set t_Co=256
let base16colorspace=256                    " Access colors present in 256 colorspace
set background=dark
colorscheme xoria256
set noerrorbells visualbell t_vb=           " Disable error bells

set guifont=Menlo\ for\ Powerline:h14
set guioptions-=e
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set linespace=15

" Powerline (Fancy thingy at bottom stuff)
let g:Powerline_symbols = 'fancy'
set laststatus=2                            " Always show the statusline
set noshowmode                              " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set showcmd                                 " Show (partial) command in the status line

"---------General Settings--------"
let mapleader = ","
let g:mapleader = ","

" Swap files out of the project root
set backupdir=~/.dotfiles/vim/backup//
set directory=~/.dotfiles/vim/swap//

set number                                  " always show line numbers
set backspace=indent,eol,start              " allow backspacing over everything in insert mode
set nowrap                                  " don't wrap lines
set mouse=a
set tags=.tags

"---------Search--------"
set hlsearch
set incsearch

"Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>

"---------Splits--------"
set splitbelow                               " Make splits default to below...
set splitright                               " And to the right. This feels more natural.

"We'll set simpler mappings to switch between splits.
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

"---------Mappings--------"
nmap <Leader>ev :tabedit $MYVIMRC<cr>       " Make it easy to edit the Vimrc file.
nmap :ed :edit %:p:h/                       " Create/edit file in the current directory
nmap <leader>w :w!<cr>                      " Fast saves
imap jj <esc>                               " Easy escaping to normal model
nmap <leader>f :tag<space>                  " Searching with ctags
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>          " Auto change directory to match current file ,cd

nmap ,c :!open -a Google\ Chrome<cr>        " Load the current buffer in Chrome

nmap :bp :BufSurfBack<cr>                   " Quickly go backward to buffer
nmap :bn :BufSurfForward<cr>                " Quickly go forward to buffer

vmap s S                                    " Surround Vim

"---------Auto-Commands--------"

"Automatically source the Vimrc file on save.
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END

"---------Plugins Config--------"
map <D-p> :CtrlP<cr>                        " Familiar commands for file/symbol browsing
map <D-r> :CtrlPBufTag<cr>                  " Familiar commands for file/symbol browsing
map <D-e> :CtrlPMRUFiles<cr>                " Browse most recent files

let g:ctrlp_custom_ignore = 'node_modules\DS_Store\bower_components\|git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

" I don't want to pull up these folders/files when calling CtrlP
set wildignore+=*/vendor/**
set wildignore+=*/node_modules/**
set wildignore+=*/bower_components/**

nmap <D-1> :NERDTreeToggle<cr>              " Toggle nerd tree
let NERDTreeHijackNetrw = 0

"---------PHPhelpers--------"
map <Leader>t :!phpunit %<cr>               " Run PHPUnit tests
abbrev pft PHPUnit_Framework_TestCase       " Abbreviations

abbrev gm !php artisan make:model
abbrev gc !php artisan make:controller
abbrev gmig !php artisan make:migration

autocmd BufWritePre *.php :%s/\s\+$//e      " Auto-remove trailing spaces

" Laravel framework commons
nmap <leader>lca :e config/app.php<cr>
nmap <leader>lc :e composer.json<cr>

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

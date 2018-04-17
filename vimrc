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
Plugin 'vim-airline/vim-airline'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'tpope/vim-unimpaired'
Plugin 'ervandew/supertab'
" Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'ap/vim-css-color'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-dispatch'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'w0rp/ale'
"---------Themes--------"
" Plugin 'chriskempson/base16-vim'
" Plugin 'chriskempson/vim-tomorrow-theme'
" Plugin 'vim-scripts/xoria256.vim'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'joshdick/onedark.vim'
" Plugin 'herrbischoff/cobalt2.vim'
" Plugin 'daylerees/colour-schemes', { 'rtp': 'vim-themes/' }
"---------Lang Support--------"
Plugin 'sheerun/vim-polyglot'
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

" Airline (Fancy thingy at bottom stuff)
set laststatus=2                            " Always show the statusline
set noshowmode                              " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set showcmd                                 " Show (partial) command in the status line

syntax enable
set termguicolors
set background=dark
let g:onedark_termcolors=254
let g:onedark_terminal_italics=1
" let g:airline_theme='cobalt2'
" colorscheme cobalt2
set noerrorbells visualbell t_vb=           " Disable error bells

set guifont=Menlo:h15
set guioptions-=e
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set linespace=15

set list
set listchars=tab:>.,trail:.,extends:\#,nbsp:.

"---------General Settings--------"
let mapleader = ","
let g:mapleader = ","

" Swap files out of the project root
set backupdir=~/.dotfiles/vim/backup//
set directory=~/.dotfiles/vim/swap//

set undofile 
set undodir=~/.vim-undo

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
augroup autosourcin
    autocmd!
    autocmd BufWritePost ~/.vimrc source %
augroup END

"---------Plugins Config--------"
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag --literal --files-with-matches --nocolor --hidden -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif

nmap <Leader>n :NERDTreeToggle<cr>          " Toggle nerd tree
nmap <Leader>r :NERDTreeFind<cr>
let NERDTreeHijackNetrw = 0

let g:jsx_ext_required = 0                  " Allow JSX in normal JS files

"---------PHPhelpers--------"
map <Leader>t :!phpunit %<cr>               " Run PHPUnit tests
autocmd BufWritePre *.php :%s/\s\+$//e      " Auto-remove trailing spaces

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

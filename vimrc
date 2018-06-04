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
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-airline/vim-airline'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'tpope/vim-unimpaired'
Plugin 'ervandew/supertab'
Plugin 'godlygeek/tabular'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-surround'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'ap/vim-css-color'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-dispatch'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'w0rp/ale'
Plugin 'airblade/vim-gitgutter'
Plugin 'raimondi/delimitmate'
Plugin 'alvan/vim-closetag'
Plugin 'christoomey/vim-tmux-navigator'
if has('nvim')
  Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plugin 'Shougo/deoplete.nvim'
  Plugin 'roxma/nvim-yarp'
  Plugin 'roxma/vim-hug-neovim-rpc'
endif
"---------Themes--------"
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Addisonbean/Vim-Xcode-Theme'
Plugin 'vim-scripts/bw.vim'
Plugin 'herrbischoff/cobalt2.vim'
"---------Lang Support--------"

Plugin 'sheerun/vim-polyglot'
"---------Snippets--------"
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
" Plugin 'joecohens/joe-snippets-vim'

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

set laststatus=2                            " Always show the statusline
set noshowmode                              " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set showcmd                                 " Show (partial) command in the status line

syntax enable
" set termguicolors
set background="dark"
colorscheme bw
let g:airline_theme="minimalist"
hi LineNr cterm=NONE ctermfg=DarkGray

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif

set list
set listchars=tab:>.,trail:.,extends:\#,nbsp:.

set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting

set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

"---------General Settings--------"
let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

nnoremap ; :

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

set expandtab

"---------Search--------"
set hlsearch
set incsearch

" Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>

"---------Splits--------"
set splitbelow                               " Make splits default to below...
set splitright                               " And to the right. This feels more natural.

"---------Mappings--------"
inoremap jj <Esc>
nmap <Leader>ev :tabedit $MYVIMRC<cr>       " Make it easy to edit the Vimrc file.

nmap <Leader>bp :BufSurfBack<cr>            " Quickly go backward to buffer
nmap <Leader>bn :BufSurfForward<cr>         " Quickly go forward to buffer

vmap s S                                    " Surround Vim

"---------Auto-Commands--------"

" Automatically source the Vimrc file on save.
augroup autosourcin
    autocmd!
    autocmd BufWritePost ~/.vimrc source %
augroup END

"---------Plugins-Config--------"
let g:airline#extensions#ale#enabled = 1
let g:deoplete#enable_at_startup = 1

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

let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

"---------PHP-Helpers--------"
map <Leader>t :!phpunit %<cr>               " Run PHPUnit tests


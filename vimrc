set encoding=utf-8
set nocompatible
filetype off
set re=0

"---------vim-plug--------"
call plug#begin('~/.vim/bundle')

"---------Plugins--------"
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'editorconfig/editorconfig-vim'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-dispatch'
Plug 'terryma/vim-multiple-cursors'
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'raimondi/delimitmate'
Plug 'alvan/vim-closetag'
Plug 'mattn/emmet-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'github/copilot.vim'
" Plug 'tpope/vim-unimpaired'

if has('nvim')
  Plug 'nvim-lualine/lualine.nvim'
  " If you want to have icons in your statusline choose one of these
  Plug 'nvim-tree/nvim-web-devicons'
endif

"---------Themes--------"


"--------- Lang Support--------"
Plug 'sheerun/vim-polyglot'
Plug 'alampros/vim-styled-jsx'

"---------Snippets--------"
Plug 'honza/vim-snippets'

" All of your Plugins must be added before the following line
call plug#end()            " required

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

"---------Theme--------"

set laststatus=2                            " Always show the statusline
set noshowmode                              " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set showcmd                                 " Show (partial) command in the status line

syntax enable
" set termguicolors
" set background="black"
hi LineNr cterm=NONE ctermfg=DarkGray

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  else
    set guifont=Menlo\ Regular:h14
  endif
endif

set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting

set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
set t_vb=

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
" set mouse=a
set tags=.tags

set smartindent
set shiftwidth=2
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

if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif

"---------Auto-Commands--------"

" Automatically source the Vimrc file on save.
augroup autosourcin
    autocmd!
    autocmd BufWritePost ~/.vimrc source %
augroup END

"---------Plugins-Config--------"
let g:ctrlp_custom_ignore = '\v[\/](node_modules|vendor)|(\.(swp|ico|git|svn))$'

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
let g:NERDDefaultAlign = 'right'
let g:NERDTreeWinPos = "right"

let g:user_emmet_expandabbr_key='<Tab>'
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}
let g:jsx_ext_required = 0

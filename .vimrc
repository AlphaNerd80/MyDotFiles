
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-repeat'
Bundle 'kien/ctrlp.vim'
Bundle 'plasticboy/vim-markdown'
Bundle 'sjl/gundo.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Lokaltog/powerline'

filetype plugin indent on
   
set textwidth=79
set shiftwidth=4
set tabstop=4
set expandtab
set softtabstop=4
set shiftround
set autoindent

set fileformats=unix,dos
set nobackup
set ignorecase
set smartcase
set hlsearch
set incsearch
set number
set showmatch
syntax on
highlight Comment ctermfg=LightCyan
set wrap

"maps
map <F2> :NERDTreeToggle<CR>

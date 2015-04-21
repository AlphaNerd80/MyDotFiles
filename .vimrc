

" .vimrc

" {{{ Vundle
" Of course
set nocompatible

" Required Vundle setup
filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'



" :Ack
Plugin 'mileszs/ack.vim'

" Better status line 
Plugin 'bling/vim-airline'

" " ga for character descriptions
Plugin 'tpope/vim-characterize'

" " :Gdiff, :Gcommit, etc.
Plugin 'tpope/vim-fugitive'

" " Markdown syntax
Plugin 'tpope/vim-markdown'

" " Add support for github-style fenced codeblocks in markdown
Plugin 'jtratner/vim-flavored-markdown.git'

" " Python syntax folding
Plugin 'tmhedberg/SimpylFold'

" " Syntax, linting, etc.
Plugin 'scrooloose/syntastic'

" " Clojure syntax
" Plugin 'vim-scripts/VimClojure'

" " Solarized theme
Plugin 'altercation/vim-colors-solarized'

" " Somewhat improved Javascript syntax
Plugin 'pangloss/vim-javascript'

" " JSON syntax highlighting
Plugin 'leshill/vim-json'

" " Fuzzy finding
Plugin 'kien/ctrlp.vim'

" " Comment with gc
Plugin 'tpope/vim-commentary'

" " Amazing mappings
Plugin 'tpope/vim-unimpaired'

" " Repeat things
Plugin 'tpope/vim-repeat'

" " JSON pretty printing with gqaj
Plugin 'tpope/vim-jdaddy'

" " git runtime files - highlight git config, commit, etc.
Plugin 'tpope/vim-git'

" " Inline git status
Plugin 'airblade/vim-gitgutter'

" " Coffeescript
Plugin 'kchmck/vim-coffee-script'

" " YouCompleteMe
Plugin 'Valloric/YouCompleteMe'


"Testing with Vim-Jedi
"Plugin 'davidhalter/jedi-vim'

" " TernJS
Plugin 'marijnh/tern_for_vim'

" " Open current Markdown buffer in Marked2
Plugin 'itspriddle/vim-marked'

" " Better rainbow parens
Plugin 'luochen1990/rainbow'

"LESS syntax
Plugin 'groenewege/vim-less'

"delimitmate
Plugin 'Raimondi/delimitMate'

"NERDTree
Plugin 'scrooloose/nerdtree'

"vim-flake8
Plugin 'nvie/vim-flake8'

"vim-pyunit
" Plugin 'nvie/vim-pyunit'

"vim-python-pep8-indent
Plugin 'hynek/vim-python-pep8-indent'


"######################################################
"   reference https://github.com/amic/vimrc
"######################################################

"snipmate
"snipmate prereqs
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'

Plugin 'garbas/vim-snipmate'

"BufExplorer
Plugin 'vim-scripts/bufexplorer.zip'

"Zencoding
Plugin 'mattn/emmet-vim'

"vim indent object
Plugin 'michaeljsmith/vim-indent-object'

"taglist
Plugin 'vim-scripts/taglist.vim'

"vim-multipl-cursors
Plugin 'terryma/vim-multiple-cursors'

"goyo
Plugin 'junegunn/goyo.vim'

"vim-zenroom2
Plugin 'amix/vim-zenroom2'

"########### MODES ###########
"nginx.vim
Plugin 'vim-scripts/nginx.vim'

"Colors
Plugin 'vim-scripts/peaksea'
Plugin 'wgibbs/vim-irblack'
Plugin 'therubymug/vim-pyte'


call vundle#end()


syntax enable
filetype plugin indent on

" SETUP
set encoding=utf-8
set termencoding=utf-8
set hidden
let mapleader="\\"

" cases for search
set ignorecase
set smartcase
set incsearch

set textwidth=100
set nowrap
set shiftwidth=4
set tabstop=4
set expandtab
set softtabstop=4
set shiftround
set autoindent
set number
set showmatch

set more
set autoread

set showcmd
set showmode

" get rid of the swap files as they are ANNOYING
set noswapfile


"
"OMNI completion
"
set omnifunc=syntaxcomplete#Complete

set updatetime=750

"
"ACK
"
let g:ackprg="ack --noenv -H --nocolor -nogroup --column --smartcase --after=0 --before=0"
map <C-a> :Ack

"
"Airline
"
let g:airline_powerline_fonts = 1

"if !exists('g:airline_mode_map')
"    let g:airline_mode_map = {}
"endif

" let g:airline_mode_map = { '_' : '-', 'n' : 'N', 'i' : 'I', 'R' : 'R', 'c' : 'C', 'v' : 'V', 'V' : 'V', '' : 'V', 's' : 'S', 'S' : 'S', '' : 'S' }

" Orange modified status
function! AirlineThemeModified(palette)
    let a:palette.normal_modified.airline_c = ['#93a1a1', '#cb4b16', 254, 166, '']
    let a:palette.insert_modified.airline_c = ['#93a1a1', '#cb4b16', 254, 166, '']
    let a:palette.visual_modified.airline_c = ['#93a1a1', '#cb4b16', 254, 166, '']
    let a:palette.inactive_modified.airline_c =['#cb4b16', '', 166, '', '']" 
endfunction

let g:airline_theme_patch_func = 'AirlineThemeModified'
let g:airline#extensions#tabline#enabled = 1

"
"Autocmd
"
if has("autocmd")
    "Clear existing autocommands before defining them, in case this file is loaded again
    autocmd!

    augroup last_cursor
        au!
        " Jump to last cursor position unless it's invalid or in an event handler
        " or
        " a git commit
        au BufReadPost * 
                    \ if &filetype !~ '^git\c' && 
                    \line("'\"") > 0 && line("'\"") <= line("$") 
                    \ | exe "normal! g`\"" |
                    \ endif
    augroup END
    "augroup cursor_highlight
    ""    au!
    "    " Only show cursorline in active windows
    ""    au WinLeave * set nocursorline colorcolumn=""
    ""    au WinEnter * set cursorline colorcolumn=+1
    "augroup END
    
    augroup coffescript
        au!
        " Automatically set coffeescript filetype; necessary because of some vundle filetype issue
        au BufNewFile,BufRead *.coffee setlocal filetype=coffee
    augroup END

    augroup markdown
        au!
        " Automatically use github-flavored markdown
        au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
    augroup END
endif


"
"Flake8
"
autocmd BufWritePost *.py call Flake8()




"
"Ctrl-p
"
let g:ctrlp_map = '<c-p>'

"
"Diff
"
set diffopt+=vertical

"
" Folding
" 
" Fold with triple curly braces, fill with spaces
if has("folding")
 set foldenable
 set foldmethod=marker
 set foldopen=hor,search,tag,undo
 set fillchars=diff:\ ,fold:\ ,vert:\
endif

"
"highlight the first column after the text width
"
if exists("&colorcolumn")
    set colorcolumn=+1
endif

"
"format options
"
set formatoptions+=t,c,r,o,n
" Delete comment character when joining commented lines
if v:version > 703 || v:version == 703 && has("patch541")
    set formatoptions+=j
endif
" Use only 1 space after "." when joining lines instead of 2
set nojoinspaces
"au FileType c,cpp,h set cindent formatoptions+=ro
au FileType xhtml,xml,html set textwidth=0
au FileType make set noexpandtab shiftwidth=8
au FileType python set expandtab shiftwidth=4 softtabstop=4 tabstop=4 autoindent
au FileType javascript set tabstop=4 shiftwidth=4 expandtab textwidth=100
au FileType coffeescript set tabstop=4 shiftwidth=4 expandtab textwidth=100

"
"Fugitive
"
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gl :Glog<cr>
nnoremap <leader>gp :Git push<cr>
nnoremap <leader>gs :Git status -sb<cr>

"
"git-gutter
"
" Escape grep so we don't have color codes
let g:gitgutter_escape_grep = 1
" Ignore whitespace (we have other plugins for that)
let g:gitgutter_diff_args = '-w'
" Don't map any keys by default
let g:gitgutter_map_keys = 0
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

"
"NERDTree
"
map <F9> :NERDTreeToggle<CR>

let NERDTreeChDirMode = 2

"
"turn off syntastic for html
"
let g:syntastic_mode_map = { 'mode' : 'active', 'active_filetypes' : [], 'passive_filetypes' : ['html'] }
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'
let g:syntastic_check_on_open = 1

"
"better redraw for large files
"
set ttyfast

"
"persist undo
"
if has("persistent_undo")
    set undodir=~/.vim/undodir
    set undofile
    set undolevels=1000
    set undoreload=10000
endif



"
"My Mappings
"

"reload .vimrc on changes
augroup myvimrc
        au!
            au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
        augroup END



"
" Epilog
"
"

map <leader>w <C-w>w
map <leader>W <C-w>W
map <leader>_ <C-w>_
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

syntax on

set background=dark

let g:solarized_termtrans = 1
let g:solarized_underline = 0
silent! colorscheme solarized

hi Folded term=standout ctermfg=3 ctermbg=none

highlight link SignColumn LineNr
highlight link GitGutterAdd DiffAdd
highlight link GitGutterChange DiffChange
highlight link GitGutterDelete DiffDelete
highlight link GitGutterChangeDelete DiffDelete


"########### Key mappings
"
"bufexplorer
map <leader>o :BufExplorer<cr>


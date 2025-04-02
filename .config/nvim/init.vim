" ========================
" Plugin Manager
" ========================

" Auto-install plugin manager
if empty(glob($MYVIMDIR . 'autoload/plug.vim'))
    silent execute '!curl -fLo '.$MYVIMDIR.'autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" Plugins
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy Finder
Plug 'junegunn/fzf.vim'                             " FZF Vim Options
Plug 'akinsho/bufferline.nvim'                      " Buffer Bar
Plug 'itchyny/lightline.vim'                        " Status Bar
Plug 'nvim-tree/nvim-web-devicons'                  " Glyphs
Plug 'neoclide/coc.nvim', { 'branch': 'release' }   " LSP
Plug 'tpope/vim-fugitive'                           " Git
Plug 'tpope/vim-commentary'                         " Comments
Plug 'raimondi/delimitmate'                         " Brackets
Plug 'tpope/vim-sleuth'                             " Auto Adjust Indent
Plug 'folke/which-key.nvim'                         " Keybindings
Plug 'lukas-reineke/indent-blankline.nvim'          " Indent Lines

Plug 'nvim-lua/plenary.nvim'                        " Dependency (File Tree, Todo)
Plug 'MunifTanjim/nui.nvim'                         " Dependency (File Tree)
Plug 'folke/todo-comments.nvim'                     " Todo Highlights
Plug 'nvim-neo-tree/neo-tree.nvim'                  " File Tree

call plug#end()

"Plug 'moll/vim-bbye'                               " Persistent Splits
"Plug 'tpope/vim-obsession'                         " Persistent Sessions
"Plug 'SirVer/ultisnips'                            " Snippet Manager
"Plug 'puremourning/vimspector'                     " Debugger

" ========================
" Colorscheme
" ========================

" Light: morning, peachpuff
" Dark: default, base16-ashes, slate, desert, habamax, sorbet
" Both: wildcharm, retrobox, lunaperche
" Lightline: PaperColor, Tomorrow_Night_Eighties, deus

set termguicolors
set background=dark
colorscheme default
let lightline_colorscheme = 'PaperColor'

" ========================
" General Settings
" ========================

" Behavior
syntax enable           " Enable syntax highlighting
set nocompatible        " Disable Vi-compatible mode
set hidden              " Enable hidden (bg) buffers
set mouse=a             " Enable mouse support
set encoding=utf-8      " Use utf-8 encoding
set clipboard=unnamed   " Enabling system clipboard

" Line
set number              " Show line numbers
set linebreak           " Don't break in between words
set nofixeol            " Don't restore missing eol

" Undos, Backups & Swaps
set noswapfile          " Don't use swap files
set nobackup            " Don't use backup files
set nowritebackup       " Don't backup before overwrite

" Indents
set breakindent         " Continue indent on wrap
set autoindent          " Keep current indent on subsequent lines
set smartindent         " Guess and auto apply indents

" Scroll
set scrolloff=8         " Keep cursor 8 lines away from top/bottom
set sidescrolloff=8     " Keep cursor 8 lines away from left/right

" Search
set incsearch           " Live highlight matches
set hlsearch            " Highlight all matches
set ignorecase          " Case insensitive search
set smartcase           " Unless uppercase is used

" UI
set signcolumn=yes      " Always show signcolumn
set laststatus=2        " Enable status line
set cursorline          " Enable cursor line indicator
set wildmenu            " Enable command mode completions
set noshowmode          " Hide display mode below status bar

" Spaces and Tabs
set tabstop=4
set shiftwidth=4
set expandtab

" Performance
set updatetime=250
set timeoutlen=300

" Whitespace Characters
set list
set listchars=tab:»\ ,trail:·,extends:>,precedes:<,nbsp:␣

" Splits
set splitright
set splitbelow

" ========================
" Keymaps
" ========================

" Space as leader
let mapleader = " "

" Buffer navigation
nnoremap <S-L> :bnext<CR>
nnoremap <S-H> :bprev<CR>

" Split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Resize splits
nnoremap <S-Left>  <C-w><
nnoremap <S-Down>  <C-w>-
nnoremap <S-Up>    <C-w>+
nnoremap <S-Right> <C-w>>

" Reposition cursor
nnoremap J mzJ`z
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
nnoremap N Nzzzv

" Misc
nnoremap // :noh<CR>
nnoremap Q :bdelete! %<CR>
nnoremap <leader>qq :qa!<CR>

" Todo Comments
nnoremap ]t :lua require('todo-comments').jump_next()<CR>
nnoremap [t :lua require('todo-comments').jump_prev()<CR>

" Neo Tree
nnoremap <C-n> :Neotree toggle<CR>

" ========================
" Plugin Configurations
" ========================

" Todo Comments
lua << EOF
require('todo-comments').setup{}
EOF

" Bufferline
lua << EOF
require('bufferline').setup{}
EOF

" Indent Blankline
lua << EOF
require("ibl").setup{}
EOF

" Lightline
let g:lightline = {
    \ 'enable' : {
    \   'tabline': 0
    \ },
    \ 'colorscheme': lightline_colorscheme,
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'cocstatus', 'readonly', 'filename', 'modified', 'gitbranch' ] ]
    \ },
    \ 'component_function': {
    \   'cocstatus': 'coc#status',
    \   'gitbranch': 'FugitiveHead'
    \ },
    \ }
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" FZF
let g:fzf_vim = {}
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9, 'relative': v:true } }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
nnoremap <Leader>ff :Files<CR>|   " Find files
nnoremap <Leader>fb :Buffers<CR>| " Find buffers
nnoremap <Leader>fr :History<CR>| " Find recent files
nnoremap <Leader>fh :Help<CR>|    " Find help tags
nnoremap <Leader>ft :GFiles<CR>|  " Search git tracked files
nnoremap <Leader>fc :GFiles?<CR>| " Search git changed files
nnoremap <Leader>fg :Rg<CR>|      " Live grep project directory
nnoremap <Leader>fl :BLines<CR>|  " Grep lines in current buffer

" CoC Settings
" For adding new lsps:
"   1 - add in coc_global_extensions list
"   2 - add filetype in coc-settings.vim @ line 84 (setting up formatexpr)
let g:coc_global_extensions = ['coc-git', 'coc-vimlsp', 'coc-json', 'coc-sh', 'coc-java', 'coc-pyright']
" Source coc vim settings if it exists
if filereadable(expand('$XDG_CONFIG_HOME/nvim/coc-settings.vim'))
    source $XDG_CONFIG_HOME/vim/coc-settings.vim
endif

" Start Obsession (Auto session saving)
" autocmd VimEnter * Obsession

"""""""""""
" plugins "
"""""""""""

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf.vim'                           " fuzzy finder
Plug 'preservim/nerdtree'                         " file explorer
Plug 'tpope/vim-commentary'                       " code commenting
Plug 'sheerun/vim-polyglot'                       " languages & syntax
Plug 'itchyny/lightline.vim'                      " status line alternative
Plug 'airblade/vim-gitgutter'                     " git diff indicators
Plug 'tpope/vim-fugitive'                         " git integration

" Plug 'dense-analysis/ale'                       " linting and formatting
" Plug 'neoclide/coc.nvim', {'branch': 'release'} " modern completion engine
" Plug 'SirVer/ultisnips'                         " snippets manager

call plug#end()

"""""""""""
" options "
"""""""""""

" recommended colorschemes
" light : shine, lunarperche
" dark  : retrobox, pablo, habamax

" colorscheme
color lunaperche

" lines
set number
set linebreak

" splits
set splitright
set splitbelow

" search
set ignorecase
set smartcase
set showmatch

" backups
set nobackup
set noswapfile
set noundofile

" indents
set tabstop=4
set shiftwidth=4
set smartindent
set expandtab

" scroll
set scrolloff=8
set sidescrolloff=8

" misc
syntax enable
set noshowmode
set hidden
set mouse=a
set signcolumn=yes
set clipboard^=unnamed

""""""""""""""""""
" generic remaps "
""""""""""""""""""

" misc
nnoremap // :noh<CR>
nnoremap Q :bdelete! %<CR>

" cursor
nnoremap J mzJ`z
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
nnoremap N Nzzzv

"""""""""""
" plugins "
"""""""""""

" fzf
nnoremap <C-f>l :Rg<CR>
nnoremap <C-f>f :Files<CR>
nnoremap <C-f>b :Buffers<CR>
nnoremap <C-f>c :Commits<CR>
nnoremap <C-f>he :Helptags<CR>
nnoremap <C-f>hi :History:<CR>

let g:fzf_vim = {}
let g:fzf_vim.preview_window = ['right,50%,<70(down,50%)']

set rtp+=/opt/homebrew/opt/fzf
let $FZF_DEFAULT_OPTS = '--bind=ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down'

" nerdtree
nnoremap <C-n> :NERDTreeToggle<CR>

" lightline
set laststatus=2
let g:lightline = {}
let g:lightline.colorscheme = 'one'

" coc
" let g:coc_global_extensions = ['coc-json', 'coc-python', 'coc-java']


syntax enable
filetype on
filetype indent on
set t_Co=256
set number
set cursorline
set colorcolumn=80
set showmode
set showcmd
set encoding=utf-8
set list
set listchars=trail:·,tab:»·,nbsp:+
set mouse=a
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set showmatch
set hlsearch
set ignorecase
set smartcase
set incsearch
set nobackup
set noswapfile
set nowrap
set foldmethod=indent
set foldlevelstart=99

highlight specialkey cterm=none ctermfg=darkgrey ctermbg=none
highlight cursorline cterm=none ctermfg=none ctermbg=none
highlight colorcolumn cterm=none ctermfg=none ctermbg=darkgrey
highlight linenr  cterm=none ctermfg=darkgrey ctermbg=none
highlight cursorlinenr cterm=none ctermfg=cyan ctermbg=none
highlight listchars cterm=none ctermfg=darkgrey ctermbg=none

nnoremap <silent> [b :bnext<cr>
nnoremap <silent> ]b :bprevious<cr>

nnoremap <silent> <c-h> <c-w>h
nnoremap <silent> <c-j> <c-w>j
nnoremap <silent> <c-k> <c-w>k
nnoremap <silent> <c-l> <c-w>l

inoremap <silent> <a-h> <left>
inoremap <silent> <a-j> <down>
inoremap <silent> <a-k> <up>
inoremap <silent> <a-l> <right>

autocmd InsertLeave *.* write

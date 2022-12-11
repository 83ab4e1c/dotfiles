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
set tabstop=2
set shiftwidth=2
set softtabstop=2
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
set fillchars=eob:\ 
set background=dark

highlight specialkey cterm=none ctermfg=darkgrey ctermbg=none
highlight cursorline cterm=none ctermfg=none ctermbg=none
highlight colorcolumn cterm=none ctermfg=none ctermbg=darkgrey
highlight linenr  cterm=none ctermfg=darkgrey ctermbg=none
highlight cursorlinenr cterm=none ctermfg=cyan ctermbg=none
highlight listchars cterm=none ctermfg=darkgrey ctermbg=none

nnoremap [b :bnext<cr>
nnoremap ]b :bprevious<cr>

nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l


autocmd InsertLeave *.* write




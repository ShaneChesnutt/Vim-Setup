" Install Plugins
call plug#begin( '~/.vim/plugged' )

  Plug 'crusoexia/vim-monokai'
  Plug 'bling/vim-airline'
  Plug 'tpope/vim-vinegar'
  Plug 'tpope/vim-fugitive'
  Plug 'Shougo/unite.vim'
  Plug 'godlygeek/tabular'
  Plug 'tpope/vim-commentary'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'airblade/vim-gitgutter'
  Plug 'pangloss/vim-javascript'
  Plug 'Valloric/YouCompleteMe'

call plug#end()

" Edit Settings
set ruler
set textwidth=120
set shiftwidth=2
set softtabstop=2
set expandtab
set laststatus=2

set incsearch ignorecase smartcase

" Remove Trailing Whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Syntax
set number
set background=dark
syntax enable
colorscheme monokai

" Indent Guides
hi IndentGuidesOdd ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

let mapleader=','

" Tabular Config
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>

" Unite Config
nmap <Leader>uf :Unite file buffer<CR>
vmap <Leader>uf :Unite file buffer<CR>
nmap <Leader>ub :Unite buffer<CR>
vmap <Leader>ub :Unite buffer<CR>

" Install Plugins
call plug#begin( '~/.vim/plugged' )

  Plug 'crusoexia/vim-monokai'
  Plug 'bling/vim-airline'
  Plug 'tpope/vim-vinegar'
  Plug 'tpope/vim-fugitive'
  Plug 'Shougo/unite.vim'
  Plug 'SirVer/ultisnips'
  Plug 'godlygeek/tabular'
  Plug 'tpope/vim-commentary'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'airblade/vim-gitgutter'
  Plug 'pangloss/vim-javascript'
  Plug 'Valloric/YouCompleteMe'
  Plug 'scrooloose/syntastic'
  Plug 'osyo-manga/vim-brightest'
  Plug 'suan/vim-instant-markdown'
  Plug 'leafgarland/typescript-vim'
  Plug 'tpope/vim-markdown'

call plug#end()

" Edit Settings
set ruler
set textwidth=120
set shiftwidth=2
set softtabstop=2
set expandtab
set laststatus=2
set guifont=Source\ Code\ Pro\ Medium:h12
set hlsearch

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

noremap % v%

" Move Line Up/Down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Insert Empty Line (Without insert mode)
nmap <S-ENTER> O<Esc>
nmap <CR> o<Esc>

let mapleader=','

" Tabular Config
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs/l0l1<CR>
vmap <Leader>a: :Tabularize /:\zs/l0l1<CR>

" Unite Config
nmap <Leader>uf :Unite file buffer<CR>
vmap <Leader>uf :Unite file buffer<CR>
nmap <Leader>ub :Unite buffer<CR>
vmap <Leader>ub :Unite buffer<CR>

" Instant-Markdown
let g:instant_markdown_slow = 1

" Wildmenu Setup
set wildmenu
set wildmode=list:longest,full
set wildignore=*.class,*.git

" Install Plugins
call plug#begin( '~/.vim/plugged' )

  Plug 'crusoexia/vim-monokai',
  Plug 'bling/vim-airline',
  Plug 'tpope/vim-vinegar',
  Plug 'tpope/vim-fugitive',
  Plug 'SirVer/ultisnips',
  Plug 'godlygeek/tabular',
  Plug 'tpope/vim-commentary',
  Plug 'nathanaelkane/vim-indent-guides',
  Plug 'airblade/vim-gitgutter',
  Plug 'pangloss/vim-javascript',
  Plug 'Valloric/YouCompleteMe',
  Plug 'osyo-manga/vim-brightest',
  Plug 'suan/vim-instant-markdown',
  Plug 'leafgarland/typescript-vim',
  Plug 'tpope/vim-markdown',
  Plug 'skammer/vim-css-color',
  Plug 'cakebaker/scss-syntax.vim',
  Plug 'gregsexton/MatchTag',
  Plug 'glanotte/vim-jasmine',
  Plug 'neomake/neomake',
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' },
  Plug 'junegunn/fzf.vim'

call plug#end()

" General Vim Settings
set noswapfile
set hidden

" Edit Settings
set ruler
set textwidth=120
set shiftwidth=2
set softtabstop=2
set expandtab
set laststatus=2
set guifont=Source\ Code\ Pro\ Medium:h12
set hlsearch
set nowrap
set colorcolumn=120

set incsearch ignorecase smartcase

" Remove Trailing Whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Syntax
set number
set background=dark
syntax enable
colorscheme monokai

" Indent Guides
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

noremap % v%

" Move Line Up/Down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

function! FindConfig(prefix, what, where)
    let cfg = findfile(a:what, escape(a:where, ' ') . ';')
    return cfg !=# '' ? ' ' . a:prefix . ' ' . cfg : ''
endfunction

" Insert Empty Line (Without insert mode)
nmap <S-ENTER> O<Esc>
nmap <CR> o<Esc>

let mapleader=','

" Tabular Config
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs/l0l1<CR>
vmap <Leader>a: :Tabularize /:\zs/l0l1<CR>

" fzf settings/bindings
let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'
let g:fzf_history_dir = '~/.fzf-history'
nnoremap <silent> <Leader>t :Files<CR>
nnoremap <space>/ :Ag<CR>
nnoremap <space>s :Buffers<cr>

"neomake settings
let g:neomake_java_enabled_makers = []
let g:neomake_error_sign = {'text': '>>', 'texthl': 'ErrorMsg'}
let g:neomake_warning_sign = {'text': '>>', 'texthl': 'WarningMsg'}

autocmd! BufWritePost * Neomake

nnoremap <Leader>ln :lne<CR>
nnoremap <Leader>lp :lp<CR>

" Spell Check
vmap <Leader>sc :setlocal spell spelllang=en_us<CR>
nmap <Leader>sc :setlocal spell spelllang=en_us<CR>
vmap <Leader>sr :setlocal nospell<CR>
nmap <Leader>sr :setlocal nospell<CR>

" Instant-Markdown
let g:instant_markdown_slow = 1

" Wildmenu Setup
set wildmenu
set wildmode=list:longest,full
set wildignore=*.class,*.git

" CSS Color Plugin
let g:cssColorVimDoNotMessMyUpdatetime = 1

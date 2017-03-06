if has('nvim')
    tnoremap <Esc> <C-\><C-n>
endif

call plug#begin('~/.local/share/nvim/plugged')

Plug 'mhinz/vim-janah'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-fugitive'
"Plug 'vim-syntastic/syntastic'
Plug 'neomake/neomake'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdcommenter'
Plug 'kien/ctrlp.vim'
Plug 'Raimondi/delimitMate'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'majutsushi/tagbar'
Plug 'ctrlpvim/ctrlp.vim'

call plug#end()

set t_Co=256               " using 256-color
autocmd ColorScheme janah highlight Normal ctermbg=235
colorscheme janah

" base
set encoding=utf-8
set number
set novisualbell
set errorbells
set textwidth=80
set nowrap
set noruler
set wrapscan

" split
set splitbelow
set splitright

" tab setting
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab

" complete option
set complete=k,.,w,b,u,U,i,d,t
set completeopt=menu,longest

set wildmenu wildmode=longest:full
set wildoptions=tagfile
set wildignorecase

set spelllang=en_us

set nobackup noswapfile

set synmaxcol=0

" fold setting {{{
set foldenable foldcolumn=1 foldlevel=2 foldminlines=3
set foldnestmax=5 foldlevelstart=1
"}}}
" Resize splits when the window is resized
au VimResized * :wincmd =

" some list char
set nolist
set fillchars+=diff:⣿
set fillchars+=vert:│
set fillchars+=fold:-
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:-
nmap <leader>l :set list!<CR>
set showbreak=↪

" lightline setting
set laststatus=2
set showtabline=2
set nocursorline
set nocursorcolumn
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

" key mapping
nnoremap <F2> :NERDTreeToggle<cr>
nmap <F3> :TagbarToggle<CR>
set pastetoggle=<F4>

" Toggle the state of search highlighting locally.
nnoremap <silent> <cr> :setlocal hlsearch!<cr>

" Toggle the state of spelling locally.
nnoremap <silent> <leader>sp :setlocal spell!<cr>

" Cold turkey; no more arrows mojions.
nnoremap <silent> <up>    <nop>
nnoremap <silent> <down>  <nop>
nnoremap <silent> <left>  <nop>
nnoremap <silent> <right> <nop>

 " Make it easy to jump around from term emu to Vim.
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Strip trailing whitespace from the end of files.
nnoremap <silent> <leader>sw :%s/\s$//g<cr>

" identation
nmap <TAB> v>
nmap <S-TAB> v<
vmap <TAB> >gv
vmap <S-TAB> <gv

" nerdcommenter shortcut
map <Leader><Leader> <Leader>c<space>

" sudo to write
cnoremap w!! w !sudo tee % >/dev/null

" Move cursor by display lines when wrapping
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" folding keymap
" close when open, and open when close
nnoremap <Space> za
vnoremap <Space> za
" Open all fold
nnoremap <leader>A zR
" Close all fold
nnoremap <leader>C zM

" Insert Mode Completion {{{
inoremap <c-f> <c-x><c-f>
inoremap <c-]> <c-x><c-]>
inoremap <c-l> <c-x><c-l>
" }}}

" Tagbar {{{
let g:tagbar_left=1
let g:tagbar_autofocus=1
let g:tagbar_autoclose=0
"}}}

autocmd! BufWritePost * Neomake

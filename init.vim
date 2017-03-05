if has('nvim')
    tnoremap <Esc> <C-\><C-n>
endif

call plug#begin('~/.local/share/nvim/plugged')

Plug 'mhinz/vim-janah'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-fugitive'
Plug 'vim-syntastic/syntastic'
Plug 'mhinz/vim-startify'

call plug#end()

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

" Resize splits when the window is resized
au VimResized * :wincmd =

" some list char
set nolist
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


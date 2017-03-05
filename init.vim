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
call plug#end()

autocmd ColorScheme janah highlight Normal ctermbg=235
colorscheme janah

set encoding=utf-8
set number

" split
set splitbelow
set splitright

nnoremap <F2> :NERDTreeToggle<cr>

set laststatus=2
set showtabline=2
set cursorline

set nolist
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:-
nmap <leader>l :set list!<CR>
set showbreak=↪

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

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  source $MYVIMRC
endif

call plug#begin(data_dir . '/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'yggdroot/indentline'

" umcomment the line below to enable plugin for golang. go should be installed on the OS.
" Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

" uncomment the line below to enable plugin for python
" Plug 'davidhalter/jedi-vim'

" uncomment the 2 lines below to enable tagbar. universal-ctags should be installed on the OS.
" Plug 'majutsushi/tagbar'
" Plug 'ludovicchabant/vim-gutentags'

call plug#end()

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

if !empty(glob(data_dir . '/plugged/gruvbox'))
  colorscheme gruvbox
  set background=dark
endif

set nu
set relativenumber
set cursorline
set syntax=on
set ts=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

" ESC
:imap jk <Esc>
:imap kj <Esc>
" move faster
noremap J 5j
noremap K 5k
" split
map sh :set nosplitright<CR>:vsplit<CR>
map sl :set splitright<CR>:vsplit<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sj :set splitbelow<CR>:split<CR>
" tab
map tn :tabe<CR>
map tj :-tabnext<CR>
map tk :+tabnext<CR>

nnoremap tt :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>


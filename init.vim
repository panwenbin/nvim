let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  source $MYVIMRC
endif

" known shortcuts
" gt -> go to tab, 1gt -> go to 1st tab
" gf -> go to file
" gx -> go to url
" ctrl+w+hjkl -> switch window
" ctrl+w+w -> next window
" ctrl+w+v -> vsplit window
" ctrl+w+s -> split window
" ctrl+w+c -> close window
" ctrl+d -> move down half screen
" ctrl+u -> move up half screen

call plug#begin(data_dir . '/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'yggdroot/indentline'
Plug 'voldikss/vim-floaterm'

" uncomment the line below to enable gitgutter
Plug 'airblade/vim-gitgutter'

" uncomment the line below to enable plugin for golang. go should be installed on the OS.
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

" autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" uncomment the line below to enable plugin for rust.
Plug 'rust-lang/rust.vim'

" uncomment the line below to enable plugin for PHP.
Plug 'StanAngeloff/php.vim'

" php lsp
"Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}

" php auto-completion
" Include Phpactor
Plug 'phpactor/phpactor' ,  {'do': 'composer install', 'for': 'php'}

" Require ncm2 and this plugin
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'phpactor/ncm2-phpactor'

" uncomment the line below to enable plugin for python
Plug 'davidhalter/jedi-vim'

" html
Plug 'alvan/vim-closetag'
Plug 'andrewradev/tagalong.vim'

" css color
Plug 'ap/vim-css-color'

" uncomment the 2 lines below to enable tagbar. universal-ctags should be installed on the OS.
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'

" uncomment the line below to enable markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" table mode for markdown
Plug 'dhruvasagar/vim-table-mode'

" uncomment the line below to enable vimwiki
Plug 'vimwiki/vimwiki'

" uncomment the line below to enable fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" vim-tmux-navigator
Plug 'christoomey/vim-tmux-navigator'

" whichkey
Plug 'liuchengxu/vim-which-key'

" DB
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'

" Hop
Plug 'phaazon/hop.nvim'

" NerdCommenter
Plug 'scrooloose/nerdcommenter'

call plug#end()

set timeoutlen=500

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1

" floaterm
let g:floaterm_width = 0.95
let g:floaterm_height = 0.95
let g:floaterm_autoinsert = 1

" deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })

" which key
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
let g:which_key_map =  {}
let g:which_key_map.t = {
      \ 'name' : '+terminal' ,
      \ ';' : [':FloatermNew --wintype=popup --height=6'        , 'terminal'],
      \ 'f' : [':FloatermNew fzf'                               , 'fzf'],
      \ 'g' : [':FloatermNew lazygit'                           , 'git'],
      \ 'd' : [':FloatermNew lazydocker'                        , 'docker'],
      \ 'n' : [':FloatermNew node'                              , 'node'],
      \ 'N' : [':FloatermNew nnn'                               , 'nnn'],
      \ 'p' : [':FloatermNew python3'                           , 'python'],
      \ 'r' : [':FloatermNew ranger'                            , 'ranger'],
      \ 't' : [':FloatermToggle'                                , 'toggle'],
      \ 'y' : [':FloatermNew ytop'                              , 'ytop'],
      \ 's' : [':FloatermNew ncdu'                              , 'ncdu'],
      \ }

" disable |K| for :GoDoc
let g:go_doc_keywordprg_enabled = 0
" disable |gd| for :GoDef
let g:go_def_mapping_enabled = 0

let g:rustfmt_autosave = 1

let vim_markdown_preview_github=1
" let vim_markdown_preview_hotkey='<C-m>'

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
set mouse=a
set shellcmdflag=-ic
filetype plugin indent on

" auto-completion
inoremap '' ''
inoremap ''' '''
inoremap "" ""
inoremap """ """
inoremap () ()
inoremap [] []
inoremap {} {}
inoremap ' ''<ESC>i
vnoremap ' c''<ESC>hp
inoremap " ""<ESC>i
vnoremap " c""<ESC>hp
inoremap ( ()<ESC>i
vnoremap ( c()<ESC>hp
inoremap [ []<ESC>i
vnoremap [ c[]<ESC>hp
inoremap { {<CR>}<ESC>O
vnoremap { c{}<ESC>hp
vnoremap > >gv
vnoremap < <gv
nnoremap <ESC><ESC> :Commands<CR>

" window
nnoremap <Tab> <C-W>w

let mapleader = "\<Space>"
let maplocalleader = ","

" buffer
map <leader>bc :%bd\|e#\|bd#<CR>
map bn :bnext<CR>
map bp :bprevious<CR>

" markdown
nmap <silent> <F8> <Plug>MarkdownPreviewToggle        " for normal mode
imap <silent> <F8> <Plug>MarkdownPreviewToggle        " for insert mode

" vimwiki
let g:vimwiki_list = [ {"path": "~/vimwiki/", "path_html": "~/wiki/", "syntax": "markdown", "ext": ".md"}]

"nmap <F9> :TagbarToggle<CR>

"nnoremap tt :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
nnoremap <silent> <expr> tt g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" :     bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 | let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" vim-go
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

autocmd FileType go nmap <localleader>r  <Plug>(go-run)
autocmd FileType go nmap <localleader>t  <Plug>(go-test)
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <localleader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <localleader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <localleader>d <Plug>(go-def)
autocmd FileType go nmap <localleader>n <Plug>(go-referrers)

" python
let g:jedi#usages_command = "<localleader>n"
let g:jedi#goto_command = "<localleader>d"
" clickhouse-format
autocmd FileType sql vmap <localleader>f :!clickhouse-format -n<CR>
autocmd FileType sql vmap <localleader>ri :!
autocmd FileType sql nmap <localleader>ri vip:!
autocmd FileType sql vmap <localleader>ro :w !
autocmd FileType sql nmap <localleader>ro vip:w !
autocmd FileType sql vmap <localleader>rt :FloatermNew!<Space>
autocmd FileType sql nmap <localleader>rt vip:FloatermNew!<Space>

" wd-dict
vmap <localleader>wd :FloatermNew wd<CR>
nmap <localleader>wd viw:FloatermNew wd<CR>

" ncm2-phpactor
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
autocmd FileType php nmap <localleader>d :PhpactorGotoDefinition<CR>
autocmd FileType php nmap <localleader>n :PhpactorFindReferences<CR>

" closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.vue'
let g:closetag_filetypes = 'html,xhtml,phtml,vue'
" tagalone
let g:tagalong_filetypes = ['html','xhtml','phtml','vue']

" fzf
nnoremap <C-p> :Files<CR>
nnoremap <C-p><C-p> :GFiles<CR>
nnoremap <C-g><C-g> :BCommits<CR>
" fzf Ag
nnoremap <C-s> :Ag 

" Floaterm instance for running lazygit
nnoremap <silent> <C-g> :FloatermNew --name=lazygit --wintype=float --cwd=<buffer> lazygit<CR>

" new tmux pane
nnoremap <silent> <leader>tu :silent !tmux split-window -h<CR>:silent !tmux send-keys -t -0 "cd %:p:h" C-m<CR>

" fcitx5
let fcitx5state=system("fcitx5-remote")
autocmd InsertLeave * :silent let fcitx5state=system("fcitx5-remote")[0] | silent !fcitx5-remote -c
autocmd InsertEnter * :silent if fcitx5state == 2 | call system("fcitx5-remote -o") | endif

" hop
nnoremap <C-f> :HopChar1<CR>
nnoremap <C-f><C-f> :HopWord<CR>

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>0 <Plug>AirlineSelectTab0
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

" copy to system clipboard
vnoremap <Leader>y "+y
noremap <Leader>yf :let @+ = expand("%:t")<CR>
noremap <Leader>yp :let @+ = expand("%:p")<CR>
"reload vimrc                                                             
nnoremap <Leader>r :source $MYVIMRC<CR>

" transparent background
hi Normal ctermfg=252 ctermbg=none

" Floaterm
hi Floaterm guibg=#110f18
hi FloatermBorder guifg=#49b4e3 guibg=#110f18
hi FloatermNC guibg=#2b2033

lua << EOF
require'hop'.setup()
EOF

" ----------------------------------------
" dein
" ----------------------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif


"" just like a common shell so you should be able to use it intuitively
call dein#add('Shougo/vimshell')

"" git command on vim
call dein#add('vim-scripts/fugitive.vim')

"" format codes
call dein#add('vim-scripts/Align')

"" quickrun(<SPACE-q>)
call dein#add('thinca/vim-quickrun')

"" complete keys
call dein#add('Shougo/neocomplcache')

"" complete snippets
call dein#add('Shougo/neosnippet')

"" Delete/change/add parentheses/quotes/XML-tags/much more with ease
call dein#add('tpope/vim-surround')

"" Maintains a history of previous yanks, changes and deletes
call dein#add('vim-scripts/YankRing.vim')

"" Power to the status line
call dein#add('Lokaltog/vim-powerline')

"" Ruby on Rails: easy file navigation, enhanced syntax highlighting, and more
call dein#add('vim-scripts/rails.vim')

"" A color scheme based on the RailsCasts TextMate theme with decent support for both GUI and terminal.
call dein#add('jpo/vim-railscasts-theme')

"" Vim motions on speed!
call dein#add('Lokaltog/vim-easymotion')

"" Quantify your coding inside Vim.
call dein#add('wakatime/vim-wakatime')


" ----------------------------------------
" Compatibility
" ----------------------------------------
set nocompatible

" ----------------------------------------
" Display
" ----------------------------------------
set laststatus=2
set number
set ruler
set showcmd
set showmatch
set list
set listchars=tab:>-,trail:-

" ----------------------------------------
" Edit
" ----------------------------------------
set autoindent smartindent
set hidden
set expandtab
set tabstop=4 softtabstop=4 shiftwidth=4
set fileformat=unix
set wildmenu
set wildmode=list:full
set noswapfile
set clipboard=unnamed,autoselect
set mouse=a
set ttymouse=xterm2
set encoding=utf-8
set fileencodings=utf-8,sjis,ucs-bom,iso-2022-jp,cp932,euc-jp,cp20932
set imdisable

" Copy to clipboard
vmap <C-c> :w !xsel -ib<CR><CR>

" Highlight Zenkaku Space
scriptencoding utf-8
"augroup highlightIdeographicSpace
"    autocmd!
"    autocmd Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
"    autocmd VimEnter,WinEnter * match IdeographicSpace /　/
"augroup END

" ----------------------------------------
" Skelton
" ----------------------------------------
augroup templateload
    autocmd!
    autocmd BufNewFile *.py 0r ~/.vim/template/skelton.py
    autocmd BufNewFile *.php 0r ~/.vim/template/skelton.php
    autocmd BufNewFile *Test.php 0r ~/.vim/template/skeltonTest.php
augroup END

" ----------------------------------------
" Like IDE
" ----------------------------------------
" TrinityTagAll
nmap <F7> :TrinityToggleAll<CR>

" Tagbar
nmap <space>y :TagbarToggle<CR>

" NerdTree
nmap <space>t :NERDTreeToggle<CR>

" ref.vim
let g:ref_use_vimproc = 0
nmap ,rr :<C-u>Ref refe<Space>
let g:ref_phpmanual_path = '/home/seta/Dropbox/phpmanual'
nmap ,rp :<C-u>Ref phpmanual<Space>

" ----------------------------------------
" Color
" ----------------------------------------
syntax on
set t_Co=256
set background=dark
colorscheme railscasts
let g:molokai_original = 1

" ----------------------------------------
" Search
" ----------------------------------------
set hlsearch
set incsearch
set ignorecase
set smartcase

nnoremap n nzz
nnoremap N Nzz
nnoremap <Esc><Esc> :nohlsearch<CR>

" ----------------------------------------
" neocomplcache.vim
" ----------------------------------------
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" ----------------------------------------
" Align.vim
" ----------------------------------------
let g:Align_xstrlen = 3

" ----------------------------------------
" Quickrun
" ----------------------------------------
silent! map <unique> <Space>q <Plug>(quickrun)

let g:quickrun_config = {}
let g:quickrun_config['*'] = {'runmode': "async:remote:python", 'split':'below'}

" ----------------------------------------
" Easymotion
" ----------------------------------------
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
let g:EasyMotion_leader_key="'"
let g:EasyMotion_grouping=1
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue

" ----------------------------------------
" YankRing.vim
" ----------------------------------------
let g:yankring_manual_clipboard_check = 0
let g:yankring_history_dir = expand('~/.homesick/repos/dotfiles/log/')
let g:yankring_n_keys = 'Y D'

" ----------------------------------------
" Other Key Mappings
" ----------------------------------------
" reload .vimrc
nnoremap <space>R :source ~/.vimrc<CR>

" move to buffer
map <space>b   :bnext<CR>
map <space>n   :bprevious<CR>

" enable to move when insertmode
imap <C-h> <LEFT>
imap <C-l> <RIGHT>

" leave insertmode
autocmd InsertLeave * set nopaste

" go to another window
nnoremap <space>h <C-w>h
nnoremap <space>j <C-w>j
nnoremap <space>k <C-w>k
nnoremap <space>l <C-w>l

" move the window to another position
nnoremap <space>H <C-w>H
nnoremap <space>J <C-w>J
nnoremap <space>K <C-w>K
nnoremap <space>L <C-w>L

" adjust the window height/width
nnoremap <space>+ <C-w>5+
nnoremap <space>- <C-w>5-
nnoremap <space>> <C-w>10>
nnoremap <space>< <C-w>10<

" ESC
inoremap <C-j> <Esc>
nnoremap <C-j> <Esc>

" insert black-hole register by x
nnoremap x "_x

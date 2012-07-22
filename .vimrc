" ----------------------------------------
" Vundle
" ----------------------------------------
set nocompatible
filetype off
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

" short for Vimbundle and is a Vim plugin manager
NeoBundle 'vundle.git'

" manage plugins
NeoBundle 'gmarik/vundle'

" search files
NeoBundle 'unite.vim'

" just like a common shell so you should be able to use it intuitively
NeoBundle 'Shougo/vimshell'

" git command on vim
NeoBundle 'fugitive.vim'

" format codes
NeoBundle 'Align'

" toggle comment outs
NeoBundle 'scrooloose/nerdcommenter'

" HTML snippets
NeoBundle 'ZenCoding.vim'

" tree explorer
NeoBundle 'scrooloose/nerdtree'

" bettar indentation for JavaScript
NeoBundle 'pangloss/vim-javascript'

" vim reference(<Shift-k>)
NeoBundle 'thinca/vim-ref'

" quickrun(<SPACE-q>)
NeoBundle 'thinca/vim-quickrun'

" pyflake
NeoBundle 'mitechie/pyflakes-pathogen'

" TDD
NeoBundle 'reinh/vim-makegreen'

" TDD in python
NeoBundle 'lambdalisue/nose.vim'

" Python complete
NeoBundle 'vim-scripts/pythoncomplete'

" Django Support
NeoBundle 'lambdalisue/vim-django-support'

" Refactoring in python
NeoBundle 'sontek/rope-vim'

" indent guides
NeoBundle 'nathanaelkane/vim-indent-guides'

" tagbar(<F8>)
NeoBundle 'majutsushi/tagbar'

" Allows one to edit a file with prevledges from an unprivledged session
NeoBundle 'sudo.vim'

" complete keys
NeoBundle 'Shougo/neocomplcache'

" complete snippets
NeoBundle 'Shougo/neocomplcache-snippets-complete'

" Build the trinity of srcexpl, taglist, NERD_tree to be a good IDE
NeoBundle 'trinity.vim'

" Source code browser (supports C/C++, java, perl, python, tcl, sql, php, etc)
NeoBundle 'taglist.vim'

" A Source code Explorer based on tags works like context window in Source Insight
NeoBundle 'Source-Explorer-srcexpl.vim'

" A project which translate Vim documents into Japanese
NeoBundle 'vim-jp/vimdoc-ja'

" Difference between two blocks (functions etc...)
NeoBundle 'adie/BlockDiff'

" Delete/change/add parentheses/quotes/XML-tags/much more with ease
NeoBundle 'tpope/vim-surround'

" An extensible & universal comment plugin that also handles embedded filetypes
NeoBundle 'tomtom/tcomment_vim'

" Maintains a history of previous yanks, changes and deletes
NeoBundle 'YankRing.vim'

" Show diff  when commiting changes on a subversion repository
NeoBundle 'svn-diff.vim'

" Power to the status line
NeoBundle 'Lokaltog/vim-powerline'

" syntax and indent for coffee script
NeoBundle 'kchmck/vim-coffee-script'

" syntax for vimperatorrc
NeoBundle 'superbrothers/vim-vimperator'

" 'gitk clone' plugin for the text editor Vim.
NeoBundle 'gitv'

" A git commit browser / git log wrapper that extends fugitive.vim.
NeoBundle 'extradite.vim'

" diff and merge two directories recursively
NeoBundle 'DirDiff.vim'


filetype plugin indent on

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
set fileencodings=utf-8,sjis,ucs-bom,iso-2022-jp,cp932,euc-jp,cp20932

" Highlight Zenkaku Space
scriptencoding utf-8
augroup highlightIdeographicSpace
    autocmd!
    autocmd Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
    autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END

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
" unite.vim
" ----------------------------------------
let g:unite_enable_start_insert = 1

" open unite buffer
nnoremap <space><space> :Unite buffer file_rec<CR>

" open recent files
noremap <space>r :<C-u>Unite file_mru -buffer-name=file_mru<CR>

" quit with ESC
au FileType unite nnoremap <silent> <buffer> <C-j> :q<CR>
au FileType unite inoremap <silent> <buffer> <C-j> <ESC><CR>

" ----------------------------------------
" neocomplcache.vim
" ----------------------------------------
let g:neocomplcache_enable_at_startup = 1

highlight pmenu     ctermbg=8
highlight pmenusel  ctermbg=1
highlight pmenusbar ctermbg=0

imap <expr><tab> neocomplcache#sources#snippets_complete#expandable() ? "\<plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<c-n>" : "\<tab>"
smap <expr><tab> neocomplcache#sources#snippets_complete#expandable() ? "\<plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<c-n>" : "\<tab>"

inoremap <expr><cr>  neocomplcache#smart_close_popup()."\<cr>"
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()

" ----------------------------------------
" vim-indent-gides.vim
" ----------------------------------------
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

" ----------------------------------------
" Align.vim
" ----------------------------------------
let g:Align_xstrlen = 3

" ----------------------------------------
" NERD_commenter.vim
" ----------------------------------------
let g:NERDSpaceDelims = 1
let g:NERDShutup = 1

map <Leader>x <Plug>NERDCommenterToggle

" ----------------------------------------
" Quickrun
" ----------------------------------------
silent! map <unique> <Space>q <Plug>(quickrun)

let g:quickrun_config = {}
let g:quickrun_config['*'] = {'runmode': "async:remote:python", 'split':'below'}

" ----------------------------------------
" YankRing.vim
" ----------------------------------------
let g:yankring_manual_clipboard_check = 0
let g:yankring_history_dir = expand('$HOME/Log/Vim')

" ----------------------------------------
" Other Key Mappings
" ----------------------------------------
" reload .vimrc
nnoremap <space>R :source ~/.vimrc<CR>

" move to line head/end like mac
nnoremap <C-a> 0
nnoremap <C-e> $

" move to buffer
map <space>b   :bnext<CR>
map <space>B   :bprevious<CR>

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

" ENTER with new line
noremap <CR> o<ESC>

" Delete
nnoremap <C-b> x
nnoremap <C-d> <Del>
inoremap <C-b> <Backspace>
inoremap <C-d> <Del>

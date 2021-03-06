" 補完を有効にする
autocmd FileType python set omnifunc=pythoncomplete#Complete
" PEP 8 Indent rule
setl tabstop=8
setl softtabstop=4
setl shiftwidth=4
setl smarttab
setl expandtab
setl autoindent
setl nosmartindent
setl cindent
"setl textwidth=100
"setl colorcolumn=100

" Apply g:pythonworkon to statusline
let &statusline='%F%m%r%h%w [FORMAT=%{&ff}] [ENC=%{&fileencoding}] [TYPE=%Y] [ASCII=\%03.3b] [HEX=\%02.2B] [POS=%04l,%04v][%p%%] [LEN=%L] %= [WORKON=%{pythonworkon}]'

" testからはじまるpythonファイルをテストコードとする
augroup pythonNoseTests
    autocmd!
    autocmd BufWinEnter,BufNewFile test*.py set filetype=python.unit
augroup END

let g:quickrun_config['python.unit'] = {'command': 'nosetests', 'exec': ['%c -v %s']}

compiler nose

" Remove Space
autocmd BufWritePre * :%s/\s\+$//ge
autocmd BufWritePre * :%s/\t/  /ge

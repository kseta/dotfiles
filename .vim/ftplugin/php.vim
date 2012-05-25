" http://d.hatena.ne.jp/thinca/20120208/1328676033
setl colorcolumn=100
function! s:at()
  let syntax = synstack(line('.'), col('.'))
  let name = empty(syntax) ? '' : synIDattr(syntax[-1], "name")
  return name =~# 'String\|Comment\|None' ? '@' : '$this->'
endfunction
inoremap <expr> <buffer> @ <SID>at()

"augroup phpsyntaxcheck
"  autocmd!
"  autocmd BufWrite *.php w !phpcs --standard=$HOME/.phpcs/ruleset.xml
"augroup END

augroup QuickRunPHPUnit
  autocmd!
  autocmd BufEnter,BufNewFile *Test.php set filetype=php.unit
augroup END

let g:quickrun_config['php.unit'] = {'command': 'phpunit', 'exec': ['%c - v %s']}

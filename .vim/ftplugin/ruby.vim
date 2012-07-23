set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent

let g:quickrun_config = {}
augroup QuickRunRspec
  autocmd!
  autocmd BufEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END

let g:quickrun_config['ruby.rspec'] = {'command': 'rspec'}

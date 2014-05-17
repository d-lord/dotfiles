" copied straight from vimrc where these settings were doing work for all filetypes
" so this is very much a work in progress
setlocal softtabstop=4
setlocal tabstop=8 " apparently non-8 can get breaky (see :he 'tabstop')
setlocal shiftwidth=4
setlocal smarttab " insert tabs on the start of a line according to shiftwidth, not tabstop
setlocal autoindent
setlocal foldmethod=syntax " automatic folding on syntax

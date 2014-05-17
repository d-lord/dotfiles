" copied straight from vimrc where these settings were doing work for all filetypes
" so this is very much a work in progress
set softtabstop=4
set tabstop=8 " apparently non-8 can get breaky (see :he 'tabstop')
set shiftwidth=4
set smarttab " insert tabs on the start of a line according to shiftwidth, not tabstop
set autoindent
set foldmethod=syntax " automatic folding on syntax

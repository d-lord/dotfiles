" graphical
set bg=dark
colorscheme solarized
" let g:solarized_termcolors=256 " for silly terminals like Terminal.app
set number " show line numbers
set ruler " line at the bottom with (row, col) display
syntax on

set cpoptions+=$ " show $ when making a change to one line - haven't decided whether I like this
set backspace=indent,eol,start " backspace behaves like Word

" indenting
set softtabstop=4
set tabstop=8
set shiftwidth=4

" toggle highlighting search terms
set hlsearch
nnoremap <F3> :set hlsearch!<CR>
" while typing search, start searching
set incsearch

" viminfo - will not transfer between machines (but we could add this to git if desired)
" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

" restores the cursor position
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" toggle background between light and dark
" http://vim.wikia.com/wiki/Better_colors_for_syntax_highlighting
function! ToggleBackground()
    let &background = ( &background == "dark"? "light" : "dark" )
endfunction
nnoremap <leader>b :call ToggleBackground()<CR>

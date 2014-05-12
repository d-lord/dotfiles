" credit and/or reference:
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
" http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
" https://github.com/tpope/vim-pathogen

set nocompatible " vi-compatible mode seems widely hated, and I don't know enough to break away from consensus

call pathogen#infect()

" leader commands
let mapleader = ","
" show line numbers relative to the current line
nnoremap <leader>c :set relativenumber!<CR>
" clear the last search (instead of typing /asdfghjkl)
nnoremap <leader><space> :noh<CR>
" save and run make (intended for LaTeX)
nnoremap <leader>m :w<CR>:make<CR>

" colorscheme
set bg=dark
" if git repo has been checked out OK, solarized should be present. that's a big "if", so here's some handling.
try
    colorscheme solarized
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme murphy
endtry
" solarized goes weird in Terminal.app but has a built-in solution
" my detection's probably not bulletproof but works on laptop
if !has("gui") && $TERM=="xterm-256color"
    let g:solarized_termcolors=256
endif

" graphical
set number " show line numbers
set ruler " line at the bottom with (row, col) display
syntax on
set cpoptions+=$ " show $ when making a change to one line - haven't decided whether I like this

" font choice - my OSX has installed fancy Airline fonts, Windows hasn't
if has("win32") || has("win64")
    " default Windows gVim font breaks on italics
    set guifont=Consolas:h10:b
else
" --- vim-airline ---
    try
	set guifont=DejaVu\ Sans\ Mono\ for\ Powerline " if font is installed
	let g:airline_powerline_fonts = 1 " enables fancy characters in airline
    catch /^Vim\%((\a\+)\)\=:E596/ " font is not installed
	set guifont=Monaco
    endtry
endif
let g:airline_theme = 'light'			    " convention says the colours are incompatible. screw convention
set laststatus=2				    " always show statusbar (vim-airline)
set noshowmode					    " don't show eg '-- INSERT --' at the bottom of the screen. vim-airline makes this redundant.
let g:airline#extensions#tabline#enabled = 1	    " enable/disable enhanced tabline.
" these next three are default options, the one after should add buffer #s if I understand correctly but doesn't seem to
let g:airline#extensions#tabline#show_buffers = 1   " enable/disable displaying buffers with a single tab.
let g:airline#extensions#tabline#show_tab_type = 1  " enable/disable displaying tab type (far right)
let g:airline#extensions#tabline#show_tab_nr = 1    " enable/disable displaying tab number in tabs mode.
let g:airline#extensions#tabline#tab_nr_type = 1    " configure how numbers are calculated in tab mode: tab number

" misc
set backspace=indent,eol,start	" backspace behaves like Word
set hidden			" enable loading a buffer in a window that already has a modified buffer (modified buffer will stay in memory and ask to be saved on :q)
set wildignore=*.swp,*.bak,*.pyc,*.class " ignore these filetypes when completing with <Tab>

" indenting
set softtabstop=4
set tabstop=8 " apparently non-8 can get breaky (see :he 'tabstop')
set shiftwidth=4
set smarttab " insert tabs on the start of a line according to shiftwidth, not tabstop

" toggle highlighting search terms
set hlsearch
nnoremap <F3> :set hlsearch!<CR>
" while typing search, start searching
set incsearch
" required for smartcase: searches are case-insensitive
set ignorecase
" ignore case if search pattern is all lowercase, otherwise case-sensitive
set smartcase

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

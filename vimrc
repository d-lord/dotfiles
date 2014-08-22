" credit and/or reference:
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
" http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
" https://github.com/tpope/vim-pathogen

set nocompatible " vi-compatible mode seems widely hated, and I don't know enough to break away from consensus

" Required Vundle setup
" http://blog.thomasupton.com/2014/02/migrating-from-pathogen-to-vundle/
" 23/08/14
filetype off
set runtimepath+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-fugitive'
Bundle 'jpo/vim-railscasts-theme'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-surround'
Bundle 'majutsushi/tagbar'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'Valloric/YouCompleteMe'
Bundle 'runsisi/consolas-font-for-powerline'
Bundle 'Lokaltog/powerline-fonts'


" leader commands
let mapleader = "\\"
" show line numbers relative to the current line
nnoremap <leader>c :set relativenumber!<CR>
" clear the last search (instead of typing /asdfghjkl)
nnoremap <leader><space> :noh<CR>

" custom key maps
" experimental: jk to <Esc>
inoremap jk <Esc>
" backspace complements x
nnoremap <BS> hx
" use ctrl+tab to switch buffers (with airline this is like everything else
" with tabs) - doesn't work in terminal Vim (only gVim/MacVim)
nnoremap <C-Tab> :bn<CR>
nnoremap <C-S-Tab> :bp<CR>
" iTerm2 must be configured to send these on <C-Tab> and <C-S-Tab>
" currently works in iTerm2 OR tmux on iTerm2 depending what escape codes are
" mapped to <F13> and <F14>
map <F13> <C-Tab>
map <F14> <C-S-Tab>
" use these for iTerm2 non-tmux:
" set iTerm2 to send O2P on ctrl+tab and don't care about xterm-keys in ~/.tmux.conf
"set <F13>=O2P
"set <F14>=O2Q
" use these for tmux/iTerm2:
" set iTerm2 to send O2P on ctrl+tab and enable xterm-keys in ~/.tmux.conf
" with 'set-option -g xterm-keys on'
" alternatively, you can make iTerm send these [25~ codes and vim will
" accept them - but tmux will then refuse to pass them through (?!)
set <F13>^=[25~
set <F14>^=[26~
"map <F15> <F13>
"map <F16> <F14>
" experimenty failures:
"set <F13>=[1;2P
"set <F14>=[1;2Q
"map [1;2P <F13>
"map [1;2Q <F14>
"map O2P <F13>
"map O2Q <F14>

" colorscheme
set bg=dark
" if git repo has been checked out OK, solarized should be present. that's a big "if", so here's some handling.
try
    colorscheme solarized
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme murphy
endtry
" terminal-specific configuration: for PuTTY and iTerm
" (also works with tmux under those circumstances)
" This section used to be big on Solarized-related config
" but now I've stopped caring and just use it in 256color mode.
" (because otherwise the whole terminal tab/window has to be in Solarized
" theme, and tmux/irssi look horrible that way - so does iTerm's mouse
" selection)
"
if !has("gui_running") && ($TERM=="xterm-256color" || ($TERM=="screen-256color"))
    " this line is useful only if we don't have solarized colours for the
    " terminal - this is now exactly what I do
    let g:solarized_termcolors=256
    
    " Assumes PuTTY is in solarized colourscheme
    " or iTerm has profiles called "Default" and "Solarized"
    " iTerm2: change terminal colourscheme for solarized
    " assumes this is iTerm2 and we have Solarized and Default profiles
    " other terminals (eg PuTTY) will just ignore the escape codes
    
    " on starting vim: switch to solarized
    " any of these work:
    "!echo -e "\033]50;SetProfile=Solarized\a"
    " autocmd VimEnter * !echo -e "\033]50;SetProfile=Solarized\a"
    " !echo -e "]50;SetProfile=Solarized\a"
    " these should be quieter but simply don't work:
    " autocmd VimEnter * echo "]50;SetProfile=Solarized\\a"
    " autocmd VimEnter * echo "\<Esc>]50;SetProfile=Solarized\\a"

    " on leaving vim: switch to default (there's no iTerm code for "get
    " current profile" or "use previous profile")
    " autocmd VimLeave * !echo -e "\033]50;SetProfile=Default\a"
    
    " would like to fix this up - the !echoes are visible in userland
    " but it *works*
endif


" misc
filetype plugin on		" enable filetype-specific plugins
set backspace=indent,eol,start	" backspace behaves like Word
set virtualedit=all		" let the cursor go in 'invalid' places
set hidden			" enable loading a buffer in a window that already has a modified buffer (modified buffer will stay in memory and ask to be saved on :q)
set wildignore=*.swp,*.bak,*.pyc,*.class " ignore these filetypes when completing with <Tab>
set wildmenu			" enhanced command-line completion
set directory=.,$TEMP		" fix E303 on open file on Windows

" mouse stuff
set mouse=n " enable it for normal mode only (I just want scrolling + window resizing)
set ttymouse=xterm2 " allows (requests) tmux to pass through

" indenting
set softtabstop=4
set tabstop=8 " apparently non-8 can get breaky (see :he 'tabstop')
set shiftwidth=4
set smarttab " insert tabs on the start of a line according to shiftwidth, not tabstop

" toggle highlighting search terms
set hlsearch
" while typing search, start searching
set incsearch
" required for smartcase: searches are case-insensitive
set ignorecase
" ignore case if search pattern is all lowercase, otherwise case-sensitive
set smartcase

" graphical
set number	    " show line numbers
set ruler	    " line at the bottom with (row, col) display
syntax on	    " enable syntax highlighting
set cpoptions+=$    " show $ when making a change to one line - haven't decided whether I like this
set cursorline	    " highlight current line number and line - may get annoying
set scrolloff=5	    " keep 5 lines between cursor and top/bottom of screen

" font choice - both my OSX and Windows platforms have installed fancy Airline fonts
if has("win32") || has("win64")
    " default Windows gVim font breaks on italics
    set guifont=Powerline\ Consolas:h10:b
    let	g:airline_powerline_fonts = 1 " enables fancy characters in airline
    set encoding=utf-8 " should consider adding this to the OSX section or making it global
else
" --- vim-airline ---
    try
	set guifont=DejaVu\ Sans\ Mono\ for\ Powerline " if font is installed
	let g:airline_powerline_fonts = 1 " enables fancy characters in airline
    catch /^Vim\%((\a\+)\)\=:E596/ " font is not installed
	set guifont=Monaco
    endtry
endif
let g:airline_theme = 'understated' 		    " convention says the colours are incompatible. screw convention
set laststatus=2				    " always show statusbar (vim-airline)
set noshowmode					    " don't show eg '-- INSERT --' at the bottom of the screen. vim-airline makes this redundant.
let g:airline#extensions#tabline#enabled = 1	    " enable/disable enhanced tabline.
" these next three are default options, the one after should add buffer #s if I understand correctly but doesn't seem to
let g:airline#extensions#tabline#show_buffers = 1   " enable/disable displaying buffers with a single tab.
let g:airline#extensions#tabline#show_tab_type = 1  " enable/disable displaying tab type (far right)
let g:airline#extensions#tabline#show_tab_nr = 1    " enable/disable displaying tab number in tabs mode.
let g:airline#extensions#tabline#tab_nr_type = 1    " configure how numbers are calculated in tab mode: tab number

" other plugin conf...
let g:ycm_confirm_extra_conf = 0 " automatically load .ycm_extra_conf.py files

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

" vimroom: centre 80-character block on screen
nnoremap <leader>vr :VimroomToggle<CR>

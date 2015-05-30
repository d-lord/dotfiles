" credit and/or reference:
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/

set nocompatible " vi-compatible mode disables a lot of cool functionality

" Required Vundle setup
" http://blog.thomasupton.com/2014/02/migrating-from-pathogen-to-vundle/
" 23/08/14
filetype off
set runtimepath+=~/.vim/bundle/vundle
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'tpope/vim-repeat'
Plugin 'bling/vim-airline'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' } " segfaults in nvim (27 May 2015)
Plugin 'tpope/vim-fugitive'
Plugin 'jpo/vim-railscasts-theme'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-surround'
Plugin 'majutsushi/tagbar'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'Valloric/YouCompleteMe'
Plugin 'runsisi/consolas-font-for-powerline'
Plugin 'Lokaltog/powerline-fonts'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'vim-scripts/wombat256.vim'
Plugin 'tpope/vim-commentary'
Plugin 'gibiansky/vim-latex-objects'
Plugin 'SirVer/ultisnips'
Plugin 'ervandew/supertab'
Plugin 'junegunn/vim-easy-align'
Plugin 'penicolas/simplon.vim'
Plugin 'romainl/Apprentice'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" make YouCompleteMe and eclim play nice
" eclim doesn't feature in Vundle afaik
let g:EclimCompletionMethod = 'omnifunc'


" leader commands
let mapleader = "\\"
" show line numbers relative to the current line
nnoremap <leader>c :set relativenumber!<CR>
" clear the last search (instead of typing /asdfghjkl)
nnoremap <leader><space> :noh<CR>
" toggle paste mode
nnoremap <leader>p :set paste!<CR>

" custom key maps
" experimental: jk to <Esc>
inoremap jk <Esc>
" backspace complements x
nnoremap <BS> hx

" I hate terminals
" iTerm2 must be configured to send these on <C-Tab> and <C-S-Tab>
set <F13>^=[1;2P
set <F14>^=[1;2Q
nmap <F13> :bn<CR>
nmap <F14> :bp<CR>
nmap <C-Tab> :bn<CR>
nmap <C-S-Tab> :bp<CR>

" colorscheme
" if git repo has been checked out OK, custom colorschemes should be present. that's a big "if", so here's some handling.
try
    colorscheme solarized
    set bg=light " my preference in solarized
    let g:solarized_termcolors=256 " neovim truecolor doesn't care, vim does
    " and if we're not using xterm-256color, I'd rather notice immediately
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme murphy
    set bg=dark
endtry


" misc
filetype plugin on		" enable filetype-specific plugins
set backspace=indent,eol,start	" backspace behaves like Word
set virtualedit=all		" let the cursor go in 'invalid' places
set hidden			" enable loading a buffer in a window that already has a modified buffer (modified buffer will stay in memory and ask to be saved on :q)
set wildignore=*.swp,*.bak,*.pyc,*.class " ignore these filetypes when completing with <Tab>
set wildmenu			" enhanced command-line completion
set directory=.,$TEMP		" fix E303 on open file on Windows
set ttimeoutlen=50		" fix delay leaving insert mode esp in airline
set formatoptions+=j		" join comment lines without the comment prefix

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
set cursorline	    " highlight current line number and line - may get annoying
set scrolloff=0	    " keep 0 lines between cursor and top/bottom of screen (ie disabled)

" airline plugin, including font
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
let g:airline_theme = 'solarized' 		    " blends in with windows
set laststatus=2				    " always show statusbar (vim-airline)
set noshowmode					    " don't show eg '-- INSERT --' at the bottom of the screen. vim-airline makes this redundant.
let g:airline#extensions#tabline#enabled = 1	    " enable/disable enhanced tabline.
" these next three are default options, the one after should add buffer #s if I understand correctly but doesn't seem to
let g:airline#extensions#tabline#show_buffers = 1   " enable/disable displaying buffers with a single tab.
let g:airline#extensions#tabline#show_tab_type = 1  " enable/disable displaying tab type (far right)
let g:airline#extensions#tabline#show_tab_nr = 1    " enable/disable displaying tab number in tabs mode.
let g:airline#extensions#tabline#tab_nr_type = 1    " configure how numbers are calculated in tab mode: tab number
"let g:airline#extensions#tabline#buffer_nr_show = 1    " not sure if I want this yet, shows buffer number above

" other plugin conf...

" YouCompleteMe
let g:ycm_confirm_extra_conf = 0 " automatically load .ycm_extra_conf.py files
function! ToggleYCMCompletion() " mapped below
    if g:ycm_auto_trigger == 0
	let g:ycm_auto_trigger=1
    else
	let g:ycm_auto_trigger=0
    endif
endfunction
nmap <Leader>t :call ToggleYCMCompletion()<CR>
" YouCompleteMe and UltiSnips:
" http://stackoverflow.com/questions/14896327/ultisnips-and-youcompleteme
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<Tab>"
let g:UltiSnipsJumpForwardTrigger = "<Tab>"
let g:UltiSnipsJumpBackwardTrigger = "<S-Tab>"

" EasyMotion
" Gif config
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion

" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

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

" vimroom: centre 80-character block on screen
nnoremap <leader>vr :VimroomToggle<CR>

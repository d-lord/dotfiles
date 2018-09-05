let &rtp = substitute(&rtp, "\.config\/nvim", "dotfiles/nvim_rice", "g")
call plug#begin('~/dotfiles/nvim_rice/plugged')
" basic
Plug 'tpope/vim-repeat'
" smart
Plug 'vim-airline/vim-airline'  " commented out for 40ms startup improvement
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' } " :FZF
Plug 'junegunn/fzf.vim' " adds more commands
Plug 'tpope/vim-fugitive' " alarmingly feature-rich
Plug 'airblade/vim-gitgutter' " also alarmingly feature-rich
Plug 'benekastah/neomake' " ft-specific makeprgs like simpatico, shellcheck
" testing
Plug 'rking/ag.vim' " `brew install the_silver_searcher`
Plug 'tpope/vim-sleuth' " auto-detect indent settings
" Plug 'AndrewRadev/sideways.vim' " moving parameters around
" nav
Plug 'Lokaltog/vim-easymotion'
" edit
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround'
" Plug 'gibiansky/vim-latex-objects'  " unused
Plug 'tpope/vim-commentary'
" colorschemes
" Plug 'vim-scripts/ScrollColors' " for testing colorschemes
" Plug 'frankier/neovim-colors-solarized-truecolor-only'  " unused
" Plug 'romainl/Apprentice'
" Plug 'jpo/vim-railscasts-theme'
Plug 'chriskempson/base16-vim'
" Plug 'fenetikm/falcon'
" misc
Plug 'qpkorr/vim-bufkill'
call plug#end()

source ~/dotfiles/nvim_shared/shared.vim

" basics
filetype plugin indent on
syntax on
set hlsearch " highlight search results
set incsearch " start searching while typing search
set ignorecase " required for smartcase: searches are case-insensitive
set smartcase " ignore case if search pattern is all lowercase, otherwise case-sensitive
set number " line numbers
set showcmd " show normal command while typing

" colorscheme
set termguicolors
colorscheme base16-flat
" colorscheme apprentice
" colorscheme falcon
set bg=dark
" minor QoL for quickfix
hi Search ctermfg=8 ctermbg=3 guifg=#95A5A6 guibg=yellow
" bright yellow line number
hi clear CursorLine
hi CursorLineNr term=bold ctermfg=14 gui=bold guifg=Yellow
set cursorline

" mouse
set mouse=ni " enabled, normal and insert mode only

" misc
set backspace=indent,eol,start	" backspace behaves like Word
set virtualedit=all		" let the cursor go in 'invalid' places
set hidden			" enable loading a buffer in a window that already has a modified buffer
set wildignore=*.swp,*.sqo,*.bak,*.pyc,*.class " ignore these filetypes when completing with <Tab>
set wildmenu			" enhanced command-line completion
"set ttimeoutlen=50		" fix delay leaving insert mode esp in airline: is this needed in nvim?
set formatoptions+=j		" join comment lines without the comment prefix
set updatetime=750		" delay until CursorHold event. extra I/O

" scroll during insert mode
inoremap <C-e> <C-o><C-e>
inoremap <C-y> <C-o><C-y>

" leader
nnoremap <leader>e :e ~/dotfiles/nvim_rice/init.vim<CR>

" <C-Tab> and <C-S-Tab> to change buffers
" iTerm2 must be configured to send these on <C-Tab> and <C-S-Tab>. I hate terminals
" set <F13>^=[1;2P
" set <F14>^=[1;2Q
" F13 is ^[ + [25~, F14 is ^[ + [26~
nmap <silent><F13> :bn<CR>
nmap <silent><F14> :bp<CR>
" this 'should' work in nvim, but I think iTerm isn't configured right
" nmap <C-Tab> :bn<CR>
" nmap <C-S-Tab> :bp<CR>
" make it insert mode too
imap <silent><F13> <C-o>:bn<CR>
imap <silent><F14> <C-o>:bp<CR>

" Where to put the window for vim-plug
let g:plug_window = 'topleft new'

" Airline: currently doesn't init quite right (look at top & bottom before &
" after switching to a new buffer)
let g:airline_theme = 'base16'
set laststatus=2 	" always show it
set noshowmode		" don't show '--INSERT--' etc: redundant
let g:airline_powerline_fonts = 1 " use special chars in special font
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1 " display buffers with a single tab
let g:airline#extensions#whitespace#enabled = 0

" EasyMotion
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
nmap s <Plug>(easymotion-s)
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
let g:EasyMotion_smartcase = 1 " type l, match l & L

let g:plug_window='' " defaults to 'vertical topleft new' but I'd rather it used the same window

" quick window navigation
" if <C-h> doesn't work, update neovim - it used to be caused by: https://github.com/neovim/neovim/issues/2048 
:nnoremap <C-h> <C-w>h
:nnoremap <C-j> <C-w>j
:nnoremap <C-k> <C-w>k
:nnoremap <C-l> <C-w>l

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" fzf.vim: quickselect files
imap <c-x><c-f> <plug>(fzf-complete-path)
nnoremap <leader><tab> :FZF<CR>

" vim-bufkill (ie <C-w> c without killing the window too)
nnoremap <C-c> :BD<cr>

" nmap <leader>b :SidewaysLeft<CR>
" nmap <leader>n :SidewaysRight<CR>

nmap <leader>q :FZF ~/quicklinks<CR>

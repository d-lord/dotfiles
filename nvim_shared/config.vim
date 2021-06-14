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

" fzf.vim: quickselect files
" should be configured in the shared plugins.vim
imap <c-x><c-f> <plug>(fzf-complete-path)

" leader
let mapleader = "\\"
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>c :setl bufhidden=delete<CR>:bnext<CR>
nnoremap <leader>p "+p
nnoremap <leader>P "+P
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>s :e ~/.config/nvim_shared/config.vim<CR>
nnoremap <leader>v :v/^\s*[#\n]/p<CR>
nnoremap <leader>Y :%y+<CR>
nnoremap <leader>z :e ~/.zshrc<CR>
nnoremap <leader>q :FZF ~/quicklinks<CR>
nnoremap <leader><tab> :FZF<CR>

" <C-Tab> and <C-S-Tab> to change buffers
" iTerm2 must be configured to send these on <C-Tab> and <C-S-Tab>. I hate terminals
" F13 is ^[ + [25~, F14 is ^[ + [26~
set <F13>^=[1;2P
set <F14>^=[1;2Q
nmap <silent><F13> :bn<CR>
nmap <silent><F14> :bp<CR>
" make it insert mode too
imap <silent><F13> <C-o>:bn<CR>
imap <silent><F14> <C-o>:bp<CR>
" this 'should' work in nvim, but I think iTerm isn't configured right
" nmap <C-Tab> :bn<CR>
" nmap <C-S-Tab> :bp<CR>

" Where to put the window for vim-plug
let g:plug_window = 'topleft new'

" quick window navigation
" if <C-h> doesn't work, update neovim - it used to be caused by: https://github.com/neovim/neovim/issues/2048 
:nnoremap <C-h> <C-w>h
:nnoremap <C-j> <C-w>j
:nnoremap <C-k> <C-w>k
:nnoremap <C-l> <C-w>l

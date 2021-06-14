call plug#begin('~/dotfiles/nvim_rice/plugged')
" basic
Plug 'tpope/vim-repeat'
" smart
Plug 'vim-airline/vim-airline'  " commented out for 40ms startup improvement
Plug 'vim-airline/vim-airline-themes'
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
" special - shared
source ~/.config/nvim_shared/plugins.vim
call plug#end()

source ~/.config/nvim_shared/config.vim
nnoremap <leader>e :e ~/.config/nvim_rice/init.vim<CR>

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

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" vim-bufkill (ie <C-w> c without killing the window too)
nnoremap <C-c> :BD<cr>

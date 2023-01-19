call plug#begin('~/dotfiles/nvim_rice/plugged')
" basic
Plug 'tpope/vim-repeat'
" smart
Plug 'vim-airline/vim-airline'  " commented out for 40ms startup improvement
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive' " alarmingly feature-rich
Plug 'airblade/vim-gitgutter' " also alarmingly feature-rich
Plug 'benekastah/neomake' " ft-specific makeprgs like simpatico, shellcheck
" language server and other fancy shit
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" nav
Plug 'Lokaltog/vim-easymotion'
Plug 'rking/ag.vim' " `brew install the_silver_searcher`
" edit
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
" Plug 'AndrewRadev/sideways.vim' " moving parameters around
" colorschemes
Plug 'vim-scripts/ScrollColors' " for testing colorschemes
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

" language servers
lua require 'lspconfig'.terraformls.setup{}

" tree-sitter
lua << EOF
require 'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "vim", "lua", "hcl"
  },
  auto_install = true,
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
	enable = true,
	keymaps = {
	  init_selection = "<A-Up>", -- set to `false` to disable one of the mappings
	  node_incremental = "<A-Up>",
	  node_decremental = "<A-Down>",
	},
  },
}
EOF

" fold with treesitter
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable  " don't automatically fold files when you open them

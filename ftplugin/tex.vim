" reserves mark y as a temporary mark
" (is there a better way?)

" append a newline (\\) to the current line, then restore position
nnoremap <leader>x myA\\<Esc>`y
" save and run make (assumes a makefile exists in cd)
nnoremap <leader>m :w<CR>:make<CR>

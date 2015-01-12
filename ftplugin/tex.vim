" reserves mark y as a temporary mark
" (is there a better way?)

" append a newline (\\) to the current line, then restore position
nnoremap <leader>x myA\\<Esc>`y
" save and run pdflatex
nnoremap <leader>m :w<CR>:silent !pdflatex %<CR>

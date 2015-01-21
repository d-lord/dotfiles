" reserves mark y as a temporary mark
" (is there a better way?)

" append a newline (\\) to the current line, then restore position
nnoremap <leader>x myA\\<Esc>`y

" Skim.app
" save, pdflatex, jump skim to current line
nnoremap <leader>m :w<CR>:silent !pdflatex -synctex=1 --interaction=nonstopmode %:p <CR>:silent !/Applications/Skim.app/Contents/SharedSupport/displayline -r <C-r>=line(".")<CR> %<.pdf %<CR><CR>
" jump skim to current line
nnoremap <leader>v :silent !/Applications/Skim.app/Contents/SharedSupport/displayline -r <C-r>=line(".")<CR> %<.pdf %<CR><CR>

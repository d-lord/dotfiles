" reserves mark y as a temporary mark
" (is there a better way?)

" append a newline (\\) to the current line, then restore position
nnoremap <buffer> <leader>x myA\\<Esc>`y

" Skim.app
" save, pdflatex, jump skim to current line
nnoremap <buffer> <leader>m :w<CR>:silent !pdflatex -synctex=1 --interaction=nonstopmode %:p <CR>:silent !/Applications/Skim.app/Contents/SharedSupport/displayline -r <C-r>=line(".")<CR> %<.pdf %<CR>
" jump Skim to current line and restore focus: assumes MacVim
nnoremap <buffer> <leader>r :silent !/Applications/Skim.app/Contents/SharedSupport/displayline -r <C-r>=line(".")<CR> %<.pdf %<CR>:silent !osascript -e "tell application \"MacVim\" to activate" <CR>

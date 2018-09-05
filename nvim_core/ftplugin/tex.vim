" reserves mark y as a temporary mark
" (is there a better way?)

" stop the strange double-indenting in itemize
let g:tex_indent_items=0

" append a newline (\\) to the current line, then restore position
nnoremap <buffer> <leader>x myA\\<Esc>`y

" Skim.app
" save, pdflatex, jump skim to current line
nnoremap <buffer> <leader>m :w<CR>:silent !pdflatex -synctex=1 --interaction=nonstopmode %:p <CR>:silent !/Applications/Skim.app/Contents/SharedSupport/displayline -r <C-r>=line(".")<CR> %<.pdf %<CR>
" jump Skim to current line and restore focus: assumes MacVim
nnoremap <buffer> <leader>r :w<CR>:silent !/Applications/Skim.app/Contents/SharedSupport/displayline -r <C-r>=line(".")<CR> %<.pdf %<CR>:silent !osascript -e "tell application \"MacVim\" to activate" <CR>

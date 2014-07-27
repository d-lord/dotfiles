" copied straight from vimrc where these settings were doing work for all filetypes
" so this is very much a work in progress
setlocal softtabstop=4
setlocal tabstop=8 " apparently non-8 can get breaky (see :he 'tabstop')
setlocal shiftwidth=4
setlocal smarttab " insert tabs on the start of a line according to shiftwidth, not tabstop
" setlocal autoindent
setlocal smartindent " better support for comments and code within a function
setlocal foldmethod=syntax " automatic folding on syntax
setlocal foldlevel=99
" display the ctags sidebar
TagbarOpen
nmap <F7> :TagbarToggle<CR>
nnoremap <S-F7> :call Bclose()<CR>
"
" Bclose() {{{2
" delete buffer without closing window
function! Bclose()
    let curbufnr = bufnr("%")
    let altbufnr = bufnr("#")

    if buflisted(altbufnr)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == curbufnr
        new
    endif

    if buflisted(curbufnr)
        execute("bdelete! " . curbufnr)
    endif
endfunction
" does this do anything?
let g:airline#extensions#tagbar#enabled = 1

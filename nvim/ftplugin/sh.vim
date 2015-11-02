" shellcheck is available in homebrew; if not installed, :make will give a
" helpful error
autocmd! BufWritePost * Neomake
" these work for regular :make but Dispatch doesn't expand the % and Neomake
" inherently supports shellcheck

" credit to http://jezenthomas.com/shell-script-static-analysis-in-vim/
" set makeprg=shellcheck\ -f\ gcc\ %
" au BufWritePost * :silent make | redraw!

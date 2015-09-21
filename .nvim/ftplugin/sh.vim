" credit to http://jezenthomas.com/shell-script-static-analysis-in-vim/
" shellcheck is available in homebrew; if not installed, :make will give a
" helpful error
set makeprg=shellcheck\ -f\ gcc\ %
au BufWritePost * :silent make | redraw!

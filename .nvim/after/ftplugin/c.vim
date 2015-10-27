setlocal makeprg=simpatico\ %
setlocal efm=%-PParsing\ %f%.%.%.
" autocmd! BufWritePost *.c,*.h :silent make | redraw!
autocmd! BufWritePost *.c,*.h :Neomake!
" set efm+=line\ %l\ :\ [BRACES]\ at\ position\ %c%m
" set efm+=line\ %l\ :\ [WHITESPACE]\ at\ position\ %c%m
setlocal efm+=line\ %l\ :\ %m
setlocal efm+=%-G%*\\d\ total\ errors\ found%m
setlocal efm+=%-G[1mTHIS\ IS\ NOT\ A\ GUARANTEE\ OF\ CORRECTNESS[0m
setlocal efm+=%-G[1mTHE\ STYLE\ GUIDE\ IS\ FINAL[0m

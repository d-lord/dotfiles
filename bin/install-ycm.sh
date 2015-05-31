#!/bin/bash
if [[ -f .vim/bundle/YouCompleteMe/third_party/ycmd/ycm_client_support.so && -f .vim/bundle/YouCompleteMe/third_party/ycmd/ycm_core.so ]];
then 
    echo 'Skipping: seems to be installed'
else 
    ./.vim/bundle/YouCompleteMe/install.sh --clang-completer; 
fi

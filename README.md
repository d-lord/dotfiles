### Installation

    git clone git://github.com/d-lord/dotvim.git ~/.vim

    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc

    cd ~/.vim
    git clone https://github.com/gmarik/Vundle.vim.git bundle/vundle
    vim "+colorscheme desert" +PluginInstall +qall

    cd ~/.vim/bundle/YouCompleteMe
    ./install.sh --clang-completer

### Maintenance
Adding plugins:

    see point 3 of "Quick Start": https://github.com/gmarik/Vundle.vim

Updating plugins:

    :PluginUpdate
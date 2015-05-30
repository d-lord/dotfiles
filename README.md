### Installation

    git clone git://github.com/d-lord/dotfiles.git ~/dotfiles

    ln -s ~/dotfiles/.vim .vim
    ln -s ~/dotfiles/.nvim .nvim

    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc

    ln -s ~/.nvim/nvimrc ~/.nvimrc

    ln -s ~/dotfiles/.inputrc ~/.inputrc
    ln -s ~/dotfiles/.bashrc ~/.bashrc
    ln -s ~/dotfiles/.bash_profile ~/.bash_profile
    ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
    ln -s ~/dotfiles/.bash/ ~/.bash

    cd ~/.vim
    git clone https://github.com/gmarik/Vundle.vim.git bundle/vundle
    vim "+colorscheme desert" +PluginInstall +qall

    cd ~/.vim/bundle/YouCompleteMe
    ./install.sh --clang-completer

    cd ~/.nvim
    # not sure how necessary this is - what's the plugin overlap?
    nvim "+colorscheme desert" +PluginInstall +qall

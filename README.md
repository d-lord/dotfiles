### Installation

    git clone git://github.com/d-lord/dotfiles.git ~/dotfiles

    ~/install # dotbot

## Notes
Vim (esp. complex plugins) may complain about Python if that's not installed (use homebrew)

Tmux will quit with "[exited]" if homebrew hasn't been used to install `reattach-to-user-namespace`

Fedora needs `dnf install xsel` to enable clipboard in [n]vim

## Vim stuff

Two interlinked versions of neovim are here:

* vim core - Lightweight, quick-launching copy.
* vim rice (vice) - Fuller of feature.

So there are three sets of files:

* nvim_shared - Config shared between both. This is where most keybinds should live, as well as plugins used by both.
* nvim_core - Config (especially plugins) used by the lightweight instance.
* nvim_rice - Config used by the heavyweight instance.

Common binds are:

* <leader>e - Edit "my" config (core or rice)
* <leader>s - Edit the shared config

Shared files are:
* plugins.vim - should only contain stuff for vim-plug, i.e. just <Plug> declarations and comments.
* config.vim - shared configuration and keybinds, including any config for shared plugins.

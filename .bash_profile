# load config from .bashrc
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

export PATH=/usr/local/bin:$PATH

# MacPorts
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# NeoVim - only available on iTerm nightly build (as of 2 Apr 2015)
export NVIM_TUI_ENABLE_TRUE_COLOR=1
export EDITOR=nvim

irssi_notifier() {
    ssh dal@howbad.ru 'echo -n "" > ~/.irssi/fnotify; tail -f ~/.irssi/fnotify' | \
            while read heading message; do
            url=`echo \"$message\" | grep -Eo 'https?://[^ >]+' | head -1`;

            if [ ! "$url" ]; then
                terminal-notifier -title "\"$heading\"" -message "\"$message\"" -activate com.apple.Terminal;
            else
                terminal-notifier -title "\"$heading\"" -message "\"$message\"" -open "\"$url\"";
            fi;
        done
    }

alias ls='ls -G'
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
cd () 
{ 
    builtin cd "$*";
    ls;
}

alias rc='source ~/.bashrc'

# this seems to interact poorly with fzf (see bashrc)
# source /Users/David/.iterm2_shell_integration.bash

# http://serverfault.com/a/695107/262337
# to action e.g. the command labelled 180, run !180
alias h='history|grep'

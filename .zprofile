# Put $PATH manipulation in here unless it can go after system PATH stuff.
# More info: `man zsh` -> "STARTUP/SHUTDOWN FILES".

# Added by Toolbox App
export PATH="$PATH:/Users/dal/Library/Application Support/JetBrains/Toolbox/scripts"

# Homebrew
if [[ $(uname -p) == 'arm' ]]; then
  export PATH=/opt/homebrew/bin:$PATH
  export PATH=/opt/homebrew/sbin:$PATH
else
  export PATH=/usr/local/bin:$PATH
  export PATH=/usr/local/sbin:$PATH
fi

# doom emacs
export PATH=$PATH:~/.config/emacs/bin

# mine
export PATH=~/bin:$PATH

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/freeusr/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# spell check commands!  (Sometimes annoying)
setopt CORRECT

# Don't overwrite, append!
setopt APPEND_HISTORY

# Set prompt format
#PS1="%n@%M:%d$"
PS1="%*:%d$"

# Aliaces file
source ~/.bash_aliases

# Disable cursor blinking
printf '\033[?12l'

#set vim as default editor
export EDITOR=vim

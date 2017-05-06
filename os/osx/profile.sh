###########################
# Oh-my-zsh configuration #
###########################

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# The ZSH theme to use
ZSH_THEME="agnoster"
# ZSH_THEME="bullet-train"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(brew bundler docker gem git hacker-quotes rails rbenv ruby sublime)

# Load the oh-my-zsh configuraiton file
source $ZSH/oh-my-zsh.sh

#########################
# General configuration #
#########################

# Export PATH
export PATH=/usr/local/bin:$HOME/bin:/usr/local/sbin:/usr/local/share/npm/bin:$PATH

# Put brew's ruby in front
#export PATH=/usr/local/opt/ruby/bin:$PATH

# Use gnu tools instead
export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH

# Setup rbenv and pyenv
export RBENV_ROOT=/usr/local/var/rbenv
eval "$(rbenv init -)"
eval "$(pyenv init -)"
eval "$(nodenv init -)"

# Use Sublime Text as default editor
export EDITOR="subl"

# Stop Homebrew analytics
export HOMEBREW_NO_ANALYTICS=1

# Add bash completion (for git and others)
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# Lunchy tab completion
LUNCHY_DIR=$(dirname `gem which lunchy` | sed -e "s/lib$/extras/")
if [ -f $LUNCHY_DIR/lunchy-completion.zsh ]; then
  . $LUNCHY_DIR/lunchy-completion.zsh
fi

# alias psql=/usr/local/opt/postgresql/bin/psql

# Setup thefuck
eval "$(thefuck --alias fix)"

###########
# Aliases #
###########

# Display all the dotfiles of a particular directory
alias ldot='ls -ld .*'

# Color ls
alias la='pwd; ls -ahGF'

# Display as a list
alias ll='pwd; ls -1ah'

# Display the insides of a particular director
alias lv='pwd; ls -R'

###########

ansiweather

# eval "$(docker-machine env dev)"
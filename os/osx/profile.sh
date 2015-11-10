#########################
# General configuration #
#########################

### MOTD Script ### 
# Doing this first so I can read the motd while everything else gets loaded
if [[ -e $HOME/.motd ]]; then cat $HOME/.motd; fi

# Export PATH
export PATH=/usr/local/bin:$HOME/bin:/usr/local/sbin:/usr/local/share/npm/bin:$PATH

# Put brew's ruby in front
export PATH=/usr/local/opt/ruby/bin:$PATH

# Use gnu tools instead
export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH

# Setup rbenv and pyenv
export RBENV_ROOT=/usr/local/var/rbenv
eval "$(rbenv init -)"
eval "$(pyenv init -)"

# Use Sublime Text as default editor
EDITOR="subl"

# Add bash completion (for git and others)
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

###########
# Aliases #
###########

# Color ls
alias ls='pwd; ls --color=auto -ahF'

# Display as a list
alias ll='pwd; ls -1ah'

# Display the insides of a particular directory
alias lv='pwd; ls -R'

alias work='cd ~/code/work/;pwd;ls;'

# alias psql=/usr/local/opt/postgresql/bin/psql

###########################
# Oh-my-zsh configuration #
###########################

# Path to your oh-my-zsh installation.
export ZSH=/Users/johnkacz/.oh-my-zsh

# The ZSH theme to use
ZSH_THEME="agnoster"

# TODO - decide which plugins you want
# The plugins to use in the zsh shell
# plugins=(atom git gradle mvn npm bower brew)

# Load the oh-my-zsh configuraiton file
source $ZSH/oh-my-zsh.sh

eval "$(docker-machine env dev)"

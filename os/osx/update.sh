#!/usr/bin/env bash
set -e

# Show banner
echo -e "###########################"
echo -e "# Updating the system ... #"
echo -e "###########################"
echo

# update OS X software packages
echo -e "\t- Updating the OS X app store applications ..."
softwareupdate -ia

# update brew and installed binaries
echo -e "\t- Updating the apps and binaries ..."
brew update
brew upgrade

# update oh-my-zsh
if test $(which upgrade_oh_my_zsh); then
  echo -e "\t- Updating oh-my-zsh ..."
  upgrade_oh_my_zsh
fi
  
# cleanup
echo -e "\t- Cleaning up homebrew ..."
  brew cleanup
  brew cask cleanup
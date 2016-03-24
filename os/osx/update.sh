#!/usr/bin/env bash
set -eu

# update OS X software packages
echo "Updating the OS X app store applications ..."
softwareupdate -ia

# update brew and installed binaries
echo "Updating the binaries ..."
brew update
brew upgrade

# update oh-my-zsh
upgrade_oh_my_zsh

# cleanup
echo "Cleaning up ..."
brew cleanup
brew cask cleanup

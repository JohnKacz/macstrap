#!/usr/bin/env bash
set -eu

# Update homebrew and homebrew cask
brew update
brew upgrade brew-cask || true

# Load the apps/casks/atom packages from the config file
source $config

# Install apps
echo ""
echo -e "Installing apps ..."
brew cask install ${apps[@]}

# Install atom packages
# echo ""
# echo "Installing atom packages ..."
# apm install ${atomPackages[@]}

# Remove outdated versions from the cellar
echo ""
echo ""
echo "Cleaning up..."
echo ""
brew cleanup
brew cask cleanup

exit 0

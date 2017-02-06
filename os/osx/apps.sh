#!/usr/bin/env bash
set -eu

# Update homebrew
brew update

# Load the apps/casks/atom packages from the config file
source $config

# Install apps
echo ""
echo -e "Installing apps ..."
brew cask install ${apps[@]}

# TODO: This won't currently work with 2FA
# Install apps from Mac App Store with mas
# echo ""
# echo -e "Installing apps from Mac App Store ..."
# mas signin $MAS_USER $MAS_PASS
# mas install ${mas[@]}

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

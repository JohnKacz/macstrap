#!/usr/bin/env bash
set -eu

# Update homebrew
brew update

# Install more recent versions of some OS X tools
brew tap homebrew/dupes
brew install homebrew/dupes/grep

# Load the binaries and the global NPM packages from the config file
source $config

# Install the binaries
echo ""
echo "Installing binaries..."
brew install ${binaries[@]}

# Install the latest stable node version and the global npm packages
# TODO - Check to see if nvm is installed first
echo ""
echo "Installing latest stable version of node..."
nvm install stable
nvm alias default stable
echo "Installing global npm packages..."
npm install -g ${globalNpmPackages[@]}

# Install the latest stable ruby version and the global ruby gems
# TODO - Check to see if rbenv is installed first
echo ""
echo "Installing latest stable version of ruby..."
rbenv init -
latestRubyVersion=$(rbenv install -l | grep -v - | tail -1)
rbenv install $latestRubyVersion
rbenv global $latestRubyVersion
echo "Updating RubyGems system software..."
gem update --system
echo "Installing default ruby gems..."
gem install -g ${globalRubyGems[@]}

# Install the latest stable python version
# TODO - Check to see if rbenv is installed first
echo ""
echo "Installing latest stable version of python..."
pyenv init -
latestPythonVersion=$(pyenv install -l | grep -v - | grep -v b | tail -1)
pyenv install $latestPythonVersion
pyenv global $latestPythonVersion

# Install oh-my-zsh
echo ""
echo "Installing oh-my-zsh..."
curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh

# Remove outdated versions from the cellar
echo ""
echo ""
echo "Cleaning up..."
echo ""
brew cleanup

exit 0

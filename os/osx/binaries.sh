#!/usr/bin/env bash
set -e

# Update homebrew
brew update

# Load the binaries and the global NPM packages from the config file
source $config

# Show banner
echo -e "#######################################################"
echo -e "# Installing the binaries and global NPM packages ... #"
echo -e "#######################################################"
echo

# Install binaries
if [ ${#binaries} -gt 0 ]; then
    echo -e "\t- Installing binaries ..."
    brew install ${binaries[@]}
else
    echo -e "\t- No binaries defined in macstrap configuration."
fi

# # Install the latest stable ruby version and the global ruby gems
# if test ! $(which rbenv); then
#   echo -e "\t- Installing latest stable version of ruby..."
#   rbenv init -
#   latestRubyVersion=$(rbenv install -l | grep -v - | tail -1)
#   rbenv install $latestRubyVersion
#   rbenv rehash
#   rbenv global $latestRubyVersion

#   if [ ${#globalRubyGems} -gt 0 ]; then
#     echo -e "\t- Installing default Ruby gems within the rbenv default..."
#     sudo gem install ${globalRubyGems[@]} -N
#     rbenv rehash
#   else
#     echo -e "\t- No default Ruby gems defined in macstrap configuration."
#   fi
# else
#   echo -e "\t- rbenv not installed. Skipping Ruby and gems installation"
# fi

# # Install the latest stable python version
# if test ! $(which pyenv); then
#   echo -e "\t- Installing latest stable version of python..."
#   pyenv init -
#   latestPythonVersion=$(pyenv install -l | grep -v -e '-\|a\|b' | tail -1)
#   pyenv install $latestPythonVersion
#   pyenv rehash
#   pyenv global $latestPythonVersion
  
#   if [ ${#globalPythonPackages} -gt 0 ]; then
#     echo -e "\t- Installing default Python packages within the pyenv default..."
#     pip install ${globalPythonPackages[@]} -U || true
#     pyenv rehash
#   else
#     echo -e "\t- No default Python packages defined in macstrap configuration."
#   fi
# else
#   echo -e "\t- pyenv not installed. Skipping Python and packages installation"
# fi

# # Install the latest stable node version and the global npm packages
# if test ! $(which nodenv); then
#   echo -e "\t- Installing latest stable version of node..."
#   nodenv init -
#   latestNodeVersion=$(nodenv install -l | grep -v - | tail -2 | head -n 1)
#   nodenv install $latestNodeVersion
#   nodenv rehash
#   nodenv global $latestNodeVersion

#   if [ ${#globalNpmPackages} -gt 0 ]; then
#     echo -e "\t- Installing global NPM packages within the nodenv default..."
#     npm install -g ${globalNpmPackages[@]}
#     nodenv rehash
#   else
#     echo -e "\t- No global NPM packages defined in macstrap configuration."
#   fi
# else
#   echo -e "\t- nodenv not installed. Skipping Node and packages installation"
# fi

# Install oh-my-zsh
echo -e "\t- Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Remove outdated versions from the cellar
echo
echo
echo -e "Cleaning up..."
echo
brew cleanup

exit 0

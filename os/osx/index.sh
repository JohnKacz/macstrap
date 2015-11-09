#!/usr/bin/env bash
set -eu

# modules
source "$lib/symlink/index.sh"
source "$lib/is-osx/index.sh"

# Only run if on a Mac
if [[ 0 -eq `osx` ]]; then
  exit 0
fi

# exit 1
# paths
osx="$os/osx"

# Run each program
echo ""
echo "Would you like to set some system defaults? (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  sh "$osx/defaults.sh"
fi
echo ""
echo "Would you like to install default binaries, npm packages and ruby gems? (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  sh "$osx/binaries.sh"
fi
echo ""
echo "Would you like to install default applications? (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  sh "$osx/apps.sh"
fi

# Symlink the .bash_profile configuration file
if [[ ! -e "$HOME/.profile" ]]; then
  ln -s "$osx/profile.sh" "$HOME/.profile"
  echo -e "Symlinked \033[1m$osx/profile.sh\033[0m => \033[1m$HOME/.profile\033[0m"
  source $HOME/.profile
else
  echo -e "\033[1m$HOME/.profile\033[0m already exists. Please remove it and bootstrap again."
fi

echo ""
echo "All done. Enjoy your new setup."

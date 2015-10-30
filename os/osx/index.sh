#!/usr/bin/env bash
set -eu

# Only run if on a Mac
if [[ 0 -eq `osx` ]]; then
  exit 0
fi

# exit 1
# paths
osx="$os/osx"

# Run each program
echo ""
echo "Setting sensible defaults..."
sh "$osx/defaults.sh"
echo ""
echo "Installing default binaries, npm packages and ruby gems..."
sh "$osx/binaries.sh"
echo ""
echo "Installing default apps..."
sh "$osx/apps.sh"

# Symlink the .bash_profile configuration file
if [[ ! -e "$HOME/.bash_profile" ]]; then
  ln -s "$osx/profile.sh" "$HOME/.bash_profile"
  echo -e "Symlinked \033[1m$osx/profile.sh\033[0m => \033[1m$HOME/.bash_profile\033[0m"
  source $HOME/.bash_profile
else
  echo -e "\033[1m$HOME/.bash_profile\033[0m already exists. Please remove it and bootstrap again."
fi

# Symlink the .zshrc configuration file
if [[ ! -e "$HOME/.zshrc" ]]; then
  ln -s "$osx/profile.sh" "$HOME/.zshrc"
  echo -e "Symlinked \033[1m$osx/profile.sh\033[0m => \033[1m$HOME/.zshrc\033[0m"
  source $HOME/.zshrc
else
  echo -e "\033[1m$HOME/.zshrc\033[0m already exists. Please remove it and bootstrap again."
fi

echo ""
echo "All done. Enjoy your new setup."

#!/usr/bin/env bash
set -e

# Update homebrew
brew update

# Load the apps/casks/atom packages from the config file
source $config


# Show banner
echo -e "#############################################"
echo -e "# Installing the apps and atom packages ... #"
echo -e "#############################################"
echo

# Install apps
if [ ${#apps} -gt 0 ]; then
    echo -e "\t- Installing apps ..."
    brew cask install ${apps[@]}
else
    echo -e "\t- No apps defined in macstrap configuration."
fi

# Install apps from Mac App Store with mas
if test ! $(which mas); then
  echo
  echo -e "\t- Logging in the Mac App Store with mas. (https://github.com/mas-cli/mas)"
  mas signin $MAS_USER $MAS_PASS
  echo -e "\t\tDo you need to provide 2FA? (y/n)"
  read -r response
  if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    echo
    echo -e "\t\tPlease provide you 2FA code:"
    read -r TWOFA
    mas signin $MAS_USER $MAS_PASS$TWOFA
  fi
  
  if [ ${#mas} -gt 0 ]; then
      echo -e "\t- Installing apps from the Mac App Store."
      mas install ${mas[@]}
  else
      echo -e "\t- No apps from the Mac App Store in the macstrap configuration."
  fi
else
  echo -e "\t- mas not installed. Skipping Mac App Store apps installation"
fi

# # Install atom packages
# if [ ${#atomPackages} -gt 0 ]; then
#     echo -e "\t- Installing atom packages ..."
#     apm install ${atomPackages[@]}
# else
#     echo -e "\t- No atom packages defined in macstrap configuration."
# fi

# Remove outdated versions from the cellar
echo
echo
echo -e "Cleaning up..."
echo
brew cleanup
brew cask cleanup

exit 0

#!/usr/bin/env bash
set -eu

# macstrap main
main() {

  # paths
  export dirname=$(dirname $(realpath $0))
  export lib="$dirname/lib"
  export os="$dirname/os"
  export config="$HOME/.macstrap/macstrap.cfg"

  source "$dirname/version.sh"

  if [ $# -eq 0 ]; then
    # if no argument is present show the usage
    usage
    exit
  else
    # run command
    case $1 in
      -v | --version )
        echo "macstrap ${version}"
        mackup --version
        exit
        ;;
      -h | --help )
        usage
        exit
        ;;
      boot )
        sh "$os/osx/index.sh"
        exit
        ;;
      update )
        sh "$os/osx/update.sh"
        exit
        ;;
      "upgrade" )
        upgrade
        exit
        ;;
      backup )
        echo "mackup backup"
        exit
        ;;
      restore )
        echo "mackup restore"
        exit
        ;;
      *)
        usage
        exit
        ;;
    esac
  fi
}

# usage info
usage() {
  source "$dirname/banner.sh"

  cat <<EOF

  Usage: macstrap [options] [command] [args ...]

  Options:

    -v, --version           Get the version
    -h, --help              This message

  Commands:

    boot                    Bootstrap OS X and install all configured apps, binaries etc.
    update                  Update all apps, binaries etc. and all OS X app store applications
    upgrade                 Update macstrap to the latest version
    backup                  Backup the app configurations with mackup
    restore                 Restore the app configurations with mackup

EOF
}

# update macstrap via git
upgrade() {
  # TODO - Don't update macstrap if version is current
  echo "Updating macstrap ..."
  mkdir -p /tmp/macstrap \
    && cd /tmp/macstrap \
    && curl -L https://github.com/johnkacz/macstrap/archive/master.tar.gz | tar zx --strip 1 \
    && sh ./install.sh \
    && echo "Updated macstrap from version $version to $(macstrap --version)" \
    && cd ~/
  exit
}

# "readlink -f" shim for Mac OS X
realpath() {
  target=$1
  cd `dirname $target`
  target=`basename $target`

  # iterate down a (possible) chain of symlinks
  while [ -L "$target" ]
  do
      target=`readlink $target`
      cd `dirname $target`
      target=`basename $target`
  done

  dir=`pwd -P`
  echo $dir/$target
}

# call main
main "$@"

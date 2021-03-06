# macstrap

> Easily setup your OS X from scratch.

macstrap is a command line tool to simplify the initial setup or the reinstallation of command line tools and GUI 
applications in OS X. To install and keep them up to date macstrap uses [homebrew](http://brew.sh) for the command 
line tools and [homebrew cask](http://caskroom.io) for the GUI applications.

When a reinstallation of an already setup OS X is needed then macstrap is able to first store the configuration of the
configured applications for example in a dropbox folder, on an external hard drive, etc. to be able to restore it
again when the OS X is reinstalled. This saves you time and additionally you have a backup of your application configurations.
Underneath macstrap uses [mackup](https://github.com/lra/mackup) to store and retrieve the configurations again.

## Installation and update

To install or update macstrap you just need to execute the following line.

```
mkdir -p /tmp/macstrap && cd /tmp/macstrap && curl -L https://github.com/johnkacz/macstrap/archive/master.tar.gz | tar zx --strip 1 && sh ./install.sh && cd ~
```

This will install macstrap to the `/usr/local/lib` folder and create proper symlinks in the `/usr/local/bin` folder such     
that you are easily able to execute the `macstrap` command on the command line. It will also install the following required
applications:

* The OS X command line tools which macstrap needs for Git
* [homebrew](http://brew.sh) to install the command line tools.
* [homebrew cask](http://caskroom.io) to install the GUI applications.
* [mackup](https://github.com/lra/mackup) to store and retrieve the application configurations.

If you already have macstrap installed the install script will replace the old version and keep your configurations.
 
## Usage

macstrap comes with some default commands with which you are able to bootstrap your OS X, update it or save and restore
your application configuration.

### Configuration

macstrap is highly configurable and you are able to select which command line tools or GUI applications you want to install.
For that open the `~/.macstrap/macstrap.cfg` configuration file and follow the instructions there.

# Acknowledgements

macstrap itself is a fork of the [dots](https://github.com/matthewmueller/dots) project which has the base functionality
to install and update the command line tools and the GUI applications. So please also have a look at this project if you
also need the same functionality for Ubuntu. At this point I want to thank Matthew for his nice work.

# License

macstrap is available under the MIT license.

(c) Matthew Mueller - Forked project (https://github.com/matthewmueller/dots)

(c) Christopher Simpkins - Hack font (https://github.com/powerline/fonts/tree/master/Hack)

(c) Ethan Schoonover - Solarized iTerm2 theme (https://github.com/altercation/solarized)

(c) Modifications by Guy Brand

(c) Further modifications by John Kaczmarek

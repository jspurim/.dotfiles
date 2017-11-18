# My dotfiles

**WARNING:** No configuration is backed up by the scripts in this repository. Use at your own risk. 

This is my own dotfiles repository. It's structured in modules, and uses a convention over configuration philosophy.
The system is designed to work for Ubuntu like linux distros. It may work for other distros but I have not tested.

Feel free to take whatever you want =)

## Usage

The repository should be cloned in the `~/.dotfiles` directory. Once clone all configuration can be applied by running `~/.dotfiles/install.sh`

## Modules
Each folder in this repo is a module. When the global `install.sh` is run the following happens for each module:

1. The module's `install.sh` script is run. Programs, libraries and plugins can be `apt-get`ed here.
2. All files ending in `.symlink` within the module are simlinked from the home folder. The `.symlink` extension is removed in the link. For example a file `.bar.symlink` in module `foo` will be linked from `~/.bar`
3. All files ending in `.autostart` within the module are symlinked (without the `.autostart` suffix) from the `~/.config/autostart` folder. This is used to add `.desktop` files to that folder which cause applications to run on startup.
4. The contents of the module's `env` file (if it exists) are appended to `.environment` file, which can then be sourced by the initialization file of the shell.

## TODOS

The following things you may expect from a more developed dotfiles system are not present, keep it in mind:

* Backing up old configuration
* Selectively installing modules
* Skipping unecessary steps

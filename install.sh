#! /bin/bash

DOTFILES_FOLDER=~/.dotfiles

install_module(){
  MODULE_NAME=$1
  MODULE_FOLDER="$DOTFILES_FOLDER/$MODULE_NAME"
  MODULE_INSTALL_SCRIPT="$MODULE_FOLDER/install.sh"

  # Run the install script for the module
  if [[ -f $MODULE_INSTALL_SCRIPT ]]; then
    bash $MODULE_INSTALL_SCRIPT
  fi

  # Link all symlinks
  for link_target in $(find $MODULE_FOLDER -name '*.symlink'); do
    LINK="${link_target%.*}"
    ln -s $link_target $LINK 
  done

}

for entry in $(ls $DOTFILES_FOLDER); do
  if [[ -d "$DOTFILES_FOLDER/$entry" ]];then
    install_module $entry
  fi
done

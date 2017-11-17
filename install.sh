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
  for link_target in $(cd $MODULE_FOLDER && find . -name '*.symlink' | cut -d / -f2-); do
    LINK=~/${link_target%.*}
    rm -f $LINK
    ln -s "$MODULE_FOLDER/$link_target" $LINK 
  done

  # Link autostart .desktop files
  for link_target in $(cd $MODULE_FOLDER && find -name '*.autostart' | cut -d / -f2-); do
    LINK=~/.config/autostart/${link_target%.*}
    rm -f $LINK
    ln -s $MODULE_FOLDER/$link_target $LINK
  done
}

for entry in $(ls $DOTFILES_FOLDER); do
  if [[ -d "$DOTFILES_FOLDER/$entry" ]];then
    install_module $entry
  fi
done

